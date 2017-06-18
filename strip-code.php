<?php 

// Removes code sections from markdown files

$text = file_get_contents('php://stdin');
$codeRegexp = "/^```\w*[ \t\r]*?$.*?\n```[ \t\r]*$/ms";
// preg_match_all($codeRegexp, $text, $m, PREG_PATTERN_ORDER);

$inlineRegexp = "/(?<!`)`[^`]+`(?!`)/";

$text = preg_replace($codeRegexp, "```\n```\n", $text);
$text = preg_replace($inlineRegexp, "`...`", $text);
echo $text;

