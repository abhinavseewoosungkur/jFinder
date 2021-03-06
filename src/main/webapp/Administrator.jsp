<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
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

</head>
<body>
<div class="navbar navbar-default navbar-fixed-top move-me ">
    <div class="container">
        <div class="navbar-header" id="text">
            <a class="navbar-brand " href="#">IFinder!</a>
        </div>
        <div class="navbar-collapse collapse move-me">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/">HOME
                    </a>
                </li>

                <li>
                    <a href="/Administrator">INVENTORY LOOKUP
                    </a>
                </li>
                <ul class="nav navbar-nav pull-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" id="fordropnav"><span
                                class="glyphicon glyphicon-user"></span>ACCOUNT<strong
                                class="caret"></strong></a>
                        <ul class="dropdown-menu" id="ddrop">
                            <li>
                                <a href="#"><span
                                        class="glyphicon glyphicon-wrench"></span>Account
                                    Settings</a>
                            </li>
                            <li>
                                <a href="/logout"><span
                                        class="glyphicon glyphicon-off"></span>Sign
                                    out</a>
                            </li>
                        </ul>


                    </li>
                </ul>
            </ul>
        </div>
    </div>
</div>

<div id="about">
    <div class="overlay">
        <div class="container">

            <script src="assets/js/jquery-1.10.2.js"></script>
            <script type="text/javascript">

                var filterResult = function (inputName) {
                    var inputValue = $('[name=' + inputName
                                       + ']').filter('input').val();
                    if (inputValue.length == 0) {
                        $("#info2").empty();
                        //$('#administratorportalid').slideDown();
                    } else {
                        $.getJSON("/rest/item/getBy?" + inputName + "="
                                  + inputValue,
                                  function (Data) {
                                      $("#info2").empty();
                                      $.each(Data, function (key, val) {
                                          if(val.finder == null) {
                                              var finderName = '';
                                          } else {
                                              var finderName = val.finder.name;
                                          }
                                          if(val.owner == null) {
                                              var ownerName = '';
                                          } else {
                                              var ownerName = val.owner.name;
                                          }
                                          $('<tr class="info">' + '<td>' +
                                            '<div id="itemid' + val.iditem + '">' +
                                            val.iditem + '</div></td>' +
                                            '<td>' + finderName + '</td>' +
                                            '<td>' + ownerName + '</td>' +
                                            '<td>' + val.description + '</td>' +
                                            '<td>' + val.location + '</td>' +
                                            '<td>' + dateFormatter(val.datefound) + '</td>' +
                                            '<td><a href="#" class="btn btn-success btn-sm" name="update_button" value="update" onclick="fillModal('
                                            + val.iditem
                                            + ');"><div id="updateButtonText'
                                            + val.iditem
                                            + '">Update</div></a>&nbsp;&nbsp;' +
                                            '<a href="#" class="btn btn-danger btn-sm" name="delete_button" value="delete" onclick="deleteRow('
                                            + val.iditem
                                            + ');">Delete</a>' +
                                            '</td></tr>'
                                          ).appendTo("#info2");
                                          //$('#administratorportalid').slideUp();
                                      });

                                  });
                    }
                }

                var fillModal = function (row) {
                    $('#updateButtonText' + row).text("Loading ...");
                    $.getJSON("/rest/item/getBy?itemfinderbyid=" + row,
                              function (Data) {
                                  console.log(Data.finder.iduser);
                                  $('#iditem').val(row);
                                  $('#idDescription').val(Data.description);
                                  $('#idLocationFound').val(Data.location);
                                  $('#idDateFound').val(dateFormatter(Data.datefound));
                                  $('#idfinderid').val(Data.finderid);

                                  $('#modalWindowItemForm').trigger('click');
                                  $('#updateButtonText' + row).text("Update");
                                  $('#finderselectdefaultvalue').val(Data.finder.iduser);
                                  $('#ownerselectdefaultvalue').val(Data.owner.iduser);
                              });
                }

                 /**
                  * Formats the date in HTML5 date format - yyyy-mm-dd
                  * @param date A date object
                  * @returns {string}
                  * */
                var dateFormatter = function(date) {
                    var year = new Date(date).getFullYear();
                    var month = new Date(date).getMonth();
                    month = month + '';

                    if(month.length == 1) {
                        month = '0' + month;
                    }
                    var day = new Date(date).getDate();
                    day = day + '';
                    if(day.length == 1) {
                        day = '0' + day;
                    }

                    return year + '-' + month + '-' + day;
                }

                var clearModal = function () {
                    $('input').val("");
                }


                var addNewItem = function() {
                    clearModal();
                    $('#idownerselect').remove();
                }

                var deleteRow = function (row) {
                    $.getJSON("/rest/item/delete?id=" + row,
                              function (Data) {
                                  if(Data == 1) {
                                      $('#itemid'+row).parent().parent().empty();
                                  }
                              });
                }
            </script>

            <div class="modal fade" id="mymodal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content modContent">
                        <div class="modal-header">
                            <button class="close cls" data-dismiss="modal"
                                    onclick="modalWindowSlideOut()">&times;</button>
                            <h4 class="modal-title">Add item</h4>

                        </div>
                        <div class="modal-body" id="modaldiv">
                            <form:form class="form-horizontal" modelAttribute="administratorSession" method="post"
                                  id="add_item_form1">
                                <input type="hidden" name="action"
                                       value="add_item_from_admin"
                                       id="idaction">
                                <input type="hidden" name="iditem"
                                       value="itemid" id="iditem">
                                <input type="hidden" name="finderid"
                                       value="finderid" id="idfinderid">

                                <div class="form-group">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="idDescription">Item
                                        Description</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <input type="text"
                                               name="description"
                                               class="form-control"
                                               required="required"
                                               placeholder="Item Description"
                                               id="idDescription" required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="idLocationFound">Location
                                        Found</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <input class="form-control"
                                               id="idLocationFound"
                                               placeholder="Location found"
                                               name="location" required>
                                    </div>
                                </div>

                                <div class="form-group" id="finderselect">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="finderselect">Finder</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <form:select path="finder"
                                                     cssStyle="background: #000000"
                                                     name="finderselect" id="finderselectdefaultvalue">
                                            <form:option value="" label="-- Choose one--"  />
                                            <form:options items="${userList}"
                                                          itemValue="iduser"
                                                          itemLabel="name"/>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group" id="idownerselect">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="ownerselect">Owner</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <form:select path="owner"
                                                     cssStyle="background: #000000"
                                                     name="ownerselect" id="ownerselectdefaultvalue">
                                            <form:option value="" label="-- Choose one--" />
                                            <form:options items="${userList}"
                                                          itemValue="iduser"
                                                          itemLabel="name"/>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="idDateFound">Date</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <input type="date"
                                               name="datefound"
                                               class="form-control"
                                               required="required"
                                               placeholder="Time Stamp"
                                               id="idDateFound" required>

                                    </div>
                                </div>
                                <button class="btn btn-success pull-right"
                                        type="submit" id="mSubmit">Save
                                </button>

                            </form:form>

                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-danger" data-dismiss="modal"
                                    type="button"
                                    onclick="modalWindowSlideOut()">Cancel
                            </button>
                            <!--                <p><small class="text-muted"> Click out of this window or use the cancel button to close this window</small></p>-->


                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" id="add_new_user_modal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content modContent">
                        <div class="modal-header">
                            <button class="close cls" data-dismiss="modal"
                                    onclick="modalWindowSlideOut()">&times;</button>
                            <h4 class="modal-title">Add New User</h4>

                        </div>
                        <div class="modal-body" >
                            <form class="form-horizontal"
                                  action="/user/add" method="post"
                                  >
                                <div class="form-group">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="idhumberid">Humber ID</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <input type="text"
                                               name="humberid"
                                               class="form-control"
                                               required="required"
                                               placeholder="nXXXXXXXX"
                                               id="idhumberid" required pattern="n[0-9]{8}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="idname">Name</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <input type="text"
                                               name="name"
                                               class="form-control"
                                               required="required"
                                               placeholder="Name" id="idname" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 col-md-3 col-sm-3 control-label"
                                           for="idEmailAddress">Email
                                        Address</label>

                                    <div class="col-lg-9 col-md-9 col-sm-9">
                                        <input type="email"
                                               name="email"
                                               class="form-control"
                                               required="required"
                                               placeholder="Email Address"
                                               id="idEmailAddress" required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-danger" data-dismiss="modal"
                                            type="button"
                                            onclick="modalWindowSlideOut()">Cancel
                                    </button>
                                    <button class="btn btn-success pull-right" type="submit" id="save_user">Save
                                    </button>
                                    <!--                <p><small class="text-muted"> Click out of this window or use the cancel button to close this window</small></p>-->


                                </div>
                            </form>

                        </div>


                    </div>
                </div>
            </div>

            <div class="row text-center" id="administratorportalid">
                <h2 id="adminline" data-wow-delay="1.3s"
                    class="row pad-top-botm wow bounceInDown animated"><strong>ADMINISTRATOR'S
                    PORTAL</strong></h2>
            </div>

            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 "></div>
                <form class="formsearch">
                    <div class="col-lg-4 col-md-4 col-sm-4 wow bounceInDown animated animated"
                         style="padding: 20px; visibility: visible; -webkit-animation: bounceInDown 0.5s;"
                         data-wow-delay="0.3s">
                        <div class="div-trans text-center media wow rotateIn animated animated animated adminSrch "
                             data-wow-delay="0.5s"
                             style="visibility: visible; -webkit-animation: rotateIn 0.5s 0.5s;">

                            <input type="text" class="form-control"
                                   placeholder="Search" id="searchInput"
                                   name="searchBox"
                                   onkeyup="filterResult(this.name)">
                            <button type="submit" class="btn btn-default"
                                    name="search_item"><span
                                    class="glyphicon glyphicon-search"></span>
                            </button>
                        </div>
                    </div>
                </form>


                <div class="col-lg-4 col-md-4 col-sm-4 "></div>

            </div>
            <div id="theSearch" class="row pad-top-botm wow flipInX animated"
                 data-wow-delay="1.2s">
                <div class="col-lg-1 col-md-1 col-sm-1"></div>
                <div class="col-lg-10 animated">
                    <div class="page-header">
                        <h3>Inventory</h3>
                    </div>
                    <table class="table table-striped table-hover ">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Finder</th>
                            <th>Owner</th>
                            <th>Description</th>
                            <th>Location</th>
                            <th>Date</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="info2">
                        <!-- filled by JS -->
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-1 col-md-1 col-sm-1"></div>
            </div>
            <div class="row">
                <div class="col-lg-1 col-md-1 col-sm-1 "></div>
                <div class="form-group col-lg-2 col-md-2 col-sm-2 wow bounceInDown animated">
                    <a href="#mymodal" class="btn btn-success btn-block btn-sm"
                       data-toggle="modal" id="modalWindowItemForm">Add new Item</a>
                </div>
                <div class="form-group col-lg-2 col-md-2 col-sm-2 wow bounceInDown animated">
                    <a href="#add_new_user_modal" class="btn btn-success btn-block btn-sm"
                       data-toggle="modal" id="addNewUserModal">Add new
                        User</a>
                </div>
            </div>

        </div>
    </div>
</div>

<div id="footser-end">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">
                &copy; 2014 IFinder

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
</body>
</html>
