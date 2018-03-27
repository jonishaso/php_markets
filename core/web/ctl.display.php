<?php

class ctl_display extends cmsPage
{

	function index_action() {
		$template = 'display';

		$id = (int)get2( 'id' );

		$mdl_info = $this->loadModel( 'info' );
		$mdl_infoclass = $this->loadModel( 'infoClass' );

		$info = $mdl_info->get( $id );
		if ( ! $info ) {
			header( 'HTTP/1.1 404 Not Found' );
			header( 'Status: 404 Not Found' );
			$this->display( '404' );
			exit;
		}
		$info['createdDate'] = date( 'd-m-Y', $info['createdDate'] );

		$infoclass = $mdl_infoclass->get( $info['classId'] );
		if ( ! $infoclass ) {
			header( 'HTTP/1.1 404 Not Found' );
			header( 'Status: 404 Not Found' );
			$this->display( '404' );
			exit;
		}
		$this->setData( $infoclass, 'infoclass' );
		$parents = $mdl_infoclass->getParentListArray( $infoclass['id'] );
		$this->setData( $parents, 'parents' );

		$base_class = $parents[0];
		switch($base_class['id']) {
			case '101': $base_class['nameEn'] = 'ABOUT'; break;
		}
		$this->setData( $base_class, 'baseCategory' );
		$second_class = $mdl_infoclass->getChild4( $base_class['id'] );
		if ( ! $second_class ) $second_class = array( $base_class );
		$this->setData( $second_class, 'second_class' );
		$this->setData( $base_class['id'], 'base_id' );
		if ( $parents[1]['id'] ) {
			$this->setData( $parents[1]['id'], 'second_id' );
		}
		else {
			$this->setData( $base_class['id'], 'second_id' );
		}
		$this->setData( $parents[2]['id'], 'third_id' );
		$this->setData( $parents[3]['id'], 'four_id' );

		$info['hits'] += 1;
		$mdl_info->updateHits( $info['id'] );

		$this->setData( $info, 'info' );

		$alias = $infoclass['alias'];
		$menu = '';
		$pos = strpos( $alias, '/' );
		if ( false === $pos ) {
			$menu = $alias;
		}
		else {
			$menu = substr( $alias, 0, $pos );
		}
		$menu = strtolower( $menu );

		$this->setData( $alias, 'alias' );
		$this->setData( $menu, 'menu' );

		//seo
		$this->setData( $info['title'].' - '.$this->site['pageTitle'], 'pageTitle' );

		if ( ! file_exists( $this->tpl->template_dir.'/'.$template.'.htm' ) ) {
			header( 'HTTP/1.1 404 Not Found' );
			header( 'Status: 404 Not Found' );
			$this->display( '404' );
			exit;
		}

		$this->display( $template );
	}

}