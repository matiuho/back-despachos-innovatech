# ETAPA 1: Build (Compilación)
# Usamos una imagen de Maven con JDK 17 sobre Alpine para que sea liviana [cite: 91]
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app

# Copiamos solo el pom.xml primero para descargar dependencias y usar la caché de Docker [cite: 129, 202]
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos el código fuente y compilamos el .jar omitiendo los tests para velocidad
COPY src ./src
RUN mvn clean package -DskipTests

# ETAPA 2: Runtime (Ejecución)
# Solo necesitamos el JRE para ejecutar, lo que reduce el tamaño de la imagen final [cite: 91, 129]
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Requerimiento IE1: Crear y usar un usuario sin privilegios de root 
RUN addgroup -S spring && adduser -S springuser -G spring
USER springuser

# Copiamos el archivo compilado desde la etapa anterior
COPY --from=build /app/target/*.jar app.jar

# Exponemos el puerto estándar de Spring Boot (Cámbialo si usas otro en application.properties) [cite: 31, 57]
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]