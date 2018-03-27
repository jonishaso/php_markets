<?php

function customLangArray() {
	return array(
		array( 'Entire home', 'zh-cn' => '整套房屋' ),
		array( 'Other', 'zh-cn' => '其他' )
	);
}

function getCustomLangStr( $str ) {
	$customLangArray = customLangArray();

	//获取当前语言
	if ( isset( $GLOBALS['lang'] ) ) $lang = $GLOBALS['lang'];
	else $lang = trim( $_COOKIE['lang'] );

	$result = $str;
	foreach ( $customLangArray as $item ) {
		if ( $str == $item[0] ) {
			if ( isset( $item[$lang] ) ) $result = $item[$lang];
			break;
		}
	}
	return $result;
}

?>