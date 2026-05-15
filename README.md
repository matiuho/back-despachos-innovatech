# 🚀 Proyecto DevOps: Sistema de Gestión Innovatech Chile

Este repositorio contiene la solución técnica integral para la infraestructura, contenedorización y automatización del sistema de gestión de **Innovatech Chile**. Este proyecto ha sido desarrollado como parte de la Evaluación Parcial N°2 para la asignatura **Introducción a Herramientas DevOps (ISY1101)** en **Duoc UC**.

---

## 🏗️ 1. Arquitectura de la Solución
El sistema se basa en una arquitectura de **Microservicios** desacoplados, permitiendo una alta disponibilidad y escalabilidad independiente:

* **Frontend:** Aplicación de interfaz de usuario construida con **React + Vite**, servida de forma eficiente mediante un servidor **Nginx**.
* **Backend Ventas:** API REST robusta desarrollada en **Java / Spring Boot**.
* **Backend Despachos:** API REST robusta desarrollada en **Java / Spring Boot**.
* **Capa de Persistencia:** Gestión de datos mediante volúmenes de Docker para asegurar la durabilidad de la información ante reinicios de contenedores.

## 🛠️ 2. Stack Tecnológico (DevOps Stack)
* **Container Runtime:** Docker (Uso de *Multi-stage builds* para optimizar el tamaño de las imágenes).
* **Orquestación:** Docker Compose (Gestión de redes internas  y resolución de nombres de servicios).
* **CI/CD:** GitHub Actions (Automatización de los flujos de trabajo de Integración y Entrega Continua).
* **Cloud Hosting:** AWS EC2 (Instancia de Amazon Linux 2 configurada con políticas de acceso restringido vía Security Groups).

## 🔐 3. Seguridad y Mejores Prácticas 
Se han implementado estándares de seguridad de nivel productivo para proteger la infraestructura:
* **Gestión de Secretos:** Integración con **GitHub Secrets**. Las llaves privadas SSH y credenciales de registros están encriptadas y se inyectan en tiempo de ejecución.
* **Optimización de Imágenes:** Uso de imágenes base **Alpine Linux**, reduciendo la superficie de ataque y agilizando el despliegue.

---

## 🚀 4. Guía de Inicialización (Entorno Local)

Siga estos pasos para replicar el entorno de producción en su máquina local de forma automática.

### 📋 Pre-requisitos
* **Docker Desktop** (Motor de Docker y Docker Compose activos).
* **Git** instalado para la gestión de versiones.

### 📂 Paso 1: Clonar el Proyecto
git clone
cd <cd innovatech-devops>
🛠️ Paso 2: Construcción y Orquestación
Levante el stack completo (Front + Backs + DB) con un solo comando:
docker-compose up -d --build
3: Verificación en al terminal 
docker ps
Asegúrese de que todos los servicios muestren el estado Up o Healthy.

🌐 Paso 4: Endpoints Locales
Interfaz Web: http://localhost:80

API Ventas: http://localhost:8080

API Despachos: http://localhost:8081
