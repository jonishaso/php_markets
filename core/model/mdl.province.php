<?php

class mdl_province extends mdl_base
{

	protected $tableName = '#@_province';

	public function getListBySql ($sql)
	{
		return $this->db->toArray($this->db->query($sql));
	}

	public function getProvinceList ()  //用于对外接口的输出
	{
		return $this->db->toArray($this->db->query("select * from {$this->tableName}"));
	}
}

?>