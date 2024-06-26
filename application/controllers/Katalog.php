<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Katalog extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model(Buku_model::class, 'buku');
        $this->load->model(Ebook_model::class, 'ebook');

        $this->load->model(Rak_model::class, 'rak');
        $this->load->model(Kategori_model::class, 'kategori');
        $this->load->model(Klasifikasi_model::class, 'klasifikasi');
        $this->load->model(Penerbit_model::class, 'penerbit');

        $this->load->model(Peminjaman_model::class, 'peminjaman');
        $this->load->model(PeminjamanDetail_model::class, 'detail');
		$this->load->model(PengajuanPeminjaman_model::class, 'pengajuan');
    }

    public function index()
    {
        if (!isset($_SESSION['nama'])) return redirect('logbook');
        $data = [
            'title' => 'Katalog Buku',
            'sidebar' => ['buku'],
            'items' => isset($_GET['q']) ? $this->buku->getAllDataLike($_GET['q']) : $this->buku->getAllData(),
			'segment' => 'katalog',
			'carts' => $_SESSION['carts'],
        ];

        guestView('katalog/catalogue', $data);
    }

    public function show($id)
    {
        if (!isset($_SESSION['nama'])) return redirect('logbook');
        $data = [
            'title' => 'Katalog Buku',
            'sidebar' => ['buku'],
            'item' => $this->buku->getData($id),
			'carts' => $_SESSION['carts'],
        ];
        // view('buku/index', $data);
        guestView('katalog/show', $data);
    }

    public function pinjam()
    {
        if (!isset($_SESSION['nis'])) return redirect('logbook');
        $this->form_validation->set_rules('tanggal_tenggat', 'Pinjam', 'required');

        if ($this->form_validation->run()) {
            $data = $this->input->post();

			$details = [];
            foreach ($data['id_buku'] as $index => $id) {
                $details[] = [
                    'no_peminjaman' => null,
                    'id_buku' => $id,
                    'tanggal_kembali' => null,
					'judul' => $_SESSION['carts'][$index]['judul'],
                ];
            }
			$pengajuan = [
				'id_akun' => $_SESSION['id'],
				'konten' => json_encode([
					'nis' => $data['nis'],
					'nama' => $_SESSION['nama'],
					'tanggal_tenggat' => $data['tanggal_tenggat'],
					'email' => $data['email'],
					'keterangan' => $data['keterangan'],
					'details' => $details,
				]),
			];

			$this->pengajuan->insert($pengajuan);

            $message = 'Berhasil meminjam buku!';
			$_SESSION['carts'] = [];

            setMessage($message);
            redirect('/riwayat-pinjam-buku#pengajuan-peminjaman');
        };

        $data = [
            'title' => 'Peminjaman',
            'sidebar' => ['peminjaman'],
            'buku' => $this->buku->getAllAvailable(),
			'carts' => $_SESSION['carts'],
        ];

        guestView('katalog/create', $data);
    }

    public function history()
    {
        if (!isset($_SESSION['nis'])) return redirect('logbook');

		$props = [];

		$temps = $this->pengajuan->getAllByAccountID($_SESSION['id']);
		foreach ($temps as $temp) {
			$content = json_decode($temp['konten'], true);
			foreach ($content['details'] as $detail) {
				$props[] = [
					'judul' => $detail['judul'] ?? '-',
					'tanggal_pinjam' => $temp['created_at'],
					'tanggal_tenggat' => $content['tanggal_tenggat'],
					'status' => $temp['status'] == 0 ? 'Menunggu Persetujuan' : ($temp['status'] == 1 ? 'Disetujui' : 'Ditolak'),
				];
			}
		}

        $data = [
            'title' => 'Riwayat Peminjaman',
            'sidebar' => ['riwayat'],
            'items' => $this->detail->getAllDipinjamNis($_SESSION['nis']),
			'prop_items' => $props,
			'carts' => $_SESSION['carts'],
        ];

        guestView('katalog/history', $data);
    }

    public function perpanjang()
    {
        $no = $this->input->post('no_peminjaman');
        $tenggat = $this->input->post('tanggal_tenggat');

        $message = 'Peminjaman buku ' . ($this->peminjaman->update(['tanggal_tenggat' => $tenggat], $no) ? 'berhasil' : 'gagal') . ' diperpanjang!';
        setMessage($message);
        redirect('/katalog/history');
    }

    public function ebook()
    {
        if (!isset($_SESSION['nama'])) return redirect('logbook');
        $data = [
            'title' => 'Katalog E-Book',
            'sidebar' => ['ebook'],
            'items' => isset($_GET['q']) ? $this->ebook->getLike($_GET['q']) : $this->ebook->getAll(),
			'segment' => 'katalog-ebook',
			'carts' => $_SESSION['carts'],
        ];
        // view('buku/index', $data);
        guestView('katalog/catalogue', $data);
    }

    public function show_ebook($id)
    {
        if (!isset($_SESSION['nama'])) return redirect('logbook');
        $data = [
            'title' => 'Katalog E-Book',
            'sidebar' => ['ebook'],
            'item' => $this->ebook->get($id),
			'carts' => $_SESSION['carts'],
        ];
        // view('buku/index', $data);
        guestView('katalog/show', $data);
    }

	public function add_to_cart($id)
	{
		header('Content-type: application/json');
		$book = $this->buku->getData($id);

		$_SESSION['carts'][] = $book;

		echo json_encode($book);
	}

	public function remove_cart($id)
	{
		$oldCart = $_SESSION['carts'];
		$_SESSION['carts'] = [];

		foreach ($oldCart as $cart) {
			if ($cart['id_buku'] != $id) {
				$_SESSION['carts'][] = $cart;
			}
		}

        redirect('/pinjam-buku');
	}

	public function clear_cart()
	{
		$_SESSION['carts'] = [];
        redirect('/pinjam-buku');
	}
}
