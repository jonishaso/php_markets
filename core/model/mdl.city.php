<?php

class mdl_city extends mdl_base
{

	protected $tableName = '#@_city';

	public function getListBySql ($sql)
	{
		return $this->db->toArray($this->db->query($sql));
	}

	public function getCityList ($pId)  //用于对外接口的输出
	{
		return $this->db->toArray($this->db->query("select * from {$this->tableName} where ProvinceCode='{$pId}'"));
	}
}

?>