# MySQL Image for ARM v7 (debian based)

MySQL (mariadb) debian image-based.
Greatly inspired by https://github.com/yobasystems/alpine-mariadb.

## Environnement Variable

MYSQL_ROOT_PASSWORD (required) : This variable is mandatory and specifies the password that will be set for the MySQL root superuser account. In the above example, it was set to my-secret-pw.

MYSQL_DATABASE: This variable is optional and allows you to specify the name of a database to be created on image startup. If a user/password was supplied (see below) then that user will be granted superuser access (corresponding to GRANT ALL) to this database.

MYSQL_USER, MYSQL_PASSWORD : These variables are optional, used in conjunction to create a new user and to set that user's password. This user will be granted superuser permissions (see above) for the database specified by the MYSQL_DATABASE variable. Both variables are required for a user to be created.

Do note that there is no need to use this mechanism to create the root superuser, that user gets created by default with the password specified by the MYSQL_ROOT_PASSWORD variable.

Docker CLI example : 
```
	docker run -d -p 3306:3306 -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=toor -e MYSQL_DATABASE=champyresi -e MYSQL_USER=user -e MYSQL_PASSWORD=resu --name dbprod debian-mariadb:1.0
```