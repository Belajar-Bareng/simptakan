<?php
defined('BASEPATH') or exit;

class Pengunjung_model extends MY_Model
{
	protected $table = 'pengunjung';
	protected $id = 'id_pengunjung';

	public function countToday()
	{
		$this->db->where('DATE(pengunjung.tanggal)=CURDATE()');
		return $this->count();
	}

	public function getAllOrdered()
	{
		$this->db->order_by('tanggal', 'ASC');
		return $this->getAll();
	}

	public function getAllToday()
	{
		$this->db->where('DATE(pengunjung.tanggal)=CURDATE()');
		return $this->getAll();
	}

	public function getPopular()
	{
		$this->db->select("pengunjung.nama, count(*) as total");
		$this->db->group_by('pengunjung.nama');
		$this->db->order_by('total', 'DESC');
		$this->db->limit(5);
		return $this->db->get($this->table)->result_array();
	}

	public function getAllPopular()
	{
		$this->db->select("*, count(*) as total");
		$this->db->group_by('pengunjung.nama');
		$this->db->order_by('total', 'DESC');
		$this->db->limit(5);
		return $this->getAll();
	}
}
