## Spring Cloud 配置中心项目

#### 配置中心项目启动配置文件--application.properties
```
#http://config.domain.com:8888
server.port=8888

#git
#spring.cloud.config.server.git.uri: https://github.com/xxx/config-repo

spring.application.name=configServer
spring.cloud.config.enabled=true
management.security.enabled=false
#svn url of http
spring.cloud.config.server.svn.uri=http://svn.domain.com:82/config/
spring.cloud.config.server.svn.username=svn_user
spring.cloud.config.server.svn.password=svn_password
spring.profiles.active=subversion

```

#### svn目录结构--
`http://svn.domain.com:82/config/trunk/ms-admin-api-release.properties`


#### Spring Boot Config 项目代码
```
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RestController;

//@EnableDiscoveryClient
@Configuration
@EnableAutoConfiguration
@SpringBootApplication
@EnableConfigServer
public class HxConfigCenterApplication {

	public static void main(String[] args) {
		SpringApplication.run(ConfigCenterApplication.class, args);
	}
}
```

#### Spring项目启动配置--bootstrap.properties
```
spring.application.name=ms-admin-api
spring.profiles.active=release
spring.cloud.config.uri=http://config.domain.com:8888
spring.cloud.config.profile=release

```

