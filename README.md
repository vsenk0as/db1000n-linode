# Linode automation

Скрипт для створення і налаштування інстансів бомбардувальників на Linode в один клік.

### Як використовувати

Для початку треба встановити і налаштувати `linode-cli`:
https://www.linode.com/docs/guides/linode-cli/

Виконати налаштування з розділу - Initial Configuration of the Linode CLI (https://www.linode.com/docs/guides/linode-cli/)

Стровири файл з імʼям `env` та записати в нього стійкий пароль.


Після цього запустити команду ініціалізації:

```shell
./init.sh 10 
```

де `10` це число linodes які будуть створені. Ліміт в аккаунті за замовчуванням - 10 linodes.

Скрипт запускає інстанс, на якому запускається докер контейнер з образом `db1000n` (https://github.com/Arriven/db1000n).

Щоб видалити створені інстанси:

```shell
./clear.sh
```

### Як це працює

Скрипт ініціалізації створює інстансу у випадковому активному регіоні і налаштовує на ній все для запуску https://github.com/Arriven/db1000n. Інстанс запускається з паролем, який ми передаємо через env файл, також використовується найдешевший тип інстансів за 5 баксів на місяць.

### Доповнюємо разом

Пишіть issues, створюйте pull requests.

***************************************************************************************

Script for creating and setting up linode instances with bombardier.

### How to use

At first install and setup `linode-cli` on your machine:
https://www.linode.com/docs/guides/linode-cli/

Make settings from the section - https://www.linode.com/docs/guides/linode-cli/ (https://www.linode.com/docs/guides/linode-cli/)

Create a file named `env` and write a strong password to it.

After that run initialization script:

```shell
./init.sh 10
```

where `10` is a number of linodes to be created.

The script launches an instance that runs the docker image from image https://github.com/Arriven/db1000n.

To remove created instances run:

```shell
./clear.sh
```

### How it works

Script creates linodes in random active region and setup everything for run `db1000n`.

Instance is running with existing password from env file, also cheapest linode is used (5 usd month)

### Contributing

Create issues, create pull requests.
