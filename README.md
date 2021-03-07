# Simple Flask App

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- W projekcie wykorzystamy virtual environment, dla utworzenia hermetycznego środowisko dla aplikacji:

  ```
  # tworzymy hermetyczne środowisko dla bibliotek aplikacji:
  $ python3 -m venv .venv

  # aktywowanie hermetycznego środowiska
  $ source .venv/bin/activate
  $ make deps
  # make deps wykonuje 2 ponizsze polecenia:
  $ pip install -r requirements.txt
  $ pip install -r test_requirements.txt

  # zobacz
  $ pip list
  ```

  Sprawdź: [tutorial venv](https://docs.python.org/3/tutorial/venv.html) oraz [biblioteki flask](http://flask.pocoo.org).

- Uruchamianie applikacji:

  ```
  # jako zwykły program
  $ python main.py

  # albo:
  $ PYTHONPATH=. FLASK_APP=hello_world flask run

  # albo
  $ make run

  #sprawdzenie czy dziala poprawnie
  $ curl 127.0.0.1:5000

  ```


- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ```
  $ PYTHONPATH=. py.test
  $ PYTHONPATH=. py.test --verbose -s
  # albo uzywamy polecenia:
  $ make test
  ```

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ```
  # deaktywacja
  $ deactivate
  ```

  ```
  ...

  # aktywacja
  $ source .venv/bin/activate
  ```

- Integracja z TravisCI:

  ```
  # plik .travis.yml
  language: python

  services:
    - docker

  python:
    - "3.8"
  install:
    - make deps
  script:
    - make test
    - make lint
  after_success:
    - make docker_build

  ```

# Pomocnicze

## Ubuntu

- Instalacja dockera: [dockerce howto](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Centos

- Instalacja docker-a:
  ```
  Docker zazwyczaj nie restartujemy, kasujemy i uruchamiamy na nowo:
  $ docker stop hello-world-printer-dev
  $ docker rm hello-world-printer-dev
  $ make docker_run
  ```

```
  #Uruchom hello-world-printer jako docker, w terminalu:
  $ make docker_run
  # zweryfikuj, że docker jest uruchomiony
  $ docker ps
  # sprawdź, czy aplikacje działa poprawnie
  $ curl 127.0.0.1:5000
  # wyświetlmy logi, zauważ, że widzisz informację o połączeniu z curla
  $ docker logs hello-world-printer-dev
  # jeśli nie widzisz dockera, kiedy uruchamiasz z docker ps dodaj -a
  $ docker ps -a
  $ docker logs hello-world-printer-dev
```


  ```
  $ yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

  $ yum install -y yum-utils

  $ yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

  $ yum makecache fast
  $ yum install -y docker-ce
  $ systemctl start docker
  ```
