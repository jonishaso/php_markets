<?php

class mdl_hcv extends mdl_base
{

	protected $tableName = '#@_home_character_value';
	protected $lang = true;
	//protected $tableName		= '#@_info';
	//private $classTableName		= '#@_infoclass';
	private $userTableName		= '#@_user';

	public function getInfo ()
	{
		return $this->db->selectOne(null, $this->tableName, array());
	}

	public function updateInfo ($data)
	{
		return $this->db->update($data, $this->tableName, array('id'=>1));
	}

	public function add ($data)
	{
		$this->db->insert($data, $this->tableName);
		return $this->db->insert_id();
	}


}

?>