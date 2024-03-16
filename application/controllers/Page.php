<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Page extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->model(Buku_model::class, 'buku');
        $this->load->model(Ebook_model::class, 'ebook');
        $this->load->model(Siswa_model::class, 'siswa');
        $this->load->model(Peminjaman_model::class, 'minjam');
        $this->load->model(Pengunjung_model::class, 'kunjung');

        $this->load->model(PeminjamanDetail_model::class, 'peminjaman_detail');
        $this->load->model(PengadaanDetail_model::class, 'pengadaan_detail');
        $this->load->model(BukuKeluar_model::class, 'pengeluaran');
        $this->load->model(Pengunjung_model::class, 'pengunjung');

        $this->load->model(Petugas_model::class, 'petugas');
    }

    public function index()
    {
        $data = [
            'buku' => $this->buku->getAllPopular(),
            'petugas' => $this->petugas->getAll(),
			'new' => [],
        ];

		$count_new_book = count($this->buku->getAllNewBook());
		if ($count_new_book > 0) {
			array_push($data['new'], $count_new_book . ' buku baru');
		}

		$count_new_ebook = count($this->ebook->getAllNewBook());
		if ($count_new_ebook > 0) {
			array_push($data['new'], $count_new_ebook . ' ebook baru');
		}

        $this->load->view('pages/frontend', $data);
    }

    public function dashboard()
    {
        if (!isLogin()) return redirect('/login');
        if (isJabatan('Anggota') or isJabatan('Pengunjung')) return redirect('katalog');

        $data = [
            'title' => 'Dashboard',
            'sidebar' => ['dashboard'],
            'count' => [
                'buku' => $this->buku->count(),
                'siswa' => $this->siswa->count(),
                'minjam' => $this->minjam->countToday(),
                'kunjung' => $this->kunjung->countToday(),
            ],
            'populer' => $this->peminjaman_detail->getPopular(),
            'bukubaru' => $this->peminjaman_detail->getbukubaru(),
			'new_book' => $this->buku->getAllNewBook(),
			'new_ebook' => $this->ebook->getAllNewBook(),
        ];

        view('dashboard', $data);
    }

    public function peminjaman()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Peminjaman',
            'sidebar' => ['peminjaman'],
            'items' => $this->peminjaman_detail->getAllDetail(),
			'chart' => [],
        ];

		$dateLabel = [];
		$map = [];

		foreach ($data['items'] as $item) {
			$date = date('d/m/Y', strtotime($item['tanggal_pinjam']));
			if(isset($map[$date])) {
				$map[$date]++;
			} else {
				array_push($dateLabel, $date);
				$map[$date] = 1;
			}
		}

		foreach ($dateLabel as $date) {
			array_push($data['chart'], [
				'total' => $map[$date],
				'date' => $date,
			]);
		}

        view('peminjaman/history', $data);
    }

    public function peminjaman_today()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Peminjaman Hari Ini',
            'sidebar' => ['peminjaman'],
            'items' => $this->peminjaman_detail->getAllDetailToday(),
        ];

        view('peminjaman/history', $data);
    }

    public function buku_cetak()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Peminjaman',
            'sidebar' => ['peminjaman'],
            'items' => $this->peminjaman_detail->getAllDetail(),
            'buku_populer' => $this->peminjaman_detail->getPopularLimit(),
        ];

        view('peminjaman/cetak', $data);
    }

    public function pengadaan()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Pengadaan',
            'sidebar' => ['pengadaan'],
            'items' => $this->pengadaan_detail->getAllDetail(),
			'chart' => [],
        ];

		$dateLabel = [];
		$map = [];


		foreach ($data['items'] as $item) {
			$date = date('d/m/Y', strtotime($item['tanggal']));
			if(isset($map[$date])) {
				$map[$date] += (int) $item['jumlah'];
			} else {
				array_push($dateLabel, $date);
				$map[$date] = (int) $item['jumlah'];
			}
		}

		foreach ($dateLabel as $date) {
			array_push($data['chart'], [
				'total' => $map[$date],
				'date' => $date,
			]);
		}

        view('pengadaan/history', $data);
    }

    public function pengeluaran()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Pengeluaran',
            'sidebar' => ['pengeluaran'],
            'items' => $this->pengeluaran->getAllDetail(),
			'chart' => [],
        ];

		$dateLabel = [];
		$map = [];


		foreach ($data['items'] as $item) {
			$date = date('d/m/Y', strtotime($item['tanggal']));
			if(isset($map[$date])) {
				$map[$date] += (int) $item['jumlah'];
			} else {
				array_push($dateLabel, $date);
				$map[$date] = (int) $item['jumlah'];
			}
		}

		foreach ($dateLabel as $date) {
			array_push($data['chart'], [
				'total' => $map[$date],
				'date' => $date,
			]);
		}

        view('pengeluaran/history', $data);
    }

    public function pengunjung()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Kunjungan',
            'sidebar' => ['pengunjung'],
            'items' => $this->pengunjung->getAllOrdered(),
			'chart' => [],
        ];

		$dateLabel = [];
		$map = [];

		foreach ($data['items'] as $item) {
			$date = date('d/m/Y', strtotime($item['tanggal']));
			if(isset($map[$date])) {
				$map[$date]++;
			} else {
				array_push($dateLabel, $date);
				$map[$date] = 1;
			}
		}

		foreach ($dateLabel as $date) {
			array_push($data['chart'], [
				'total' => $map[$date],
				'date' => $date,
			]);
		}

        view('pengunjung/index', $data);
    }

    public function pengunjung_cetak()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Kunjungan',
            'sidebar' => ['pengunjung'],
            'items' => $this->pengunjung->getAllPopular(),
            'popular' => $this->pengunjung->getPopular()
        ];

        view('pengunjung/cetak', $data);
    }

    public function pengunjung_today()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Kunjungan',
            'sidebar' => ['pengunjung'],
            'items' => $this->pengunjung->getAllToday(),
        ];

        view('pengunjung/index', $data);
    }

    public function pengunjung_terbanyak()
    {
        if (!isLogin()) return redirect('/login');
        $data = [
            'title' => 'Laporan Kunjungan',
            'sidebar' => ['pengunjung'],
            'items' => $this->pengunjung->getAllPopular(),
            'popular' => $this->pengunjung->getPopular()
        ];

        view('pengunjung/index', $data);
    }

    public function buku_populer()
    {
        $data = [
            'title' => 'Buku Terpopuler',
            'sidebar' => ['buku-populer'],
            'items' => $this->peminjaman_detail->getAllDetail(),
			'popular' => $this->peminjaman_detail->getPopular(),
        ];

        view('peminjaman/popular', $data);
    }
}
