<?php

class db
{

	private $dbhost;
	private $dbuser;
	private $dbpass;
	private $dbname;
	private $dbchar;
	public $link;
	private $result;
	private $pre;
	private $errors = array();

	function __construct ( $dbnum = 1 )
	{
		global $CONFIG;
		$this->dbhost	= "localhost";
		$this->dbuser	= "root";
		$this->dbpass	= "";
		$this->dbname	= "ruizean_markets";
		$this->dbchar	= "UTF8";
		$this->pre		= "cc_";

		$this->connect();
	}

	function connect ()
	{
		$this->link = new mysqli($this->dbhost, $this->dbuser, $this->dbpass) or die ("Connect Failed!");
		mysqli_select_db ($this->link,$this->dbname) or die("连接数据库-> <font style='color:#F00'>" . $this->dbname . "</font> <-失败!");
		mysqli_query($this->link,"set names $this->dbchar");
	}

	function query ($s)
	{
		
		$s = str_replace('#@_', $this->pre, $s);
		$s = str_replace( '\\\\\\', '\\', $s );
		$re = mysqli_query ($this->link,$s);
		if(!$re) $this->setError( 'SQL语句错误' );
		$this->result = $re;
		

		return $re;
	}

	function execute ($s)
	{
		$s = str_replace('#@_', $this->pre, $s);
		$s = str_replace( '\\\\\\', '\\', $s );
		mysqli_query ( $this->link,$s);
		$affected_rows = $this->affected_rows();
		if ($affected_rows > 0) return $affected_rows;
		else
		{
			if (self::error()) {
				$this->setError( self::error() );
				return false;
			}
			else return true;
		}
	}

	function getSelectSql ($array = null, $tableName = '', $condition = null, $order = '', $limit = '')
	{
		$i = 0;
		$valueStr	= '';
		$whereStr	= '';

		if (empty($tableName))
		{
			return false;
		}
		if (is_array($array))
		{
			foreach ($array as $key=>$value)
			{
				$i++;
				$valueStr	.= ($i > 1 ? ', ' : '').'`'.$value.'`';
			}
		}
		else
		{
			$valueStr = $array;
		}
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$whereStr	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : '`'.$key.'`'.'=\''.( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $this->link, $value ) ).'\'');
			}
		}
		else
		{
			if (!empty($condition)) $whereStr = $condition;
		}

		$sql = "select ".(empty($valueStr) ? '*' : $valueStr)." from $tableName".(empty($whereStr) ? '' : ' where '.$whereStr).(empty($order) ? '' : ' order by '.$order).(empty($limit) ? '' : ' limit '.$limit);
		return $sql;
	}

	function select ($array = null, $tableName = '', $condition = null, $order = '', $limit = '')
	{
		if ($sql = $this->getSelectSql($array, $tableName, $condition, $order, $limit)) 
			return $this->query($sql);
	}

	function selectOne ($array = null, $tableName = '', $condition = null, $order = '')
	{
		$re = $this->select($array, $tableName, $condition, $order, '1');
		if ($ro = $this->fetch_array($re))
		{
			return $ro;
		}
		return null;
	}

	function getSelectMultipleSql ($array = array(), $tableName = array(), $on = array(), $condition = null, $order = '', $limit = '')
	{
		$aliasPre	= 't';
		$valueStr	= '';
		$tableStr	= '';
		$whereStr	= '';
		$i			= 0;
		foreach ($array as $key=>$value)
		{
			if (!is_array($value)) $value = preg_split('/,[ ]?/', $value);
			foreach ($value as $subkey=>$sub)
			{
				$valueStr .= ($i > 0 ? ', ' : '')."{$aliasPre}{$key}.".((empty($sub) || $sub == '*') ? '*' : '`'.$sub.'`');
				if (!is_numeric($subkey)) $valueStr .= " as $subkey";
				$i++;
			}
		}
		foreach ($tableName as $key=>$value)
		{
			if ($key > 0)
			{
				$tableStr .= " left join $value $aliasPre{$key}";
				if (is_array($on)) $tmp = explode('=', $on[$key - 1]);
				else $tmp = explode('=', $on);
				foreach ($tmp as $sk=>$s) $tmp[$sk] = explode('#', $s);
				$tableStr .= " on $aliasPre".($tmp[0][0]).".".$tmp[0][1]."=$aliasPre{$tmp[1][0]}.".$tmp[1][1];
			}
			else
			{
				$tableStr .= "$value $aliasPre{$key}";
			}
		}
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$whereStr	.= ($i > 1 ? ' and ' : '');
				if (empty($key) || is_numeric($key))
				{
					$whereStr .= $value;
				}
				else
				{
					$tmp = explode('#', $key);
					$whereStr .= "$aliasPre".$tmp[0].".`".$tmp[1]."`='".( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $value ) )."'";
				}
			}
		}
		else
		{
			if (!empty($condition))
			{
				$tmp = explode('=', $condition);
				$tmp[0] = explode('#', $tmp[0]);
				$whereStr = "$aliasPre".$tmp[0][0].".`".$tmp[0][1]."`=".$tmp[1];
			}
		}

		$sql = "select $valueStr from $tableStr".(empty($whereStr) ? '' : ' where '.$whereStr).(empty($order) ? '' : ' order by '.$order).(empty($limit) ? '' : ' limit '.$limit);
		return $sql;
	}

	function selectMultiple ($array = array(), $tableName = array(), $on = array(), $condition = null, $order = '', $limit = '')
	{
		if ($sql = $this->getSelectMultipleSql($array, $tableName, $on, $condition, $order, $limit)) return $this->query($sql);
	}

	function getInsertSql ($array = null, $tableName = '')
	{
		$keyStr		= '';
		$valueStr	= '';
		$i			= 0;

		if (empty($tableName))
		{
			return false;
		}
		if (is_array($array))
		{
			foreach ($array as $key=>$value)
			{
				$i++;
				$keyStr 	.= ($i > 1 ? ',' : '').'`'.$key.'`';
				if ( get_magic_quotes_gpc() ) $valueStr	.= ($i > 1 ? ',' : '').'\''.$value.'\'';
				else $valueStr	.= ($i > 1 ? ',' : '').'\''.mysqli_real_escape_string($value).'\'';
			}

			$sql = "insert into $tableName ($keyStr) values ($valueStr)";
			return $sql;
		}
		else
		{
			return false;
		}
	}

	function insert ($array = null, $tableName = '')
	{
		if ($sql = $this->getInsertSql($array, $tableName)) return $this->execute($sql);
	}

	function getUpdateSql ($array = null, $tableName = '', $condition = null)
	{
		$i = 0;
		$valueStr	= '';
		$whereStr	= '';

		if (empty($tableName))
		{
			return false;
		}
		if (!is_array($array))
		{
			return false;
		}
		foreach ($array as $key=>$value)
		{
			$i++;
			if ( get_magic_quotes_gpc() ) $valueStr	.= ($i > 1 ? ', ' : '').'`'.$key.'`'.'=\''.$value.'\'';
			else $valueStr	.= ($i > 1 ? ', ' : '').'`'.$key.'`'.'=\''.mysqli_real_escape_string($value).'\'';
		}
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				if ( get_magic_quotes_gpc() ) $whereStr	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : '`'.$key.'`'."='".$value."'");
				else $whereStr	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : '`'.$key.'`'."='".mysqli_real_escape_string($value)."'");
			}
		}
		else
		{
			if (!empty($condition)) $whereStr = $condition;
		}

		$sql = "update $tableName set $valueStr".(empty($whereStr) ? '' : ' where '.$whereStr);
		return $sql;
	}

	function update ($array = null, $tableName = '', $condition = null)
	{
		if ($sql = $this->getUpdateSql($array, $tableName, $condition)) return $this->execute($sql);
	}

	function getDeleteSql ($tableName = '', $condition = null)
	{
		$i = 0;
		$whereStr	= '';

		if (empty($tableName))
		{
			return false;
		}
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$whereStr	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : $key."='".( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $value ) )."'");
			}
		}
		else
		{
			if (!empty($condition)) $whereStr = $condition;
		}

		$sql = "delete from $tableName".(empty($whereStr) ? '' : ' where '.$whereStr);
		return $sql;
	}

	public function delete ($tableName = '', $condition = null)
	{
		if ($sql = $this->getDeleteSql($tableName, $condition)) return $this->execute($sql);
	}

	public function fetch_array ($re = null)
	{
		if (!$re)
			return mysqli_fetch_array($this->result);
		else
			return mysqli_fetch_array($re);
	}

	public function toArray ($re = null)
	{
		if ($re != null) $this->result = $re;
		$arr = array();
		while ($ro = $this->fetch_array()) $arr[] = $ro;
		return $arr;
	}

	function insert_id ()
	{
		return mysqli_insert_id($this->link);
	}

	function cnt ($re = null)
	{
		if ($re != null) $this->result = $re;
		return $this->result == null?0:mysqli_num_rows($this->result);
	}

	private function affected_rows ()
	{
		return mysqli_affected_rows($this->link);
	}

	public function getMin ($tb, $cell, $condition)
	{
		$where = '';
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$where	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : $key.'=\''.( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $value ) ).'\'');
			}
		}
		else
		{
			if (!empty($condition)) $where = $condition;
		}

		$sql	= "select min($cell) as cnt from $tb";
		if ($where != '') $sql .= " where $where";
		$re		= $this->query($sql);
		$ro		= $this->fetch_array($re);
		return $ro['cnt'];
	}

	public function getMax ($tb, $cell, $condition)
	{
		$where = '';
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$where	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : $key.'=\''.( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $value ) ).'\'');
			}
		}
		else
		{
			if (!empty($condition)) $where = $condition;
		}

		$sql	= "select max($cell) as cnt from $tb";
		if ($where != '') $sql .= " where $where";
		$re		= $this->query($sql);
		$ro		= $this->fetch_array($re);
		return $ro['cnt'];
	}

	public function getSum ($tb, $cell, $condition)
	{
		$where = '';
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$where	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : $key.'=\''.( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $value ) ).'\'');
			}
		}
		else
		{
			if (!empty($condition)) $where = $condition;
		}

		$sql	= "select sum($cell) as cnt from $tb";
		if ($where != '') $sql .= " where $where";
		$re		= $this->query($sql);
		$ro		= $this->fetch_array($re);
		return $ro['cnt'];
	}

	public function getOne ($tb, $cell, $condition)
	{
		$where = '';
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$where	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : $key.'=\''.( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $value ) ).'\'');
			}
		}
		else
		{
			if (!empty($condition)) $where = $condition;
		}

		$sql	= "select $cell as cell from $tb";
		if ($where != '') $sql .= " where $where";
		$sql	.= " limit 1";
		$re		= $this->query($sql);
		if ($ro = $this->fetch_array($re))
		{
			return $ro['cell'];
		}
		else
		{
			return null;
		}
	}

	public function getCount ($tb, $condition)
	{
		$where = '';
		$i = 0;
		if (is_array($condition))
		{
			foreach ($condition as $key=>$value)
			{
				$i++;
				$where	.= ($i > 1 ? ' and ' : '').(empty($key) || is_numeric($key) ? $value : $key.'=\''.( get_magic_quotes_gpc() ? $value : mysqli_real_escape_string( $value ) ).'\'');
			}
		}
		else
		{
			if (!empty($condition)) $where = $condition;
		}

		$sql	= "select count(*) as cnt from $tb";
		if ($where != '') $sql .= " where $where";
		$re		= $this->query($sql);
		if ($ro = $this->fetch_array($re))
		{
			return $ro['cnt'];
		}
		else
		{
			return 0;
		}
	}

	public function getCountBySql ($sql)
	{
		$re = $this->query($sql);
		if ($ro = $this->fetch_array($re))
			return $ro['cnt'];
		else
			return null;
	}

	public function begin() {
		$this->clearError();
		return $this->query('BEGIN');
	}

	public function rollback() {
		return $this->query('ROLLBACK');
	}

	public function commit() {
		return $this->query('COMMIT');
	}

	public function error ()
	{
		return mysqli_error($this->link);
	}

	public function errno ()
	{
		return mysqli_errno($this->link);
	}

	public function isError() {
		if ( $this->errors ) return true;
		return false;
	}

	public function getErrors() {
		return $this->errors;
	}

	private function setError( $msg ) {
		$this->errors[] = $msg;
	}

	private function clearError() {
		$this->errors = array();
	}

	public function free ()
	{
		@mysqli_free_result($this->result);
	}

	public function close()
	{
		mysqli_close($this->link);
	}
	
	public function __destruct ()
	{
		if ( !empty($this->result) ) $this->free();
		mysqli_close($this->link);
	}

}

?>