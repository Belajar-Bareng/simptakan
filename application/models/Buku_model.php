<?php
defined('BASEPATH') or exit;

class Buku_model extends MY_Model
{
	protected $table = 'buku';
	protected $id = 'id_buku';

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
		return $this->getAllData();
	}

	public function getAllPopular()
	{
		$this->db->select(" count(*) as total");
		$this->db->select("{$this->table}.*, rak.rak as rak, penerbit.penerbit, kategori.kategori, klasifikasi.nmr_klasifikasi ");
		$this->db->join('rak', 'buku.id_rak=rak.id_rak');
		$this->db->join('kategori', 'buku.id_kategori=kategori.id_kategori');
		$this->db->join('penerbit', 'buku.id_penerbit=penerbit.id_penerbit');
		$this->db->join('klasifikasi', 'buku.kode_klasifikasi=klasifikasi.kode_klasifikasi');
		$this->db->join('peminjaman_detail', 'buku.id_buku=peminjaman_detail.id_buku');
		$this->db->group_by('buku.id_buku');
		$this->db->order_by('total', 'DESC');
		$this->db->limit('6');
		return $this->db->get($this->table)->result_array();
		// $id = [];
		// $books = $this->db->order_by('jumlah', 'DESC')->group_by('id_buku')->select('id_buku as id, count(id_buku) as jumlah')->get('peminjaman_detail')->limit(6)->result_array();
		// foreach ($books as $item) {
		// 	$id[] = $item['id'];
		// } return $books;
		// if (empty($id)) {
		// 	return false;
		// }
		// $this->db->where_in("{$this->table}.{$this->id}", $id);
		// return $this->getAllDatafrontend();
	}

	public function getAllData()
	{
		$this->db->select("{$this->table}.*, rak.rak as rak, penerbit.penerbit, kategori.kategori, klasifikasi.klasifikasi, IF(buku.tanggal >= now() - interval 7 day, 1, 0) as baru ");
		$this->db->join('rak', 'buku.id_rak=rak.id_rak');
		$this->db->join('kategori', 'buku.id_kategori=kategori.id_kategori');
		$this->db->join('penerbit', 'buku.id_penerbit=penerbit.id_penerbit');
		$this->db->join('klasifikasi', 'buku.kode_klasifikasi=klasifikasi.kode_klasifikasi');
		return $this->db->get($this->table)->result_array();
	}

	public function getAllDatafrontend()
	{
		$this->db->select("{$this->table}.*, rak.rak as rak, penerbit.penerbit, kategori.kategori, klasifikasi.klasifikasi ");
		$this->db->join('rak', 'buku.id_rak=rak.id_rak');
		$this->db->join('kategori', 'buku.id_kategori=kategori.id_kategori');
		$this->db->join('penerbit', 'buku.id_penerbit=penerbit.id_penerbit');
		$this->db->join('klasifikasi', 'buku.kode_klasifikasi=klasifikasi.kode_klasifikasi');
		return $this->db->get($this->table)->result_array();
	}

	public function getAllDataLike($key)
	{
		$this->db->like('buku.judul', $key);
		return $this->getAllData();
	}

	public function getData($id)
	{
		$this->db->select("{$this->table}.*, rak.rak as rak, penerbit.penerbit, kategori.kategori, klasifikasi.nmr_klasifikasi");
		$this->db->join('rak', 'buku.id_rak=rak.id_rak');
		$this->db->join('kategori', 'buku.id_kategori=kategori.id_kategori');
		$this->db->join('penerbit', 'buku.id_penerbit=penerbit.id_penerbit');
		$this->db->join('klasifikasi', 'buku.kode_klasifikasi=klasifikasi.kode_klasifikasi');
		$this->db->where('buku.id_buku', $id);
		return $this->db->get($this->table)->row_array();
	}

	public function getPopular()
	{
		$this->db->select("buku.judul, count(*) as total");
		$this->db->join('buku', 'buku.id_buku=peminjaman_detail.id_buku');
		$this->db->group_by('buku.id_buku');
		$this->db->order_by('total', 'DESC');
		$this->db->limit(5);
		return $this->db->get($this->table)->result_array();
	}
}
