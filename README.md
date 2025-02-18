<!-- PROJECT NAME -->
<h2 align="center">Fastapi Deploy Test App</h2>

<!-- DESCRIPTION -->
<h4 align="center">
Several ways to upload an application to VDS
</h4>


## Deploy with FTP

1. Создайте нового пользователя
sudo adduser newuser
2. Добавление пользователя в группы (необязательно)
sudo usermod -aG sudo newuser
3. Смена пользователя:
su - newuser
4. Настройте FTP по инструкции:
https://timeweb.cloud/docs/unix-guides/ftp-setup-in-ubuntu-20-04
5. Подключитесь к серверу с помощью FileZilla и скопируйте папку с приложением

6. Create a virtual environment (optional but recommended):
    ```bash
    python -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`
    ```
   
7. Install the dependencies:
    ```bash
    pip install -r requirements.txt
    ```
   
8. Run app
    ```bash
    uvicorn src.main:app --reload --host 0.0.0.0 --port 8080
    ```


9. Allow traffic on a specific port
    ```Bash
    
    sudo ufw allow 80
    ```

### 10. Reload the firewall

    ```Bash
    
    sudo ufw reload
    ```
This command will reload the firewall with the new rules.

Теперь ваше FastAPI-приложение будет доступно по адресу http://0.0.0.0:8080.

___

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Deploy with Docker


1. Соберите Docker-образ

    ```Bash
    docker build -t myfastapiapp .
    ```

Авторизация на Docker Hub
    ```bash
    docker login
    ```
2. Тегирование образа.
Для того чтобы загрузить образ на Docker Hub, его нужно тегировать с использованием вашего имени пользователя на Docker Hub. Например, если ваше имя пользователя на Docker Hub — ridhub, а ваш образ называется myfastapiapp, выполните следующую команду:
    ```bash
    docker tag myfastapiapp ridhub/myfastapiapp
    ```

3. Загрузка образа на Docker Hub

Теперь, когда образ тегирован, вы можете загрузить его на Docker Hub:

    ```Bash
    
    docker push ridhub/myfastapiapp
    ```

4. Авторизация на Docker Hub на удаленной машине

На удаленной машине вам также нужно авторизоваться на Docker Hub, чтобы иметь возможность загружать образы. Откройте терминал на удаленной машине и выполните:
    ```bash
    docker login
    ```

Введите ваш логин и пароль от Docker Hub.

5. Загрузка образа на удаленную машину

Теперь, когда вы авторизованы, загрузите ваш Docker-образ на удаленную машину:
```bash
docker pull ridhub/myfastapiapp
```

Эта команда загрузит ваш образ с Docker Hub на удаленную машину.

6. Запуск контейнера

После загрузки образа вы можете запустить контейнер с этого образа. Например, если вы хотите запустить контейнер на порту 6000, выполните следующую команду:

```bash
docker run -d -p 8080:8000 ridhub/myfastapiapp
```

Теперь ваше FastAPI-приложение будет доступно по адресу http://0.0.0.0:8080.
___

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Useful links:

Настройка FTP в Ubuntu 20.04:
https://timeweb.cloud/docs/unix-guides/ftp-setup-in-ubuntu-20-04