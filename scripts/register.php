<?php
/**
 * Created by PhpStorm.
 * User: Gustav
 * Date: 2015-04-25
 * Time: 12:35
 */

$inputPassword = "disismypass";

function generateSalt() {
    $salt = uniqid(mt_rand(), true);
    return $salt;
}
$salt = generateSalt();
$hashedPassword = crypt($inputPassword, $salt);