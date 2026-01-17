<?php

if ($_SERVER["HTTP_HOST"] == "127.0.0.1" && $_SERVER["REQUEST_METHOD"] == "POST" && $_SERVER["REQUEST_URI"] == "/flag.php?flag=true") {
    if ($_SERVER["HTTP_USER_AGENT"] == "Custom Browser (Internal)") {
        echo getenv("FLAG");
        exit;
    }
}
