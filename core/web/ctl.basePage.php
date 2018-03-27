<?php

class cmsPage extends corecms
{

	protected $skinPath;
	protected $site;
	protected $loginUser;
	protected $returnUrl;
	protected $payments;
	protected $paymentids;
	protected $ua;
	protected $wap;

	function cmsPage ()
	{
		parent::corecms();

		/* 如果手机版和PC版不同模板
		$this->ua = getUserDevice();
		$this->wap = (int)get2( 'wap' );
		if ( !in_array( $this->ua, array( 'desktop', 'tablet' ) ) ) {
			//如果不是桌面和平板
			if ( !$this->wap ) {
				//如果没有请求手机版，则跳到手机版
				$this->sheader( HTTP_ROOT_WWW.'wap'.$_SERVER['REQUEST_URI'] );
				exit;
			}
		}
		$this->setData( $ua, 'ua' );
		$this->setData( $this->wap, 'wap' );*/

		/*$this->setData(HTTP_ROOT.( $this->wap ? 'wap/' : '' ), 'http_root');
		$this->setData(HTTP_ROOT_WWW.( $this->wap ? 'wap/' : '' ), 'http_root_www');
		$this->skinPath = HTTP_ROOT.'themes/'.STYLE;*/

		$langStr = $this->getLangStr();
		$langPath = '';
		if ( $langStr == 'zh-cn' ) {
			$langPath = 'zh-cn/';
		}
		else if ( $langStr == 'en' ) {
			$langPath = 'en/';
		}
		$this->setData(HTTP_ROOT, 'http_root');
		$this->setData(HTTP_ROOT_WWW.$langPath, 'http_root_www');
		$this->skinPath = HTTP_ROOT.'themes/'.STYLE;


		$mdl_site = $this->loadModel('site');
		$this->site = $mdl_site->get();
		$this->setData( $this->site, 'site' );

		//会员
		$userId = session( 'member_user_id' );
		$userShell = session( 'member_user_shell' );
		$userShellFacebook = session( 'member_user_shell_facebook' );
		$userShellGoogle = session( 'member_user_shell_google' );
		$userShellWechat = session( 'member_user_shell_wechat' );
		if ( $userId > 0 ) {
			$mdl_user = $this->loadModel( 'user' );
			$this->loginUser = $mdl_user->getUserById( $userId );
			if ( ! $this->loginUser['isApproved'] ) {
				$this->loginUser = null;
			}
			//下面这样的好处是可以把多种第三方登录集合到一个会员上，这样该会员从Facebook、Google或者微信登录网站，都是同一个会员
			if ( ! empty( $userShellFacebook ) ) {
				//通过Facebook
				if ( $userShellFacebook != $this->md5( $this->loginUser['id'].$this->loginUser['facebook_connect_id'] ) ) {
					$this->loginUser = null;
				}
			}
			else if ( ! empty( $userShellGoogle ) ) {
				//通过Google
				if ( $userShellGoogle != $this->md5( $this->loginUser['id'].$this->loginUser['google_connect_id'] ) ) {
					$this->loginUser = null;
				}
			}
			else if ( ! empty( $userShellWechat ) ) {
				//通过Wechat
				if ( $userShellWechat != $this->md5( $this->loginUser['id'].$this->loginUser['wechat_connect_id'] ) ) {
					$this->loginUser = null;
				}
			}
			else {
				if ( $userShell != $this->md5( $this->loginUser['id'].$this->loginUser['name'].$this->loginUser['password'] ) ) {
					$this->loginUser = null;
				}
			}
			$this->setData( $this->loginUser, 'loginUser' );
		}

		$this->setData( $this->getAdver(), 'adver' );

		//返回URL
		$this->returnUrl = trim( get2( 'returnUrl' ) );
		if ( $this->returnUrl ) {
			$this->returnUrl = urldecode( $this->returnUrl );
			$this->setData( $this->returnUrl, 'returnUrl' );
		}
		//当前URL
		$this->setData( $this->parseUrl()->toString(), 'currentUrl' );
		$this->setData($_COOKIE['camp'],'camp');				
	}

	private function getAdver( $setCookie = true ) {
		$adverId = '';
		$adverStr = '';
		$adverCookie = $this->cookie->getCookie( 'adver' );
		$adverCookieNew = $adverCookie;
		$mdl_adver = $this->loadModel( 'adver' );
		$advers = $mdl_adver->getList( null, array( 'isApproved' => 1, "pic<>''" ), 'id asc' );
		foreach ( $advers as $adver ) {
			$adverShow = true;
			if ( $adver['isOnlyDefault'] ) {
				if ( !( $GLOBALS['gbl_ctl'] == 'index' && $GLOBALS['gbl_act'] == 'index' ) ) {
					$adverShow = false;
				}
			}
			if ( $adver['isShowOnce'] ) {
				$adverId = $adver['id'].'|';
				if ( in_array( $adver['id'], explode( '|', $adverCookie ) ) ) {
					$adverShow = false;
				}
				else {
					$adverCookieNew .= $adverId;
				}
			}
			if ( $adverShow ) {
				$adverStr .= '<script language="javascript">AdPrepare('.$adver['id'].', "'.$adver['title'].'", "'.$adver['url'].'", "'.$adver['mode'].'", "'.UPLOAD_PATH.$adver['pic'].'", '.$adver['width'].', '.$adver['height'].', '.$adver['marginTop'].', '.$adver['marginSide'].', '.$adver['isAutoClose'].');</script>';
			}
		}
		if ( $setCookie && $adverCookieNew != $adverCookie ) {
			$this->cookie->setCookie( 'adver', $adverCookieNew );
		}
		return $adverStr;
	}

	protected function page( $sql, $pageUrl, $pageSize, $maxPage = 5 ) {
		$pageUrl		= preg_replace( '/&?perPageCount=\d+/', '', $pageUrl );
		$perPageCount	= (int)get2( 'perPageCount' );
		if ($perPageCount > 0)
		{
			$pageSize	= $perPageCount;
			$pageUrl	.= "perPageCount={$perPageCount}&";
		}
		$page			= (int)get2( 'page' );
		$pageUrl		= $pageUrl."page=";

		$recordCount	= $this->db->cnt( $this->db->query( $sql ) );
		$pageCount		= ceil( $recordCount / $pageSize );
		$page			= limitInt( $page, 1, $pageCount );
		$prev_page = $page - 1;
		$next_page = $page + 1;
		if ( $prev_page < 1 ) {
			$prev_page = 1;
		}
		if ( $next_page > $pageCount ) {
			$next_page = $pageCount;
		}
		$page_l = ceil( $page - $maxPage / 2 );
		if ( $page_l < 1 ) $page_l = 1;
		$page_r = $page_l + $maxPage;
		if ( $page_r > $pageCount ) $page_r = $pageCount;

		$pageStr = '';
		if ( $pageCount > 1 ) {
			if ( $page > 1 ) {
				$pageStr .= '<a href="'.$pageUrl.( $page - 1 ).'">上一页</a>';
			}
			else {
				$pageStr .= '<em>上一页</em>';
			}
			if ( $page_l > 1 ) {
				$pageStr .= '<a href="'.$pageUrl.'1">1</a><b>...</b>';
			}
			while ( $page_l <= $page_r ) {
				$pageStr .= '<a href="'.$pageUrl.$page_l.'"'.($page_l == $page ? ' class="current"' : '').'>'.$page_l.'</a>';
				$page_l++;
			}
			if ( $page_r < $pageCount ) {
				$pageStr .= '<b>...</b><a href="'.$pageUrl.$pageCount.'">'.$pageCount.'</a>';
			}
			if ( $page < $pageCount ) {
				$pageStr .= '<a href="'.$pageUrl.( $page + 1 ).'">下一页</a>';
			}
			else {
				$pageStr .= '<em>下一页</em>';
			}
		}

		$pageStart = ( $page - 1 ) * $pageSize + 1;
		$pageEnd = ( $page - 1 ) * $pageSize + $pageSize;
		if ( $page == $pageCount ) {
			$pageEnd = $recordCount;
		}
		return array(
			'recordCount' => $recordCount,
			'perPageCount' => $pageSize,
			'pageStart' => $pageStart,
			'pageEnd' => $pageEnd,
			'pageStr' => $pageStr,
			'outSql' => $sql.' limit '.( ( $page - 1 ) * $pageSize ).','.$pageSize,
			'pc' => $pageCount,
			'cp' => $page
		);

		/*
		<div class="pages">
			<div class="info"><strong>显示第 1-8 条信息</strong> (共有 1487 条信息)</div>
			<div class="page clearfix">
				<span><label>排序方式</label><select name="sortby">
					<option value="">人气最高</option>
				</select></span>
				<em>上一页</em>
				<a href="#" class="current"><strong>1</strong></a>
				<a href="#"><strong>2</strong></a>
				<a href="#"><strong>3</strong></a>
				<a href="#"><strong>4</strong></a>
				<a href="#"><strong>5</strong></a>
				<b>...</b>
				<a href="#"><strong>58</strong></a>
				<a href="#">下一页</a>
			</div>
		</div>

		.pages { padding:0 0 10px; }
		.pages .info { padding-bottom:10px; color:#392E14; }
		.page { text-align:right; padding:6px 10px; background:#FFF url(page-bg.jpg) bottom repeat-x; border:1px solid #DED8CC; }
		.page span { float:left; }
		.page span label { padding-right:5px; color:#392E14; }
		.page, .page select, .page input, .page span label { vertical-align:middle; }
		.page a, .page em { display:inline-block; height:22px; line-height:22px; margin:0 2px; padding:0 6px; background:#FFF; border:1px solid #DFD9CD; }
		.page a { color:#92836C; }
		.page b { color:#666; font-weight:normal; }
		.page em { color:#D2C7B6; font-style:normal; }
		.page a:hover, .page a.current { background:url(page-hover.jpg) repeat-x; text-decoration:none; color:#FFF; }

		<{if $page.recordCount>0}>
			<div class="pages">
				<div class="info"><strong>显示第 <{$page.pageStart}>-<{$page.pageEnd}> 条信息</strong> (共有 <{$page.recordCount}> 条信息)</div>
				<{if $page.pageStr}><div class="page"><{$page.pageStr}></div><{/if}>
			</div>
			<div class="list">
				<ul>
					<{foreach from=$list item=item key=key}>
						<li><span class="date"><{$item.publishedDate}></span><a href="<{$http_root_www}><{$infoclass.alias}>/<{$item.id}>" target="_blank"><{$item.title}></a></li>
					<{/foreach}>
				</ul>
			</div>
			<{if $page.pageStr}><div class="page" style="margin-top:10px;"><{$page.pageStr}></div><{/if}>
		<{else}>
			<div class="list"><div class="no-data">暂无数据</div></div>
		<{/if}>
		*/
	}
}

?>