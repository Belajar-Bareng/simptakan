<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <?= $title; ?>
    </h1>
  </section>

  <!-- Main content -->
  <section class="content">

    <?php if (hasMessage()) : ?>
      <div class="alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
        <h4><i class="icon fa fa-check"></i> Pemberitahuan!</h4>
        <?= getMessage(); ?>
      </div>
    <?php endif; ?>

    <div class="box box-primary">
      <div class="box-header">
        <?php if (isJabatan('Petugas')) : ?>
          <h3 class="box-title">
            <a href="<?= base_url('buku/baru'); ?>" class="btn btn-primary">Tambah Data</a>
          </h3>
        <?php endif; ?>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <table id="table1" class="table table-bordered table-striped">
          <thead>
            <tr>
              <th style="width: 20px;">No.</th>
              <th>Judul</th>
              <th>ISBN</th>
              <th>Pengarang</th>
              <th>Tahun</th>
              <th>Jumlah</th>
              <th>Status</th>
              <th>QR Code</th>
              <th style="width: 150px;" class="notexport">Aksi</th>
            </tr>
          </thead>
          <tbody>
            <?php $no = 1; ?>
            <?php foreach ($items as $item) : ?>
              <tr>
                <td><?= $no++; ?></td>
                <td><?= $item['judul']; ?></td>
                <td><?= $item['isbn'] ?: '-'; ?></td>
                <td><?= $item['pengarang'] ?: '-'; ?></td>
                <td><?= $item['tahun'] ?: '-'; ?></td>
                <td><?= $item['jumlah'] ?: '-'; ?></td>
                <td>
                  <?php
                  $tanggal_sekarang = new DateTime();
                  $tanggal_database = new DateTime($item['tanggal']);
                  $tanggal_database->modify('+7 days');
                  ?>
                  <?php if ($tanggal_sekarang < $tanggal_database) { ?>
                    <div class="badge bg-blue">Baru</div>
                  <?php } else { ?>
                    <div>-</div>
                  <?php } ?>
                </td>
                <td>
                  <?php
                  // Generate QR code
                  $params['data'] = "Tanggal: " . $item['tanggal'] . "\nJUDUL: " . $item['judul'] . "\nISBN: " . $item['isbn'] . "\nPengarang: " . $item['pengarang'] . "\nTahun: " . $item['tahun'] . "\nPenerbit: " . $item['penerbit'] . "\nRak: " . $item['rak'] . "\nKategori: " . $item['kategori'] . "\nKlasifikasi: " . $item['klasifikasi'] . "\nJumlah: " . $item['jumlah'];
                  $params['level'] = 'H';
                  $params['size'] = 10;
                  $params['savename'] = FCPATH . $item['id_buku'] . '.png';

                  $this->ciqrcode->generate($params);
                  echo '<img src="' . base_url() . $item['id_buku'] . '.png" width="100px" />';
                  ?>
                </td>
                <td>
                  <?php if ($item['id_rak'] and $item['id_kategori'] and $item['kode_klasifikasi'] and $item['id_penerbit']) : ?>
                    <a href="<?= base_url("buku/{$item['id_buku']}"); ?>" class="btn btn-success btn-sm">Lihat</a>
                  <?php else : ?>
                    <button class="btn btn-success btn-sm" disabled>Lihat</button>
                  <?php endif; ?>
                  <?php if (isJabatan('Petugas')) : ?>
                    <a href="<?= base_url("buku/{$item['id_buku']}/edit"); ?>" class="btn btn-info btn-sm">Edit</a>
                    <a href="<?= base_url("buku/{$item['id_buku']}/hapus"); ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
                  <?php endif; ?>
                </td>

              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>
      <!-- /.box-body -->
    </div>
    <!-- /.box -->

  </section>
  <!-- /.content -->
</div>
<!-- /.content-wrapper -->