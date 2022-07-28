<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" href="https://cdn-icons-png.flaticon.com/512/81/81281.png">
    <meta charset="UTF-8">
    <title>Youtube Downloader MP3</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

</head>

<body>

    <div class="container">
        <?php
        
        if (!empty($_POST["url"]) && filter_var($_POST["url"], FILTER_VALIDATE_URL)!==false) {
            echo shell_exec(realpath(__DIR__.'/../youtubeDownloader.py') . ' ' .$_POST["url"]);
        }

        require_once 'form.html';
        
        $songs = array_filter(scandir(__DIR__.'/../songs'), function ($file) {
            return str_contains($file, '.mp3');
        });
        
        foreach ($songs as $song) {
            echo str_replace('{{ $song }}', $song, file_get_contents('song.html'));
        }
        ?>
    </div>
</body>

</html>