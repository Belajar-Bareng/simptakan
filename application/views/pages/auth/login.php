<body class="hold-transition login-page">
  <!-- <img class="center-block" src="<?= asset('img/avatar_01.png') ?>"> -->
<div class="login-box">
  <div class="login-logo">
   <!--  <br>
    <br> -->
    <!-- <img class="center-block" src="<?= asset('img/logo.png') ?>"> -->
    <a href="<?= base_url(); ?>"><b>SIMP</b>TAKAN</a>
  </div>
  <?php if(hasMessage()): ?>
        <div class="alert alert-danger alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-warning"></i> Peringatan!</h4>
          <?= getMessage(); ?>
        </div>
  <?php endif; ?>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Silakan login untuk melanjutkan</p>

    <form action="<?= current_url(); ?>" method="post">
      <div class="form-group has-feedback <?= isInvalid('username'); ?>">
        <input type="text" class="form-control" placeholder="Username" name="username" value="<?= set_value('username'); ?>">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback <?= isInvalid('password'); ?>">
        <input type="password" class="form-control" placeholder="Password" name="password" id="inputpass">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        <br>
        <input type="checkbox" onclick="myFunction()"> Tampilkan Password
      </div>
      <script type=>
        function myFunction() {
          var x = document.getElementById("inputpass");
          if (x.type === "password") {
              x.type = "text";
          } else {
              x.type = "password";
          }
        }
      </script>
      <div class="row">
        <div class="col-xs-8">
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Masuk</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <a href="<?= base_url('logbook'); ?>" class="text-center">Masuk sebagai Pengunjung</a>
    <br>
    <a href="<?= base_url('lupa-password'); ?>">Lupa password</a><br>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

