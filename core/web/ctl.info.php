<?php

class ctl_info extends cmsPage
{

	function index_action() {
		$alias = get2( 'alias' );
		if ( right( $alias, 1 ) == '/' ) {
			$alias = right( $alias, 1, true );
		}

		$menu = '';
		$pos = strpos( $alias, '/' );
		if ( false === $pos ) {
			$menu = $alias;
		}
		else {
			$menu = substr( $alias, 0, $pos );
		}
		$menu = strtolower( $menu );

		$mdl_info = $this->loadModel( 'info' );
		$mdl_infoclass = $this->loadModel( 'infoClass' );

		$infoclass = $mdl_infoclass->getByAlias( $alias );
		if ( ! $infoclass ) {
			header( 'HTTP/1.1 404 Not Found' );
			header( 'Status: 404 Not Found' );
			$this->display( '404' );
			exit;
		}
		if ( $mdl_infoclass->getChildCount( $infoclass['id'] ) > 0 ) {
			$infoclass = $mdl_infoclass->getFirstChild( $infoclass['id'] );
		}

		if ( $infoclass['template'] == 'list' ) {  //列表
			$column = array( 'title', 'publishedDate' );
			$where = array();
			$where[] = "classId like '".$infoclass['id']."%'";
			$where[] = 'isApproved=1';
			$order = 'ordinal desc';
			$pageSql = $mdl_info->getListSqlForWeb( $column, $where, $order );
			$pageUrl = $this->parseUrl()->set( 'page' );
			$pageSize = (int)$infoclass['perPageCount'];
			$page = $this->page( $pageSql, $pageUrl, $pageSize );
			$list = $mdl_info->getListBySql( $page['outSql'] );
			$this->setData( $list, 'list' );
			$this->setData( $page, 'page' );
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

		$this->setData( $alias, 'alias' );
		$this->setData( $menu, 'menu' );

		if ( ! file_exists( $this->tpl->template_dir.'/'.$infoclass['template'].'.htm' ) ) {
			header( 'HTTP/1.1 404 Not Found' );
			header( 'Status: 404 Not Found' );
			$this->display( '404' );
			exit;
		}

		//seo
		$this->setData( $infoclass['name'].' - '.$this->site['pageTitle'], 'pageTitle' );

		$this->display( $infoclass['template'] );
	}

}