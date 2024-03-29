
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

        <?php if(hasMessage()): ?>
        <div class="alert alert-success alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-check"></i> Pemberitahuan!</h4>
          <?= getMessage(); ?>
        </div>
        <?php endif; ?>

        <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">
                <a href="<?= base_url('klasifikasi/baru'); ?>" class="btn btn-primary">Tambah Data</a>
              </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="table2" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th style="width: 20px;">Kode</th>
                        <th>Klasifikasi</th>
                        <th>Keterangan</th>
                        <th style="width: 100px;" class="notexport">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($items as $item): ?>
                    <tr>
                        <td><?= $item['nmr_klasifikasi']; ?></td>
                        <td><?= $item['klasifikasi']; ?></td>
                        <td><?= $item['keterangan'] ?: '-'; ?></td>
                        <td>
                          <!--<a href="<?= base_url("klasifikasi/{$item['kode_klasifikasi']}/edit"); ?>" class="btn btn-info btn-sm">Edit</a>-->
                          <a href="<?= base_url("klasifikasi/{$item['kode_klasifikasi']}/hapus"); ?>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
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