# tgchecklink

Чекер telegram ссылок.

Telegram канал: https://t.me/shadowbiznes



Установка perl и git:

  termux:

    apt update && apt upgrade -y
    apt install git perl -y

  windows:

    perl 64bit:

    https://strawberryperl.com/download/5.32.0.1/strawberry-perl-5.32.0.1-64bit.msi
           
    perl 32bit: 

    https://strawberryperl.com/download/5.32.0.1/strawberry-perl-5.32.0.1-32bit.msi
   
    git:

    https://git-scm.com/download/win

Загрузка:

    git clone https://github.com/wxkxxxxxx/tgchecklink/
 
    cd tgchecklink/

Запуск:

    perl wxk.pl [файл с ссылками или список ссылок]
    
    Пример: perl wxk.pl myLinks.txt

    perl wxk.pl без аргументов выведет небольшую помощь
