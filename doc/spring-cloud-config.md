## Spring Cloud 配置中心项目

#### 配置文件
```
server.port=8888

#spring.cloud.config.server.git.uri: https://github.com/xxx/config-repo

spring.application.name=configServer
spring.cloud.config.enabled=true
management.security.enabled=false
#svn 配置 of http
spring.cloud.config.server.svn.uri=http://svn.domain.com/config/
spring.cloud.config.server.svn.username=svn用户名
spring.cloud.config.server.svn.password=svn 密码
spring.profiles.active=subversion

```

#### svn目录结构
`/config/trunk/project-name-release.properties`


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
