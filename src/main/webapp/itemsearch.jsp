<%--
  Created by IntelliJ IDEA.
  User: Abhinav
  Date: 11/23/2014
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>IFinder</title>
    <!--  Bootstrap Style -->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>

    <!--  Font-Awesome Style -->
    <link href="assets/css/font-awesome.min.css" rel="stylesheet"/>
    <!--  Animation Style -->
    <link href="assets/css/animate.css" rel="stylesheet"/>
    <!--  Pretty Photo Style -->
    <link href="assets/css/prettyPhoto.css" rel="stylesheet"/>
    <!--  Google Font Style -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans'
          rel='stylesheet' type='text/css'/>
    <!--  Custom Style -->
    <link href="assets/css/style.css" rel="stylesheet"/>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <!--  IFinder Style Sheet -->
    <link href="assets/css/IFinder.css" rel="stylesheet"/>

    <script src="assets/js/jquery-1.10.2.js"></script>
    <script type="text/javascript">
        var filterResult = function (inputName) {
            var inputValue = $('[name='+inputName+']').filter('input').val();
            if(inputValue.length == 0) {
                $("#info2").empty();
            } else {
                $.getJSON("/rest/item/getBy?" + inputName + "=" + inputValue,
                          function (Data) {
                              console.log('test');
                              $("#info2").empty();
                              $.each(Data, function (key, val) {
                                  $('<tr class="info">' + '<td>' +
                                                                 val.iditem + '</td>' +
                                                                 '<td>' + val.description + '</td>' +
                                                                 '<td>' + val.datefound + '</td>' + '</tr>'
                                  ).appendTo("#info2");
                              });

                          });
            }
        }
    </script>

    <title></title>
</head>
<body>

<div class="navbar navbar-default navbar-fixed-top move-me ">
    <div class="container">
        <div class="navbar-header" id="text">
            <a class="navbar-brand " href="">IFinder!</a>
        </div>
        <div class="navbar-collapse collapse move-me">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">HOME
                    </a>
                </li>
                <li>
                    <a href="#">About
                    </a>
                </li>
                <li>
                    <a href="#">FAQs
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

<div id="about">
    <div class="overlay">
        <div class="container">

            <div class="row ">
                <div class="col-lg-4 col-md-4">
                    <div class="media wow rotateIn animated"
                         data-wow-delay="0.1s">
                        <div class="pull-left">
                            <i class="fa fa-lightbulb-o fa-3x  "></i>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Search Tips</h3>

                            <p>
                                The more concise you are about the description
                                of the Item, the more easy to find the
                                item.
                            </p>

                        </div>
                    </div>
                    <div class="media wow rotateIn animated"
                         data-wow-delay="0.2s">
                        <div class="pull-left">
                            <i class="fa fa-cab fa-3x "></i>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Item could be
                                dispatched</h3>

                            <p>
                                You could specify your address and have you item
                                dispatched over at you house. It has
                                been made easy.
                            </p>

                        </div>
                    </div>

                </div>
                <form action="" method="post" id="search_item_form">
                    <input type="hidden" name="action" value="search_item"/>

                    <div class="col-lg-4 col-md-4 wow bounceInDown animated"
                         style="padding: 10px;"
                         data-wow-delay="0.3s">
                        <div class="div-trans text-center itemlog2 media wow rotateIn animated animated"
                             data-wow-delay="0.5s"
                             style="visibility: visible; -webkit-animation: rotateIn 0.5s;">
                            <h3 id="parag">SEARCH ITEM</h3>

                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <div class="form-group">
                                    <input type="text" name="description"
                                           class="form-control"
                                           required="required"
                                           placeholder="Item Description"
                                           onkeyup="filterResult(this.name)">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="location"
                                           class="form-control"
                                           required="required"
                                           placeholder="Location"
                                           onkeyup="filterResult(this.name)">
                                </div>
                                <div class="form-group">
                                    <input type="text" name="date"
                                           class="form-control"
                                           required="required"
                                           placeholder="Time Stamp"
                                           onkeyup="filterResult(this.name)">
                                </div>
                                <div class="form-group">
                                    <button type="submit"
                                            class="btn btn-success btn-block btn-lg">
                                        Search
                                    </button>
                                </div>
                                <div class="form-group" id="newSpec">
                                    <button type="submit"
                                            class="btn btn-block btn-lg btn-danger">
                                        Cancel
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </form>

                <div class="col-lg-4 col-md-4">

                    <div class="media wow rotateIn animated"
                         data-wow-delay="0.5s">
                        <div class="pull-left">
                            <i class="fa fa-laptop fa-3x  "></i>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Item delivery status</h3>

                            <p>
                                You get a delivery message by email as soon as
                                your item is shipped over to the address
                                specified or picked up.
                            </p>

                        </div>
                    </div>
                    <div class="media wow rotateIn animated"
                         data-wow-delay="0.5s">
                        <div class="pull-left">
                            <i class="fa fa-life-ring fa-4x  "></i>
                        </div>
                        <div class="media-body">
                            <h3 class="media-heading">Resource Utilization</h3>

                            <p>
                                This is a User friendly application, nothing
                                complication...Make the must use of this
                                application when needed.
                            </p>

                        </div>
                    </div>
                </div>
            </div>

            <div id="theSearch" class="row pad-top-botm wow flipInX animated" data-wow-delay="1.2s">
                <div class="col-lg-8 col-md-8 col-sm-8 ">
                    <div class="page-header">
                        <h3>Search Result</h3>
                    </div>
                    <table class="table table-striped table-hover ">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Description</th>
                            <th>Date Logged</th>
                        </tr>
                        </thead>
                        <tbody id="info2">
                        </tbody>
                    </table>
                    <ul id="items"/>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 text-center">
                    <i class="fa fa-lightbulb-o big-icon "></i>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
