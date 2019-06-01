<GABOR,GALAZZO,20024195>

Esercizio 3.1: Six degrees of separation(PHP, SESSIONI e DBMS MySQL)

Note: Anziché usare il metodo PDO::query io creo dei prepared statment.

Gli hash delle password sono ottenuti tramite la funzione:
    $hash =  password_hash($password, PASSWORD_BCRYPT, ['cost' => 12]);
e verificati con la funzione
    password_verify($password, $hash)

Il file update-schema.sql contiene le queri per creare e popolare la tabella 'user'

Gli utenti di test sono (username:password):
admin:admin
user:user