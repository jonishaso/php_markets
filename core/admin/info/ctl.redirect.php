<?php

/*
 @ctl_name = redirect@
*/

class ctl_redirect extends adminPage
{

	public function index_action () #act_name = redirect跳转#
	{
		if($_GET['id'] == 1){
			if($this->getAdminLangStr() == 'en'){
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=102&id=1&noback=0');
			}else{
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=102&id=106&noback=0');
			}

		}else if($_GET['id'] == 2){
			if($this->getAdminLangStr() == 'en'){
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=102&id=2&noback=0');
			}else{
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=102&id=107&noback=0');
			}
		}else if($_GET['id'] == 109){
			if($this->getAdminLangStr() == 'en'){
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=104&id=5&noback=0');
			}else{
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=104&id=109&noback=0');
			}
		}else if($_GET['id'] == 7){
			if($this->getAdminLangStr() == 'en'){
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=108&id=7&noback=0');
			}else{
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=108&id=111&noback=0');
			}
		}else if($_GET['id'] == 3){
			if($this->getAdminLangStr() == 'en'){
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=103&id=3&noback=0');
			}else{
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=103&id=108&noback=0');
			}
		}else if($_GET['id'] == 110){
			if($this->getAdminLangStr() == 'en'){
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=105&id=6&noback=0');
			}else{
				$this->sheader('?con=admin&ctl=info/&act=edit&class_id=105&id=110&noback=0');
			}
		}
		//?con=admin&ctl=info/&act=edit&class_id=102&id=1&noback=0
		//$relation	= $this->loadModel('relation');
		//$data		= $relation->getChild();

		//$this->setData($data);
		//$this->display();
	}
}

?>