<html lang="en"><head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <title>IFinder</title>
  <!--  Bootstrap Style -->
  <link href="assets/css/bootstrap.css" rel="stylesheet">

  <!--  Font-Awesome Style -->
  <link href="assets/css/font-awesome.min.css" rel="stylesheet">
  <!--  Animation Style -->
  <link href="assets/css/animate.css" rel="stylesheet">
  <!--  Pretty Photo Style -->
  <link href="assets/css/prettyPhoto.css" rel="stylesheet">
  <!--  Google Font Style -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">
  <!--  Custom Style -->
  <link href="assets/css/style.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
  <![endif]-->
  <!--  IFinder Style Sheet -->
  <link href="assets/css/IFinder.css" rel="stylesheet">

  <style type="text/css"></style></head>
<body onload="modalWindowSlideIn()">
<div class="navbar navbar-default navbar-fixed-top move-me ">
  <div class="container">
    <div class="navbar-header" id="text">
      <a class="navbar-brand " href="#">IFinder!</a>
    </div>
    <div class="navbar-collapse collapse move-me">
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a href="#">HOME
          </a>
        </li>
        <li>
          <a href="#">LOG ITEM
          </a>
        </li>
        <li>
          <a href="#">INVENTORY LOOKUP
          </a>
        </li>
        <ul class="nav navbar-nav pull-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="fordropnav"><span class="glyphicon glyphicon-user"></span>ACCOUNT<strong class="caret"></strong></a>
            <ul class="dropdown-menu" id="ddrop">
              <li>
                <a href="#"><span class="glyphicon glyphicon-wrench"></span>Account Settings</a>
              </li>
              <li>
                <a href="/logout"><span class="glyphicon glyphicon-off"></span>Sign out</a>
              </li>
            </ul>


          </li>
        </ul>
      </ul>
    </div>
  </div>
</div>
<!--./ NAV BAR END -->    <div id="home">
  <div class="overlay">
    <div class="container newLayer">
      <div class="row ">
        <div class="col-lg-9 col-md-9 head-text">
          <h1 id="divDisp">Mishandled an item?</h1>
                        <span>
                            <i class="fa fa-lightbulb-o "></i>You can find your item
                        </span>
                        <span>
                            <i class="fa fa-lightbulb-o"></i>Log item found
                        </span>

                        <span>
                            <i class="fa fa-lightbulb-o"></i>Check the status of your item
                        </span>
                        <span>
                            <i class="fa fa-lightbulb-o"></i>Need Administrator's help?
                        </span>

        </div>
        <form action="/login" method="post">
          <div class="col-lg-3 col-md-3">
            <div class="div-trans text-center second">
              <span></span>
              <h3>USER LOGIN</h3>
              <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="form-group">
                  <input type="text" name="username" class="form-control" required="required" placeholder="User ID">
                </div>
                <div class="form-group">
                  <input type="password" name="password" class="form-control" required="required" placeholder="Password">
                </div>
                <div class="form-group">

                  <input name="submit" type="submit" class="btn btn-success btn-block btn-lg" value="submit">
                </div>
              </div>

            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!--./ HOME SECTION END -->

<div id="footser-end">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12">
        © 2014 IFinder

      </div>
    </div>

  </div>
</div>
<!--  Jquery Core Script -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!--  Core Bootstrap Script -->
<script src="assets/js/bootstrap.js"></script>
<!--  WOW Script -->
<script src="assets/js/wow.min.js"></script>
<!--  Scrolling Script -->
<script src="assets/js/jquery.easing.min.js"></script>
<!--  PrettyPhoto Script -->
<script src="assets/js/jquery.prettyPhoto.js"></script>
<!--  Custom Scripts -->
<script src="assets/js/custom.js"></script>


</body></html>