<?php

/**
 Image adapter
 @Author: Curitis Niewei
 File:     modifier.image2.php
 @param: method -> Adapter method (cut, fill)
 @return: New Image Url
 */


function smarty_modifier_image2( $string, $width, $height, $method = 'fill', $pos = 'center,top' ) {
	$noImage = false;
		if ( empty( $string ) || ! file_exists( UPDATE_DIR.$string ) || ! in_array( $method, array( 'cut', 'fill' ) ) || ! in_array( $pos, array( 'left,top', 'center,top', 'right,top', 'left,middle', 'center,middle', 'right,middle', 'left,bottom', 'center,bottom', 'right,bottom' ) ) ) {
			$noImage = true;
			$string = 'no-image.gif';
			if ( ! file_exists( UPDATE_DIR.$string ) ) {
				return '';
			}
			$method = 'cut';
			//return $string;
		}

		$width = (int)$width;
		$height = (int)$height;

		//$string = $this->quality( $string );

		if ( $width <= 0 && $height <= 0 ) {
			return $string;
		}

		$image_state = getimagesize( UPDATE_DIR.$string );
		switch ( $image_state[2] ) {
			case 1 : $im = imagecreatefromgif( UPDATE_DIR.$string ); break;
			case 2 : $im = imagecreatefromjpeg( UPDATE_DIR.$string ); break;
			case 3 : $im = imagecreatefrompng( UPDATE_DIR.$string ); break;
		}
		$old_width = $image_state[0];
		$old_height = $image_state[1];

		if ( $width > 0 && $height <= 0 ) {
			$height = (int)( $old_height * ( $width / $old_width ) );
		}
		elseif ( $height > 0 && $width <= 0 ) {
			$width = (int)( $old_width * ( $height / $old_height ) );
		}

		if ( $width > 1000 ) {
			$width = 1000;
			$height = (int)( $old_height * ( $width / $old_width ) );
		}
		if ( $height > 1000 ) {
			$height = 1000;
			$width = (int)( $old_width * ( $height / $old_height ) );
		}

		if ( $old_width == $width && $old_height == $height ) {
			return $string;
		}

		//file_put_contents( 'image.log', date( 'Y-m-d H:i:s' ).' '.$string.' '.$width.' '.$height."\r\n", FILE_APPEND );

		if ( $old_width < $width || $old_height < $height ) return $string;

		$file = new file;
		$newImageDir = UPDATE_DIR.'thumbnails/';
		$newImageUrl = $file->nameExtend( $string, "_{$width}x{$height}_{$method}_".str_replace( ',', '_', $pos ) );

		if ( file_exists( $newImageDir.$newImageUrl ) ) {
			return 'thumbnails/'.$newImageUrl;
		}

		//file_put_contents( 'image2.log', date( 'Y-m-d H:i:s' ).' '.$string.' '.$width.' '.$height."\r\n", FILE_APPEND );

		$newImagePath = $file->name( $newImageUrl );
		$newImagePath = str_replace( $newImagePath, '', $newImageUrl );
		$file->createdir( $newImageDir.$newImagePath, 0777 );
		if ( $method == 'fill' ) {
			$file->resize( UPDATE_DIR.$string, $newImageDir.$newImageUrl, $width, $height );
			$file->fillColor( $newImageDir.$newImageUrl, $newImageDir.$newImageUrl, $width, $height, array( 255, 255, 255 ) );
		}
		elseif ( $method == 'cut' ) {
			$file->resize( UPDATE_DIR.$string, $newImageDir.$newImageUrl, $width, $height, true, true );
			$file->cutByPos( $newImageDir.$newImageUrl, $newImageDir.$newImageUrl, $width, $height, $pos );
		}

		//file_put_contents( 'image3.log', date( 'Y-m-d H:i:s' ).' '.$string.' '.$width.' '.$height."\r\n", FILE_APPEND );

		return 'thumbnails/'.$newImageUrl;
}

?>