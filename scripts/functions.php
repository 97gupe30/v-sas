<?php
/**
 * Created by PhpStorm.
 * User: Gustav
 * Date: 2015-04-26
 * Time: 12:15
 */

$websiteUrl = "192.168.1.54/v-sas";

function limit_words($string, $word_limit)
{
    $words = explode(" ",$string);
    return implode(" ",array_splice($words,0,$word_limit));
}