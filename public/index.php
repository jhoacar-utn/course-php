<?php

try {
    $numerador = 5;
    $denominador = 0;
    if ($numerador/$denominador === INF) {
        throw new Error('<br>Estas diviendo por cero y no se puede<br>');
    }
    echo $numerador/$denominador;
} catch (\Throwable $error) {
    echo $error->getMessage();
} finally {
    echo "<br>Se ha realizado la division<br>";
}
phpinfo();
