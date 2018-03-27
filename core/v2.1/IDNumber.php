<?php

class IDNumber {
	/**
	 * 加权因子
	 */
	private static $weight = array( 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 );
	/**
	 * 校验位
	 */
	private static $verify = array( '1', '0', 'x', '9', '8', '7', '6', '5', '4', '3', '2' );

	/**
	 * 验证号码是否有效
	 */
	public static function isValid( $id ) {
		$idArr = str_split( $id );
		$sum = 0;
		for ( $i = 0; $i < 17; $i++ ) {
			if ( !is_numeric( $idArr[$i] ) ) return false;
			$sum += $idArr[$i] * self::$weight[$i];
		}
		$mod = $sum % 11;
		if ( strcasecmp( self::$verify[$mod], $idArr[17] ) != 0 ) return false;
		return true;
	}

	/**
	 * 生成有效的号码
	 */
	public static function generate() {
		
	}
}

?>