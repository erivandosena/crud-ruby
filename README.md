<p align="center">
  <a href="" rel="noopener">
 <img width="" height="" src="https://i.imgur.com/vf30FJP.png" alt="Ruby logo"></a>
</p>

<h3 align="center">Project Ruby</h3>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)]() [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> Few lines describing your project.
    <br> 
</p>

## 📝 Table of Contents

- [](#)
        - [Docker:](#docker)
        - [Compose V2 (para Compose V1 use: docker-compose ...):](#compose-v2-para-compose-v1-use-docker-compose-)
    - [Break down into end to end tests](#break-down-into-end-to-end-tests)
    - [And coding style tests](#and-coding-style-tests)
  - [🎈 Usage ](#-usage-)
  - [🚀 Deployment ](#-deployment-)
  - [⛏️ Built Using ](#️-built-using-)
  - [✍️ Authors ](#️-authors-)
  - [🎉 Acknowledgements ](#-acknowledgements-)

## 🧐 About <a name = "about"></a>

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See [deployment](#deployment) for notes on how to deploy the project on a live system.

### Prerequisites

Linux Debian
Ruby
Bootstrap
Nginx Server

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running.

```bash
echo "# crud-ruby" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/erivandosena/crud-ruby.git
git push -u origin main
```

Send to repository

```bash
git remote add origin https://github.com/erivandosena/crud-ruby.git
git branch -M main
git push -u origin main
```

Clean Docker Workspace local 

```bash
docker stop $(docker ps -qa)
docker rm -f $(docker ps -qa)
docker rmi -f $(docker images -qa)
docker volume rm -f $(docker volume ls -q)
docker network rm $(docker network ls -q)
```

End with an example of getting some data out of the system or using it for a little demo.

## 🔧 Running the tests <a name = "tests"></a>

##### Docker:
```bash
docker build -f ./Dockerfile -t erivando/crud-tarefas-ruby:latest --build-arg VERSION=1.0.0 --build-arg COMMIT_SHA=$(git rev-parse HEAD) --no-cache .
docker tag erivando/crud-tarefas-ruby:latest erivando/crud-tarefas-ruby:v1.0.0
docker login
docker push erivando/crud-tarefas-ruby:v1.0.0
```

##### Compose V2 (para Compose V1 use: docker-compose ...):
```bash
docker compose build --no-cache && docker compose up -d
docker compose logs -f
docker exec -it crud-tarefas /bin/bash
docker compose down
```

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## 🎈 Usage <a name="usage"></a>

```bash
docker run -it --rm -d -p 8030:3000 --name crud-tarefas -v /mnt:/app/db erivando/crud-tarefas-ruby:latest
```

## 🚀 Deployment <a name = "deployment"></a>

Image Docker: https://hub.docker.com/r/erivando/crud-tarefas-ruby

## ⛏️ Built Using <a name = "built_using"></a>

- [SQLite](https://www.sqlite.org/index.html) - Database
- [Express](https://expressjs.com/) - Server Framework
- [VueJs](https://vuejs.org/) - Web Framework
- [NodeJs](https://nodejs.org/en/) - Server Environment

## ✍️ Authors <a name = "authors"></a>

- [@erivandosena](https://github.com/erivandosena) - Idea & Initial work

## 🎉 Acknowledgements <a name = "acknowledgement"></a>

- Hat tip to anyone whose code was used
- Inspiration
- References