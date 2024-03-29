
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

    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">
            <a href="<?= base_url('petugas'); ?>" class="btn btn-default">Kembali</a>
            </h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form class="form-horizontal" method="POST" action="<?= current_url(); ?>" enctype="multipart/form-data">
            <div class="box-body">
                <div class="form-group <?= isInvalid('nip') ?>">
                    <label for="nip" class="col-sm-2 control-label">NIP</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nip" name="nip" placeholder="Masukkan NIP" value="<?= set_value('nip', $item['nip']); ?>">
                    </div>
                </div>
                <div class="form-group <?= isInvalid('nama') ?>">
                    <label for="nama" class="col-sm-2 control-label">Nama</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="nama" name="nama" placeholder="Masukkan Nama" value="<?= set_value('nama', $item['nama']); ?>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="jenis_kelamin" class="col-sm-2 control-label">Jenis Kelamin</label>
                    <div class="col-sm-10">
                        <select class="form-control" name="jenis_kelamin" id="jenis_kelamin">
                            <?php foreach(['L' => 'Laki-laki', 'P' => 'Perempuan'] as $key => $val): ?>
                              <option <?= selected($item['jenis_kelamin'], $key); ?> <?= selected($item['jenis_kelamin'], $key); ?> value="<?= $key; ?>" ><?= $val; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>
                <div class="form-group <?= isInvalid('no_telp') ?>">
                    <label for="no_telp" class="col-sm-2 control-label">No. Telp</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="no_telp" name="no_telp" placeholder="Masukkan No. Telp" value="<?= set_value('no_telp', $item['no_telp']); ?>">
                    </div>
                </div>
                <div class="form-group <?= isInvalid('alamat') ?>">
                    <label for="alamat" class="col-sm-2 control-label">Alamat</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="alamat" name="alamat" placeholder="Masukkan Alamat" value="<?= set_value('alamat', $item['alamat']); ?>">
                    </div>
                </div>
                <div class="form-group <?= isInvalid('foto') ?>">
                    <label for="foto" class="col-sm-2 control-label">Foto</label>
                    <div class="col-sm-10 row">
                      <div class="col-md-6 col-6">
                        <div class="custom-file">
                          <input type="file" class="custom-file-input" id="foto" name="foto">
                          <label class="custom-file-label" for="foto" data-browse="Cari">Pilih Gambar (maks: 2048KB)</label>
                        </div>
                      </div>
                      <div class="col-6 col-md-6 mt-3 mt-md-0">
                        <img src="<?= $item['foto'] ? upload($item['foto']) : asset('img/avatar.png'); ?>"
                          class="img-fluid mb-2 img-thumbnail img-preview"
                          alt="Gambar Siswa" width="100%"/>
                      </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <button type="submit" class="btn btn-primary">Simpan</button>
                <button type="reset" class="btn btn-default pull-right">Ulangi</button>
            </div>
            <!-- /.box-footer -->
        </form>
    </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->