package org.springframework.samples.petclinic.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

import java.util.Collections;
import java.util.function.Predicate;

import static springfox.documentation.builders.PathSelectors.regex;

@Configuration
@EnableOpenApi
@ComponentScan(basePackages = "org.springframework.samples.petclinic")
public class SwaggerConfiguration {

    @Bean
    public Docket customDocket() {
        return new Docket(DocumentationType.OAS_30)
            .apiInfo(getApiInfo())
            .select()
            .apis(RequestHandlerSelectors.any())
            .paths(paths())
            .build();
    }

    private Predicate<String> paths() {
        return regex("/owners.*").or(regex("/vets.*"));
    }

    private ApiInfo getApiInfo() {
        return new ApiInfo(
            "Petclinic API Documentation",
            "This is API documentation of the Spring Petclinic. If authentication is enabled, when calling the APIs use admin/admin",
            "1.0",
            "Petclinic backend terms of service", new Contact("", "", ""),
            "Apache 2.0",
            "http://www.apache.org/licenses/LICENSE-2.0", Collections.emptyList());
    }
}
