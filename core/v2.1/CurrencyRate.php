<?php

/**
 * 获取实时汇率，使用雅虎金融实时汇率接口
 * @Author: Today Nie
 * @Created: 2016-01-29
 */

class CurrencyRate {
	private static $inst;
	private static $currencyArray;
	private static $rates;
	private static $apiUrl;

	/**
	 * 由于使用文件保存汇率数据，不方便更新加入新的汇率，所以此方法只在内部使用
	 */
	private static function addCurrency( $currency ) {
		$currency = strtoupper( $currency );
		foreach ( self::instance()->currencyArray as $c ) {
			if ( $c == $currency ) return;
		}
		self::instance()->currencyArray[] = $currency;
	}

	private static function instance() {
		if ( ! isset( self::$inst ) ) {
			self::$inst = new self();
			self::$inst->apiUrl = 'http://query.yahooapis.com/v1/public/yql';
			self::$inst->addCurrency( 'CADAUD' );
			self::$inst->addCurrency( 'CADUSD' );
			self::$inst->addCurrency( 'CADCNY' );
			self::$inst->addCurrency( 'AUDCAD' );
			self::$inst->addCurrency( 'USDCAD' );
			self::$inst->addCurrency( 'CNYCAD' );
		}
		return self::$inst;
	}

	/**
	 * 返回指定的汇率
	 * @param $currencyArr = array( 'AUDCNY', 'AUDCAD' );
	 * @param $refresh = false 按照默认1小时刷新一次，= true表示立即刷新
	 */
	public static function getRates( $currencyArr = array(), $refresh = false ) {
		if ( empty( $currencyArr ) ) return array();

		if ( ! self::instance()->rates ) {
			$cacheFile = 'currency-rates.log';
			if ( $refresh ) @unlink( $cacheFile );
			$cache = file_get_contents( $cacheFile );
			if ( ! $cache || ( time() - filemtime( $cacheFile ) ) > 3600 ) {
				if ( self::instance()->currencyArray ) {
					foreach ( self::instance()->currencyArray as $k => $c ) {
						self::instance()->currencyArray[$k] = '"'.$c.'"';
					}
					$query = array(
						'q' => 'select * from yahoo.finance.xchange where pair in ('.implode( ',', self::instance()->currencyArray ).')',
						'env' => 'store://datatables.org/alltableswithkeys'
					);
					$query = http_build_query( $query );
					$queryUrl = self::instance()->apiUrl.'?'.$query;
					$rateResult = self::instance()->https_request( $queryUrl );
				}
				else $rateResult = '';

				file_put_contents( $cacheFile, $rateResult );
			}
			else {
				$rateResult = $cache;
			}
			$xmlDoc = simplexml_load_string( $rateResult );
			$rates = self::instance()->Xml2Array( $xmlDoc );
			$rates = $rates['results']['rate'];

			self::instance()->rates = $rates;
		}

		$tmp = array();
		foreach ( self::instance()->rates as $rate ) {
			$symbol = str_replace( '/', '', $rate['Name'] );
			if ( in_array( $symbol, $currencyArr ) ) $tmp[$symbol] = $rate;
		}

		return $tmp;
	}

	/**
	 * 返回指定的汇率
	 * @param $currency = AUDCNY;
	 * @param $refresh = false 按照默认1小时刷新一次，= true表示立即刷新
	 */
	public static function getRate( $currency, $refresh = false ) {
		if ( empty( $currency ) ) return;

		$rates = self::instance()->getRates( array( $currency ), $refresh );
		return $rates[$currency];
	}

	/**
	 * 返回指定的汇率
	 * @param $currency = AUDCNY;
	 * @param $refresh = false 按照默认1小时刷新一次，= true表示立即刷新
	 */
	public static function getRateRate( $currency, $refresh = false ) {
		$rate = self::instance()->getRate( $currency );
		return (float)$rate['Rate'];
	}

	/**
	 * 返回指定的汇率计算结果
	 * @param $currency = AUDCNY;
	 * @param $amount = 金额
	 * @param $d = 2 小数位
	 */
	public static function getExchangeResult( $currency, $amount, $d = 2 ) {
		if ( $amount == 0 ) return 0;
		if ( substr( $currency, 0, 3 ) == substr( $currency, 3, 3 ) ) return round( $amount, $d );
		return round( (float)$amount * (float)self::instance()->getRateRate( $currency ), $d );
	}

	private function https_request( $url, $data = null ) {
		$curl = curl_init();
		curl_setopt( $curl, CURLOPT_URL, $url );
		curl_setopt( $curl, CURLOPT_HTTPHEADER, array( 'Accept-Charset: UTF-8,*;q=0.5' ) );
		curl_setopt( $curl, CURLOPT_SSL_VERIFYPEER, FALSE );
		curl_setopt( $curl, CURLOPT_SSL_VERIFYHOST, FALSE );
		if ( !empty( $data ) ) {
			curl_setopt( $curl, CURLOPT_POST, 1 );
			curl_setopt( $curl, CURLOPT_POSTFIELDS, $data );
		}
		curl_setopt( $curl, CURLOPT_RETURNTRANSFER, 1 );
		$output = curl_exec( $curl );
		curl_close( $curl );
		return $output;
	}

	private function Xml2Array( $xmlObj ) {
		$result = array();
		$array = $xmlObj;
		if ( get_class($array) == 'SimpleXMLElement' ) {
			$array = get_object_vars( $xmlObj );
		}
		if ( is_array( $array ) ) {
			if ( count( $array ) <= 0 ) {
				return trim( strval( $xmlObj ) );
			}
			foreach ( $array as $key => $val ) {
				$result[$key] = self::instance()->Xml2Array( $val );
			}
			return $result;
		}
		else {
			return trim( strval( $array ) );
		}
	}
}

?>