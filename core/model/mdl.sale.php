<?php

class mdl_sale extends mdl_base
{

	protected $tableName = '#@_sale';
	// protected $lang = true;
	private $userTableName	= '#@_user';

	public function getInfo ()
	{
        // return $this->db->selectOne(null, $this->tableName, array());
        
        return $this->db->select(null, $this->tableName, array('name'=>'Jord'));        
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