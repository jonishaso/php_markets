<?php

class mdl_area extends mdl_base
{

	protected $tableName = '#@_area';

	public function getListBySql ($sql)
	{
		return $this->db->toArray($this->db->query($sql));
	}

	public function getAreaList ($cId)  //用于对外接口的输出
	{
		return $this->db->toArray($this->db->query("select * from {$this->tableName} where CityCode='{$cId}'"));
	}
}

?>