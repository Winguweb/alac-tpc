# README

This README would normally document whatever steps are necessary to get the
application up and running.


The application is running in docker.
You need to lift both containers because they communicate with each other.

To run the containers you just have to use the following command:


```
docker-compose up - d
```

To create the rails DB:

```
docker-compose exec app rake db:create
```
To run Rails migrations:

```
docker-compose exec app rake db:migrate
```

```
docker-compose exec app rake db:seed
```

go to 

for GL 
http://localhost


for rails dashboard 
http://localhost:5000