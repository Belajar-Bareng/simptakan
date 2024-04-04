<?php

defined('BASEPATH') or exit('No direct script access allowed');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Peminjaman extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if (!isLogin()) return redirect('/login');
        $this->load->model(Peminjaman_model::class, 'peminjaman');
        $this->load->model(PeminjamanDetail_model::class, 'detail');
		$this->load->model(PengajuanPeminjaman_model::class, 'pengajuan');
        $this->load->model(Siswa_model::class, 'siswa');
        $this->load->model(Buku_model::class, 'buku');

        require APPPATH . 'libraries/phpmailer/application/libraries/phpmailer/src/Exception.php';
        require APPPATH . 'libraries/phpmailer/application/libraries/phpmailer/src/PHPMailer.php';
        require APPPATH . 'libraries/phpmailer/application/libraries/phpmailer/src/SMTP.php';
    }

    public function index()
    {
        $this->form_validation->set_rules('tanggal_tenggat', 'Pinjam', 'required');

        if ($this->form_validation->run()) return $this->_store();

        $data = [
            'title' => 'Peminjaman',
            'sidebar' => ['peminjaman'],
            'siswa' => $this->siswa->getAll(),
            'buku' => $this->buku->getAllAvailable(),
            'dipinjam' => $this->detail->getAllDipinjam(),
        ];

        view('peminjaman/index', $data);
    }

    public function history()
    {
        $data = [
            'title' => 'Riwayat Peminjaman',
            'sidebar' => ['peminjaman'],
            'items' => $this->detail->getAllDetail(),
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

    public function pengembalian($id)
    {
        $no = $this->detail->getDetail($id);
        $denda = round((time() - strtotime($no['tanggal_tenggat'])) / 60 / 60 / 24) * 500;
        $data = [
            'tanggal_kembali' => date('Y-m-d H:i:s'),
            'denda' => $denda < 0 ? 0 : $denda,
        ];
        $message = 'Buku ' . ($this->detail->update($data, $id) ? 'berhasil' : 'gagal') . ' dikembalikan!';
        setMessage($message);
        redirect('/peminjaman');
    }

	public function kehilangan($id)
	{
		$detail = $this->detail->getDetail($id);
		$book = $this->buku->get($detail['id_buku']);

		$this->detail->update(['denda' => 50_000, 'status' => 0], $id);
		$this->buku->update(['jumlah' => $book['jumlah']], $detail['id_buku']);

		$message = 'Buku telah ditandai hilang ketika peminjaman!';
		setMessage($message);
		redirect('/peminjaman');
	}

    public function perpanjang()
    {
        $no = $this->input->post('no_peminjaman');
        $tenggat = $this->input->post('tanggal_tenggat');

        $message = 'Peminjaman buku ' . ($this->peminjaman->update(['tanggal_tenggat' => $tenggat], $no) ? 'berhasil' : 'gagal') . ' diperpanjang!';
        setMessage($message);
        redirect('/peminjaman');



        $no = $this->input->post('no_peminjaman');
        $tenggat = $this->input->post('tanggal_tenggat');

        $message = 'Peminjaman buku ' . ($this->peminjaman->update(['tanggal_tenggat' => $tenggat], $no) ? 'berhasil' : 'gagal') . ' diperpanjang!';
        setMessage($message);
        redirect('/peminjaman');
    }

    public function send()
    {
        // PHPMailer object
        // require_once '../../libraries/phpmailer/index.php';
        $response = false;
        $mail = new PHPMailer();

        // SMTP configuration
        $mail->isSMTP();
        $mail->Host     = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
        $mail->Username = 'deskalsel.adika2023@gmail.com'; // user email anda
        $mail->Password = 'rkch puoa zmoj ikko'; // diisi dengan App Password yang sudah di generate kgsm iztc ybtw sjjo
        $mail->SMTPSecure = 'ssl';
        $mail->Port     = 465;

        $mail->setFrom('deskalsel.adika2023@gmail.com', 'SIMPTAKAN'); // user email anda
        $mail->addReplyTo('deskalsel.adika2023@gmail.com', ''); //user email anda

        // Email subject
        $mail->Subject = 'Pemberitahuan Pengembalian Buku | SIMPTAKAN'; //subject email

        // Add a recipient
        $mail->addAddress($this->input->post('email')); //email tujuan pengiriman email

        // Set email format to HTML
        $mail->isHTML(true);

        // Email body content
        $mailContent = "<p>Hallo <b>" . $this->input->post('nama') . "</b> berikut ini adalah detail buku yang harus dikembalikan:</p>
        <table>
            <tr>
            <td>Nama</td>
            <td>:</td>
            <td>" . $this->input->post('nama') . "</td>
            </tr>
            <tr>
            <td>Buku</td>
            <td>:</td>
            <td>" . $this->input->post('buku') . "</td>
            </tr>
            <tr>
            <td>Denda</td>
            <td>:</td>
            <td>" . $this->input->post('denda') . "</td>
            </tr>
            <tr>
            <td>Email</td>
            <td>:</td>
            <td>" . $this->input->post('email') . "</td>
            </tr>
        </table>
        <p>Mohon <b>" . $this->input->post('nama') . "</b> untuk segera mengembalikan buku ke perpustakaan.</p>"; // isi email
        $mail->Body = $mailContent;

        // Send email
        if (!$mail->send()) {
            $message = 'Email Gagal Dikirim!' . $mail->ErrorInfo;
            setMessage($message);
            redirect('/peminjaman');
        } else {
            $message = 'Email Berhasil Dikirim!';
            setMessage($message);
            redirect('/peminjaman');
        }
    }

    private function _store()
    {
        $data = $this->input->post();

        if (array_count_values($data['id_buku'])['-'] == 3) return redirect('/peminjaman');

        $peminjaman = [
            'nis' => $data['nis'],
            'tanggal_tenggat' => $data['tanggal_tenggat'],
            'email' => $data['email'],
            'keterangan' => $data['keterangan'],
        ];

        $no = $this->peminjaman->insert($peminjaman);

        $dataId = array_unique($data['id_buku']);

        foreach ($dataId as $id_buku) {
            if ($id_buku == '-') continue;
            $this->detail->insert([
                'no_peminjaman' => $no,
                'id_buku' => $id_buku,
                'tanggal_kembali' => null,
            ]);
        }

        $message = 'Berhasil meminjamkan buku!';
        setMessage($message);
        redirect('/peminjaman');
    }

	public function process_book_application($id, $status)
	{
		$prop = $this->pengajuan->get($id);
		$prop['status'] = $status == 1 ? 1: 2;
		$this->pengajuan->update($prop, $id);

		if ($status == 2) {
			$message = 'Berhasil menolak pengajuan peminjaman buku!';
			setMessage($message);
			redirect('/dashboard');
			return;
		}

		$content = json_decode($prop['konten'], true);

		$peminjaman = [
			'nis' => $content['nis'],
			'tanggal_tenggat' => $content['tanggal_tenggat'],
			'email' => $content['email'],
			'keterangan' => $content['keterangan'],
		];
		$no = $this->peminjaman->insert($peminjaman);

		foreach ($content['details'] as $book) {
			$this->detail->insert([
				'no_peminjaman' => $no,
				'id_buku' => $book['id_buku'],
				'tanggal_kembali' => null,
			]);
		}

        $message = 'Berhasil menyetujui pengajuan peminjaman buku!';
        setMessage($message);
		redirect('/dashboard');
	}
}
