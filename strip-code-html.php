<?php 

// Removes code sections from markdown files

$text = file_get_contents('php://stdin');
$codeRegexp = "!<code\b[^>]*>.*?</code>!ms";
$scriptRegexp = "!<script\b[^>]*>.*?</script>!ms";
$styleRegexp = "!<style\b[^>]*>.*?</style>!ms";
// preg_match_all($codeRegexp, $text, $m, PREG_PATTERN_ORDER);

$text = preg_replace($scriptRegexp, "<!-- script stripped -->", $text);
$text = preg_replace($styleRegexp, "<!-- style stripped -->", $text);
$text = preg_replace($codeRegexp, "<!-- code stripped -->", $text);
echo $text;

