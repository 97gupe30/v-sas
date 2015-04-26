<!DOCTYPE HTML>
<?php
include_once 'scripts/functions.php';
session_start();
?>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <!-- BOOTSTRAP -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- BOOSTRAP ALERTS -->
        <link href="bootstrap-dialog/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css">
        <script src="bootstrap-dialog/js/bootstrap-dialog.min.js"></script>

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        <script src="scripts/jquery.js"></script>
        <script src="scripts/jquery.slides.js"></script>
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="content-type" content="text/html" charset="ISO-8859-1" />
    </head>
    <body<?php if(isset($_GET['login'])) { if($_GET['login'] == 'failed') { ?> onload="wrongPassword()" <?php } } ?> >
        <header>
            <div id="headwrapper">
                <a href="index.php" id="logoLink" style="display: table;">
                    <div id="logo">
                        <img src="images/logo.jpg" width=200 alt="logo"/>
                    </div>
                </a>
                <?php if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']) { ?>
                <div class="loginBox welcomeBox">
                    <span class="glyphicon glyphicon-user welcomeImg"></span>
                    <h4>Welcome back <?php echo strtoupper($_SESSION['pilotID']); ?></h4>
                    <p>
                        <?php if($_SESSION['lastFlight'] == null) {?>
                        You havn't made any flights yet.
                        <?php } else {?>
                        Your last flight was <?php echo $_SESSION['lastFlight']; ?> days ago.
                    </p>
                    <?php } ?>
                </div>
                <?php } else { ?>
                <div class="loginBox">
                    <form class="form-inline" method="post" action="scripts/login.php">
                        <div class="form-group">
                            <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Callsign" name="callsign">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" id="exampleInputPassword3" placeholder="Password" name="password">
                        </div>
                        <button type="submit" class="btn btn-default">Sign in</button>
                    </form>  
                </div>
                <?php } ?><div class="reset"></div>

            </div>
        </header>

        <nav>
            <div id="menu">
                <ul>
                    <li id="navButton">Navigation<span id="navImg" class="glyphicon glyphicon-menu-down" style="padding-left: 15px;"></span></li><hr>
                    <li><a href="index.php"><i class="fa fa-home home-icon"></i></a></li><hr>
                    <?php if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn'] == true ) { ?> <li><a href="#">Pilot center</a></li><hr> <?php } ?>
                    <li><a href="#">Operations</a></li><hr>
                    <li><a href="#">Organisation</a></li><hr>
                    <li><a href="#">Social</a></li><hr>
                    <?php if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']) {} else { ?> <li><a href="register.php">Join Us</a></li><hr> <?php } ?>
                    <?php if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn']) { ?><li><a href="scripts/logout.php">Logout</a></li><hr> <?php } ?>
                </ul>
            </div>
        </nav>
        <div id="wrapper">
            <div id="innerWrapper">
                
            </div>
        </div>