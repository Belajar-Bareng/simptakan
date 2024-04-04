<?php
defined('BASEPATH') or exit;

class PengajuanPeminjaman_model extends MY_Model
{
	protected $table = 'pengajuan_peminjaman';
	protected $id = 'id';

	public function getAllUnresolved()
	{
		$this->db->where_in('status', [0, 2]);
		return $this->getAll();
	}

	public function getAllUnresolvedByAccountID($id)
	{
		$this->db->where('id_akun', $id);
		return $this->getAllUnresolved();
	}

	public function getAllByAccountID($id)
	{
		$this->db->where('id_akun', $id);
		return $this->getAll();
	}

	public function getAllUnconfirmed()
	{
		$this->db->where('status', 0);
		return $this->getAll();
	}
}
