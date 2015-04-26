<?php
/**
 * Created by PhpStorm.
 * User: Gustav
 * Date: 2015-04-25
 * Time: 02:46
 */

session_start();
session_destroy();

header('location: http://' . $websiteUrl . '/v-sas/');