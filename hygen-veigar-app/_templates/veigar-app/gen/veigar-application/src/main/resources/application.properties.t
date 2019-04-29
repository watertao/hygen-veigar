---
to: <%= h.mainPomLocation(h, locals) %>/src/main/resources/application.properties
---
spring.profiles.active = dev

app.basePackage = <%= h.mainPackage(h, locals) %>
server.port = 8080

cors.allowedOrigins = http://localhost:8000
cors.allowedHeaders = accept,accept-language,content-type,x-auth-token,if-modified-since,pragma,cache-control

spring.jackson.time-zone = GMT+8
spring.jackson.serialization.indent_output = true

logging.root.level = INFO
logging.level.net.demacia.operation.mapper = DEBUG

<% if(database == 'yes'){ -%>
spring.datasource.driverClassName = com.mysql.jdbc.Driver
spring.datasource.url = jdbc:mysql://localhost:33061/veigar?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull
spring.datasource.username = veigar
spring.datasource.password = passwd
spring.datasource.maxActive = 20
<% } -%>
