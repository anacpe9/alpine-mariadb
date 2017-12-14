# MariaDb Server

mariadb server  - alpine base, for development process.
used in Gitlab CI/CD. (not found official image on hub.docker.com)

- [mariadb - pkgs.alpinelinux.org](https://pkgs.alpinelinux.org/packages?name=mariadb&branch=&repo=&arch=x86_64&maintainer=)
- [mariadb - docker](https://github.com/docker-library/mariadb)
- used entrypoint script from [yobasystems/alpine-mariadb](https://github.com/yobasystems/alpine-mariadb)

## docker-image dependencies graph

| image              | base os    |
| ------------------ | ---------- |
| mariadb:10.1.26-r0 | alpine:3.6 |

## Volume structure

- `/var/lib/mysql`: Database files
- `/var/lib/mysql/mysql-bin`: MariaDB logs

## Environment Variables

### Main MariaDb parameters

- `MYSQL_DATABASE`: specify the name of the database
- `MYSQL_USER`: specify the User for the database
- `MYSQL_PASSWORD`: specify the User password for the database
- `MYSQL_ROOT_PASSWORD`: specify the root password for Mariadb

### Creating an instance example

```shell
docker run --detach \
       --name db-mariadb \
       --restart always \
       -p 3306:3306 \
       -v /var/lib/mysql:/var/lib/mysql \
       -e MYSQL_DATABASE=wordpressdb \
       -e MYSQL_USER=wordpressuser \
       -e MYSQL_PASSWORD=mysqlStrongP@ssw0rd \
       -e MYSQL_ROOT_PASSWORD=mysqlRootStrongP@ssw0rd \
       registry.gitlab.com/cha-alpine/mariadb:latest
```

## Source Repository

- [**cha-alpine/mariadb | Gitlab**](https://gitlab.com/cha-alpine/mariadb) - main workspace.
- [anacpe9/alpine-mariadb | Github](https://github.com/anacpe9/alpine-mariadb) - mirror.
- [anacpe9/alpine-mariadb | Bitbucket](https://bitbucket.org/anacpe9/alpine-mariadb) - mirror.

## License

[MIT](LICENSE)