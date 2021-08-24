# Spring PetClinic Sample Application built with Spring Data Yugabyte

This is a branch of [spring-petclinic-data-jdbc](https://github.com/spring-petclinic/spring-petclinic-data-jdbc)
which is itself a branch of the official [Spring PetClinic](https://github.com/spring-projects/spring-petclinic) application with domain & persistence layer built with [Spring Data JDBC](https://projects.spring.io/spring-data-jdbc/)
instead of [Spring Data JPA](https://projects.spring.io/spring-data-jpa/).

Additionally:

- uses [Spring Data Yugabyte](https://github.com/yugabyte/spring-data-yugabytedb) as an alternative to Spring Data JDBC that is Yugabyte "aware".
- uses [Flyway](https://flywaydb.org/) to manage the database schema and initial data loading.
- uses [TestContainers](http://testcontainers.org/) to spin up MySQL during integration tests.
- user [SpringFox](https://springfox.github.io/springfox/) to deliver Swagger/OpenAPI docs.

https://docs.yugabyte.com/latest/integrations/spring-framework/sdyb/

Check original project [readme](https://github.com/spring-projects/spring-petclinic/blob/master/readme.md) for introduction the project, how to run, and how to contribute.

## Understanding the Spring Petclinic application with a few diagrams

[See the presentation here](http://fr.slideshare.net/AntoineRey/spring-framework-petclinic-sample-application)

## Interesting Spring Petclinic forks

The Spring Petclinic master branch in the main [spring-projects](https://github.com/spring-projects/spring-petclinic)
GitHub org is the "canonical" implementation, currently based on Spring Boot and Thymeleaf.

This project is one of the [several forks](https://spring-petclinic.github.io/docs/forks.html) hosted in a special
GitHub org: [spring-petclinic](https://github.com/spring-petclinic). If you have a special interest in a different
technology stack that could be used to implement the Pet Clinic then please join the community there.
