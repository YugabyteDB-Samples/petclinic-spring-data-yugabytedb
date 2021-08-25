# Spring PetClinic Sample Application built with Spring Data Yugabyte

[![Spring PetClinic Application](/images/petclinic.png)]

This is a branch of [spring-petclinic-data-jdbc](https://github.com/spring-petclinic/spring-petclinic-data-jdbc)
which is itself a branch of the official [Spring PetClinic](https://github.com/spring-projects/spring-petclinic) application with domain & persistence layer built with [Spring Data JDBC](https://projects.spring.io/spring-data-jdbc/)
instead of [Spring Data JPA](https://projects.spring.io/spring-data-jpa/).

Additionally:

- uses [Spring Data Yugabyte](https://github.com/yugabyte/spring-data-yugabytedb) as an alternative to Spring Data JDBC that is Yugabyte YSQL "aware".
- uses [Flyway](https://flywaydb.org/) to manage the database schema and initial data loading.
- user [SpringFox](https://springfox.github.io/springfox/) to deliver Swagger/OpenAPI docs.

https://docs.yugabyte.com/latest/integrations/spring-framework/sdyb/

Check original project [readme](https://github.com/spring-projects/spring-petclinic/blob/master/readme.md) for introduction the project, how to run, and how to contribute.

# Running the app yourself

- Deploy [Yugabyte Cloud Instance.](https://cloudportal.yugabyte.com/)

- Setup the Yugabyte cloud instance to allow the IP list where the app will be hosted.

- Retrieve the Yugabyte Cloud credentials and Configure [application.yaml](/src/resources/application.yaml)

```java

yugabyte:
  datasource:
    url: jdbc:postgresql://8bd2c228-de3c-4808-8a99-xxxxxxxxx.cloudportal.yugabyte.com:5433/petclinic?ssl=true&sslmode=verify-full
    load-balance: true
    username: admin
    password: 

```
- Run the app (go the root of repo):
  ```bash
  ./mvnw spring-boot:run
  ```

  Flyway will configure the Yugabyte database with Petclinic Schema and load sample data.
