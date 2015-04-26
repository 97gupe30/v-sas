<?php
    session_start();
    if(isset($_SESSION['loggedIn']) && $_SESSION['loggedIn'] == true) { // If we are already logged in.
        header('Location: ' . 'http://' . $websiteUrl);
        return;
    } else {
        include_once 'functions.php';

        $server = "127.0.0.1";
        $dbName = "v_sas";
        $user = "root";
        $pass = "mysql";

        date_default_timezone_set('Europe/Stockholm'); // Set timezone.
        $date = date('Y-m-d', time()); // Todays date.

        $callsignInput = $_POST['callsign']; // Get the input with the name callsign.
        $passwordInput = $_POST['password']; // Get the input with the name password.
        if ($callsignInput != "" && $callsignInput != null && $passwordInput != "" && $callsignInput != null) { // Check if the user entered anything in the boxes.
            try {
                $dbh = new PDO('mysql:host=localhost;dbname=v_sas', $user, $pass); // Create database connection.
            } catch (PDOException $Exception) {
                header('Location: http://' . $websiteUrl . '/v-sas/index.php?login=failed');
            }

            $stmt = $dbh->prepare('SELECT password, salt FROM tbl_users WHERE pilotID = :id'); // Get the password and the SALT from the database.
            $stmt->bindParam(':id', $callsignInput);
            $stmt->execute();
            $result = $stmt->fetch(); // Put the queries  result in the array $result.

            if ($result[0] == $passwordInput) { // If the user entered the right password.
                $stmt = $dbh->prepare('SELECT lastflight FROM tbl_users WHERE pilotID = :id'); // Get the date of the last flight the user made.
                $stmt->bindParam(':id', $callsignInput);
                $stmt->execute();
                $result = $stmt->fetch();
                if ($result == null) // If the user havn't done any flights.
                    $timeSinceLastFlight = null;
                else {
                    $today = new DateTime($date);
                    $lastFlight = new DateTime($result[0]);
                    $dateDiff = $today->diff($lastFlight); // Get the time since the flight was made.
                    $timeSinceLastFlight = $dateDiff->days; // Get the time since the flight was made in days.
                }

                $_SESSION['lastFlight'] = $timeSinceLastFlight; // Set lastFlight to the time in days since the last flight was made.
                $_SESSION['loggedIn'] = true; // Set loggedIn = true;
                $_SESSION['pilotID'] = $callsignInput; // set the pilotID to the pilotID
                header('Location: http://' . $websiteUrl); //Go back to the website.
                $stmt = null; // Close query.
                $dbh = null; // Close database connection.
                return;
            }
        }


        header('Location: ' . 'http://' . $websiteUrl . '/index.php?login=failed'); // If the entered password or username was wrong.
        $stmt = null; // Close query.
        $dbh = null; // Close database connection.
    }