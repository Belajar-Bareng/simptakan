<?php
defined('BASEPATH') or exit;

class PeminjamanDetail_model extends MY_Model
{
	protected $table = 'peminjaman_detail';
	protected $id = 'id_peminjaman';

	public function getAllDetail()
	{
		$this->db->select("peminjaman_detail.*, peminjaman.*, siswa.nama, buku.judul");
		$this->db->join('peminjaman', 'peminjaman.no_peminjaman=peminjaman_detail.no_peminjaman');
		$this->db->join('siswa', 'peminjaman.nis=siswa.nis');
		$this->db->join('buku', 'peminjaman_detail.id_buku=buku.id_buku');
		return $this->db->get($this->table)->result_array();
	}

	public function getAllDetailLimit()
	{
		$this->db->select("peminjaman_detail.*, peminjaman.*, siswa.nama, buku.judul");
		$this->db->join('peminjaman', 'peminjaman.no_peminjaman=peminjaman_detail.no_peminjaman');
		$this->db->join('siswa', 'peminjaman.nis=siswa.nis');
		$this->db->join('buku', 'peminjaman_detail.id_buku=buku.id_buku');
		$this->db->group_by('peminjaman_detail.no_peminjaman');
		$this->db->order_by('id_peminjaman', 'DESC');
		$this->db->limit(5);
		return $this->db->get($this->table)->result_array();
	}

	public function getAllDetailLimitCount()
	{
		$this->db->select("peminjaman_detail.*, peminjaman.*, siswa.nama, buku.judul, count(*) as total");
		$this->db->join('peminjaman', 'peminjaman.no_peminjaman=peminjaman_detail.no_peminjaman');
		$this->db->join('siswa', 'peminjaman.nis=siswa.nis');
		$this->db->join('buku', 'peminjaman_detail.id_buku=buku.id_buku');
		$this->db->group_by('peminjaman_detail.id_buku');
		$this->db->order_by('total', 'DESC');
		$this->db->limit(5);
		return $this->db->get($this->table)->result_array();
	}

	public function getAllDetailToday()
	{
		$this->db->where('DATE(peminjaman.tanggal_pinjam)=CURDATE()');
		return $this->getAllDetail();
	}

	public function getDetail($id)
	{
		$this->db->select("peminjaman_detail.*, peminjaman.*, siswa.nama, buku.judul");
		$this->db->join('peminjaman', 'peminjaman.no_peminjaman=peminjaman_detail.no_peminjaman');
		$this->db->join('siswa', 'peminjaman.nis=siswa.nis');
		$this->db->join('buku', 'peminjaman_detail.id_buku=buku.id_buku');
		$this->db->where("{$this->table}.{$this->id}", $id);
		return $this->db->get($this->table)->row_array();
	}

	public function getAllDipinjam()
	{
		$this->db->where('peminjaman_detail.tanggal_kembali', null);
		return $this->getAllDetail();
	}

	public function getAllDipinjamNis($nis)
	{
		$this->db->where('siswa.nis', $nis);
		return $this->getAllDetail();
	}

	public function getPopular()
	{
		$this->db->select("buku.judul as judul, count(*) as total");
		$this->db->join('buku', 'buku.id_buku=peminjaman_detail.id_buku');
		$this->db->group_by('buku.id_buku, buku.judul');
		$this->db->order_by('total', 'DESC');
		return $this->db->get($this->table)->result_array();
	}

	public function getPopularLimit()
	{
		$this->db->select("buku.judul, count(*) as total");
		$this->db->join('buku', 'buku.id_buku=peminjaman_detail.id_buku');
		$this->db->group_by('buku.id_buku');
		$this->db->order_by('total', 'DESC');
		$this->db->limit(5);
		return $this->db->get($this->table)->result_array();
	}

	public function getbukubaru()
	{
		$this->db->select("judul, jumlah");
		$this->db->from('buku');
		$this->db->order_by('tanggal', 'DESC');
		$this->db->limit('5');
		return $this->db->get()->result_array();
	}
}
