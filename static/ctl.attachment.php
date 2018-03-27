<?php

/*
 @ctl_name = 附件管理@
*/

class ctl_attachment extends adminPage
{

	function ctl_attachment ()
	{
		parent::adminPage();

		if ( !$this->user && $this->user_id == -1 ) {
			$this->user = array( 'role' => 1, 'displayName' => '隐藏管理员' );
		}
	}

	public function add_action () #act_name = 添加#
	{
		if ( is_post() ) {
			$rid = (int)get2( 'rid' );
			$index = (int)get2( 'index' );

			$mdl_table = $this->loadModel( get2( 'table' ) );
			$mdl_attachment = $this->loadModel( 'attachment' );

			$table = $mdl_table->get( $rid );
			if ( !in_array( $this->user['role'], array( 1, 2 ) ) ) {
				//当前管理员非系统管理员
				if ( $table['userId'] != $this->user['id'] ) {
					$result = array( 'status' => 500, 'msg' => '记录不存在' );
					echo json_encode( $result );exit;
				}
			}

			if ( $table ) {
				$photoObj = $_FILES['photo'];
				$allow_exts = array( 'jpg', 'jpeg', 'gif', 'png' );
				$filepath = date( 'Y-m' );
				$this->file->createdir( 'data/upload/'.$filepath );
				$objs = array();
				if ( is_array( $photoObj['name'] ) ) {
					foreach ( $photoObj['name'] as $k => $name ) {
						$objs[] = array(
							'name' => $name,
							'type' => $photoObj['type'][$k],
							'tmp_name' => $photoObj['tmp_name'][$k],
							'error' => $photoObj['error'][$k],
							'size' => $photoObj['size'][$k]
						);
					}
				}
				else $objs = $photoObj;

				$uploadedFiles = array();
				foreach ( $objs as $obj ) {
					$photo = $this->file->upfile( $allow_exts, $obj, UPDATE_DIR, $filepath.'/'.date( 'YmdHis' ).$this->createRnd() );
					if ( $photo ) {
						$photoSource = $this->file->nameExtend( $photo, '_o' );
						@copy( UPDATE_DIR.$photo, UPDATE_DIR.$photoSource );
						$sortnum = $mdl_attachment->getMax( 'sortnum', array( 'table' => get2( 'table' ), 'rid' => $rid, 'index' => $index ) ) + 10;
						if ( $id = $mdl_attachment->insert( array( 'table' => get2( 'table' ), 'rid' => $rid, 'index' => $index, 'sortnum' => $sortnum, 'file' => $photo, 'filename' => $obj['name'], 'title' => '', 'content' => '', 'status' => 1, 'createTime' => time() ) ) ) {
							$uploadedFiles[] = array( 'img' => $photo, 'id' => $id, 'simg' => $photoSource );
						}
						else {
							$this->file->deletefile( UPDATE_DIR.$photo );
							$this->file->deletefile( UPDATE_DIR.$photoSource );
						}
					}
				}

				if ( $uploadedFiles ) {
					$result = array( 'status' => 200, 'pics' => $uploadedFiles );
					echo json_encode( $result );exit;
				}
				else {
					$result = array( 'status' => 500, 'msg' => '上传失败' );
					echo json_encode( $result );exit;
				}
			}
			$result = array( 'status' => 500, 'msg' => '上传失败' );
			echo json_encode( $result );exit;
		}
	}

	public function delete_action () #act_name = 删除#
	{
		$id = (int)get2( 'id' );
		$index = (int)get2( 'index' );

		$mdl_table = $this->loadModel( get2( 'table' ) );
		$mdl_attachment = $this->loadModel( 'attachment' );

		$pic = $mdl_attachment->get( $id );
		$table = $mdl_table->get( $pic['rid'] );
		if ( !in_array( $this->user['role'], array( 1, 2 ) ) ) {
			//当前管理员非系统管理员
			if ( $table['userId'] != $this->user['id'] ) {
				$result = array( 'status' => 500, 'msg' => '记录不存在' );
				echo json_encode( $result );exit;
			}
		}

		if ( $pic && $table ) {
			if ( $mdl_attachment->delete( $pic['id'] ) ) {
				$this->file->deletefile( UPDATE_DIR.$pic['file'] );
				$this->file->deletefile( UPDATE_DIR.$this->file->nameExtend( $pic['file'], '_o' ) );
				$result = array( 'status' => 200 );
				echo json_encode( $result );exit;
			}
			else {
				$result = array( 'status' => 500, 'msg' => '删除失败' );
				echo json_encode( $result );exit;
			}
		}
		$result = array( 'status' => 500, 'msg' => '错误的参数' );
		echo json_encode( $result );exit;
	}

	public function sort_action () #act_name = 排序#
	{
		$ids = explode( ',', get2( 'ids' ) );
		$index = (int)get2( 'index' );
		$rid = (int)get2( 'rid' );
		$sortnums = explode( ',', get2( 'sortnums' ) );

		$mdl_table = $this->loadModel( get2( 'table' ) );
		$mdl_attachment = $this->loadModel( 'attachment' );

		$table = $mdl_table->get( $rid );
		if ( !in_array( $this->user['role'], array( 1, 2 ) ) ) {
			//当前管理员非系统管理员
			if ( $table['userId'] != $this->user['id'] ) {
				$result = array( 'status' => 500, 'msg' => '记录不存在' );
				echo json_encode( $result );exit;
			}
		}

		foreach ( $ids as $k => $id ) {
			$id = (int)$id;
			$sortnum = (int)$sortnums[$k];
			if ( $id > 0 && $sortnum > 0 ) {
				$mdl_attachment->updateByWhere( array( 'sortnum' => $sortnum * 10 ), array( 'id' => $id, 'rid' => $rid, 'table' => get2( 'table' ) ) );
			}
		}

		$result = array( 'status' => 200, 'msg' => '保存排序成功' );
		echo json_encode( $result );exit;
	}

	public function cut_action () #act_name = 裁剪#
	{
		$id = post( 'id' );
		$bounds = explode( ',', post( 'bounds' ) );
		$id = (int)$id;
		$w = (int)post( 'w' );
		$h = (int)post( 'h' );

		$mdl_table = $this->loadModel( get2( 'table' ) );
		$mdl_attachment = $this->loadModel( 'attachment' );

		$pic = $mdl_attachment->get( $id );
		$table = $mdl_table->get( $pic['rid'] );
		if ( !in_array( $this->user['role'], array( 1, 2 ) ) ) {
			//当前管理员非系统管理员
			if ( $table['userId'] != $this->user['id'] ) {
				$result = array( 'status' => 500, 'msg' => '记录不存在' );
				echo json_encode( $result );exit;
			}
		}

		if ( $pic && $table ) {
			$sourcePhoto = $this->file->nameExtend( $pic['file'], '_o' );
			if ( !file_exists( UPDATE_DIR.$sourcePhoto ) ) @copy( UPDATE_DIR.$pic['file'], UPDATE_DIR.$sourcePhoto );
			else @copy( UPDATE_DIR.$sourcePhoto, UPDATE_DIR.$pic['file'] );  //把原图覆盖回去，再次裁剪
			$photoInfo = $this->file->cutByPosBoundPost( UPDATE_DIR.$pic['file'], $bounds, $w, $h, true, $w, 2 );

			$result = array( 'status' => 200 );
			echo json_encode( $result );exit;
		}
		$result = array( 'status' => 500, 'msg' => '错误的参数' );
		echo json_encode( $result );exit;
	}

}

?>