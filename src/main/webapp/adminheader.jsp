<%-- 
    Document   : adminheader
    Created on : 15 Sept 2023, 21:42:32
    Author     : urvish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>hightech</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- awesome fontfamily -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <!-- body -->
    <body class="main-layout">
        <!-- loader  -->
        <div class="loader_bg">
            <div class="loader"><img src="images/loading.gif" alt="" /></div>
        </div>
        <!-- end loader -->
        <!-- header -->
        <header>
            <div class="header">
                <div class="container-fluid">
                    <div class="row d_flex">
                        <div class=" col-md-2 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="index.html"><img src="images/logo.png" alt="#" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-9">
                            <nav class="navigation navbar navbar-expand-md navbar-dark ">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarsExample04">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item active">
                                            <a class="nav-link" href="index.jsp">vendors</a>
                                        </li>
                                        

                                        <li class="dropdown nav-item">

                                            <a class="dropdown-toggle nav-link" data-toggle="dropdown" data-hover="dropdown" data-animations="fadeIn fadeInLeft fadeInUp fadeInRight">Tenders
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="adminviewtender.jsp">View all Tenders</a></li>
                                                <li><a href="createtender.jsp">Create New Tender</a></li>
                                                <li><a href="viewtenderbids.jsp">View Tender Bids</a></li>
                                                <li><a href="viewtenderbids.jsp">Accept a bid</a></li>
                                                <li><a href="viewassignedtenders.jsp">View Assigned Tenders</a></li>
                                            </ul>
                                        </li>




                                        <li class="dropdown">

                                            <a class="dropdown-toggle nav-link" data-toggle="dropdown" data-hover="dropdown" data-animations="fadeIn fadeInLeft fadeInUp fadeInRight">Notice
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><a href="addnotice.jsp">Add Notice</a></li>
                                                <li><a href="removenotice.jsp">Remove Notice</a></li>
                                                <li><a href="updatenotice.jsp">Update Notice</a></li>
                                                <li><a href="viewNotice.jsp">View All Notice</a></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="Logoutsrv">Logout</a>
                                        </li>

                                    </ul>
                                </div>
                            </nav>
                        </div>
                        <div class="col-md-2 d_none">
                            <ul class="email text_align_right">

                                <li><a href="Logoutsrv"><img src="images/logout.png"></a></li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </header>


        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <script src="js/custom.js"></script>


    </body>
</HTML>