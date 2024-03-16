<?php
defined('BASEPATH') or exit;

class Ebook_model extends MY_Model
{
	protected $table = 'ebook';
	protected $id = 'id_ebook';

	public function getAllWithCondition() {
		$this->db->select('*, IF(tanggal >= now() - interval 7 day, 1, 0) as baru');
		return $this->getAll();
	}

	public function getAllAvailable()
	{
		$this->db->where('jumlah >', 0);
		return $this->getAll();
	}
	
	public function getAllNewBook()
	{
		$this->db->where('tanggal >= now() - interval 7 day');
		return $this->getAll();
	}

	public function getLike($key)
	{
		$this->db->like("$this->table.judul", $key);
		return $this->getAll();
	}
}
