<?php

/*
 @ctl_name = 首页产品特色值修改@
*/

class ctl_hcv extends adminPage
{

	private $refreshUrl;
	private $noback;

	function ctl_hcv ()
	{
		parent::adminPage();

		$this->noback = (int)get2( 'noback' );
		if ( $this->noback ) {
			$this->refreshUrl = '?'.$_SERVER['QUERY_STRING'].'&';
		}
		else {
			$this->refreshUrl = '?con=admin&ctl=adv/hcv&';
		}
	}

	public function index_action () #act_name = 信息分类列表#
	{
		$data		= $this->getAllPermissionClass();
		$infoclass	= $this->loadModel('infoClass');

		foreach ($data as $key=>$value)
		{
			$data[$key]['extend']	= unserialize($data[$key]['extend']);
			$data[$key]['column']	= self::_columnChk($value['id']);
			$data[$key]['infocnt']	= $infoclass->getInfoCount($value['id']);
			$data[$key]['hidecnt']	= $infoclass->getInfoCount($value['id'], 0);
		}

		$this->setData($data);
		$this->display();
	}

	public function edit_action () #act_name = 编辑信息分类#
	{
		//$id			= get2('id');
		$hcv	= $this->loadModel('hcv');
		$data = $hcv->getInfo();
		//var_dump($this->getLangStr());exit;
		if (is_post())
		{
			$oldData = $data;
			$data	 = post('data');
			//var_dump($data);exit;
			if($oldData == null){
				if($hcv->add($data)){
					$this->setData($data);
					$this->display();
				}else{
					$this->sheader(null, $this->lang->your_submit_incomplete);
				}
			}else{
				if($hcv->updateInfo($data)){
					$this->setData($data);
					$this->display();
				}else{
					$this->sheader(null, $this->lang->your_submit_incomplete);
				}
			}
			/*if ($data = self::_filter($data))
			{
				if($data == null){
					$hcv->add($data);
				}else{
					$hcv->updateInfo($data);
				}
				
				//$oldData['other'] = unserialize($oldData['other']);
			}
			else $this->sheader(null, $this->lang->your_submit_incomplete);*/
		}
		else
		{
			$this->setData($data);
			$this->setData($this->refreshUrl, 'refreshUrl');
			$this->setData($this->noback, 'noback');
			//$this->setData($this->_columnChk( $id ), 'columnChk');
			//$this->setData($parentStr, 'parentStr');
			$this->display();
		}
	}

	public function setting_action () #act_name = 高级设置#
	{
		$id			= get2('id');
		$infoclass	= $this->loadModel('infoClass');

		if (is_post())
		{
			$data	= post('data');
			$class	= post('class');
			$info	= post('info');
			$other	= post('other');
			$displayModes = post('displayModes');

			if ($data['ordinal'] < 0) $data['ordinal'] = $infoclass->getChildClassOrdinal($infoclass->getParentId($id));

			$data['extend']	= serialize($class);
			$data['info']	= serialize($info);
			$data['displayModes'] = serialize($displayModes);
			$data['other']	= serialize($other);

			if ( count( $displayModes ) === 1 ) {
				$data['defaultDisplayMode'] = $displayModes[0];
			}

			if ($infoclass->updateById($data, $id)) $this->sheader($this->refreshUrl);
			else $this->sheader(null, $this->lang->edit_category_failed);
		}
		else
		{
			$data = $infoclass->get($id);
			$data['displayModes']	= unserialize($data['displayModes']);
			$data['extend']			= unserialize($data['extend']);
			$data['info']			= unserialize($data['info']);
			$data['other']			= unserialize($data['other']);

			$displayModes = array(
				array(1, $this->lang->graphic_content),
				array(2, $this->lang->news_list),
				array(4, $this->lang->pic_list),
				array(8, $this->lang->graphic_list)
			);
			foreach ($displayModes as $key=>$value)
			{
				if (in_array($value[0], $data['displayModes'])) $displayModes[$key][2] = true;
			}
			$data['displayModes'] = $displayModes;

			$this->setData($data);
			$this->setData($this->refreshUrl, 'refreshUrl');
			$this->setData($this->noback, 'noback');
			$this->setData($infoclass->getParentNameStr($id, ' -&gt; '), 'parentStr');
			$this->setData($class['ordinal'], 'ordinal');
			$this->display();
		}
	}

	public function delete_action () #act_name = 删除信息分类#
	{
		if (is_post())
		{
			$ids = post('ids');
			if (is_array($ids))
			{
				foreach ($ids as $key=>$value) self::_delete(trim($value));
			}
		}
		else
		{
			self::_delete(get2('id'));
		}
		$this->sheader($this->refreshUrl);
	}

	private function _delete ($id)
	{
		$infoclass	= $this->loadModel('infoClass');
		if ($infoclass->getInfoCount($id) > 0) $this->sheader(null, $this->lang->category_under_info_delete_all_first);
		$class		= $infoclass->get($id);
		if ($infoclass->deleteById($class['id']))
		{
			//删除图片和附件
			$this->file->deletefile(UPDATE_DIR.$class['imageUrl']);
			$this->file->deletefile(UPDATE_DIR.$class['bigImageUrl']);
			$this->file->deletefile(UPDATE_DIR.$class['files']);
		}
		else $this->sheader(null, $this->lang->delete_category_failed_maybe_under_sub);
	}

	public function columnsetting_action () #act_name = 列表栏目#
	{
		$class_id	= get2('id');
		if (!$this->chkClass($class_id)) $this->sheader(null, $this->lang->current_record_not_exists);
		$user		= $this->loadModel('user');
		$infoclass	= $this->loadModel('infoClass');
		$class		= $infoclass->get($class_id);

		if (is_post())
		{
			$data = post();
			if ($infoclass->saveColumns($data, $this->user['id'], $class['id'])) $this->sheader('?con=admin&ctl=info/&class_id='.$class['id'].'&noback='.get2('noback'));  //
			else $this->sheader(null, $this->lang->info_list_column_modify_failed);
		}
		else
		{
			$column = $infoclass->getColumns(session('admin_user_id'), $class['id']);  //递归获取父级的设置
			if (empty($column)) $column = $this->getColumns();
			$this->setData($column);
			$this->setData($class['id'], 'class_id');
			$this->setData(get2('noback'), 'noback');
			$this->display();
		}
	}

	private function _filter ($data)
	{
		foreach ($data as $key=>$value)
		{
			$data[$key] = trim($value);
		}
		if (empty($data['name'])) return false;

		$data['ordinal'] = (int)$data['ordinal'];
		if ( $data['defaultDisplayMode'] ) $data['defaultDisplayMode'] = limitInt($data['defaultDisplayMode'], 1, 8);

		$reg = $this->loadModel('reg');
		if (post('color') != '' && $reg->chkColor(post('color'))) $titleStyle .= "color:".post('color').';';
		if (post('chkTitleBold') == 1) $titleStyle .= ' font-weight:bold;';
		if (post('chkTitleItalic') == 1) $titleStyle .= ' font-style:italic;';
		$data['classStyle'] = $titleStyle;

		return $data;
	}

	private function _columnChk ($classID)
	{
		$hide = array(
			'class_add'				=> $this->chkInfo($classID, 'class', 'add'),
			'class_edit'			=> $this->chkInfo($classID, 'class', 'edit'),
			'class_delete'			=> $this->chkInfo($classID, 'class', 'delete'),
			'class_setting'			=> $this->chkInfo($classID, 'class', 'setting'),
			'info_index'			=> $this->chkInfo($classID, 'index', 'index'),
			'class_columnSetting'	=> $this->chkInfo($classID, 'class', 'columnSetting'),
			'pic'					=> $this->chkAction('upload/pic'),
			'file'					=> $this->chkAction('upload/file')
		);
		return $hide;
	}

}

?>