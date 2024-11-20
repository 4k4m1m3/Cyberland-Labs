# Cyberland Labs Script (`cyberland.sh`)  

## Descripción del Proyecto  
**Cyberland Labs Script** es una herramienta diseñada para administrar laboratorios de Docker orientados a **CTFs (Capture The Flag)**. Es el núcleo del proyecto disponible en [CyberLand Labs](https://cyberlandsec.com/cyberland-labs/), donde encontrarás desafíos clasificados desde nivel fácil hasta nivel experto. Este script permite a los usuarios importar, crear, configurar y exportar máquinas Docker de manera sencilla para resolver estos retos.

## Características Principales  
### Perfil Jugador:
- Importa máquinas CTF desde archivos `.tar`.
- Lista y elimina imágenes Docker existentes.
- Inicia máquinas para desafíos.

### Perfil Creador:
- Crea nuevas máquinas CTF con configuraciones personalizadas.
- Exporta imágenes Docker para compartir.
- Gestiona imágenes y contenedores Docker.

### Compatibilidad
- Verifica los requisitos previos para garantizar la compatibilidad del sistema.

## Requisitos Previos  
1. **Docker:**  
   Asegúrate de tener instalado Docker ejecutando el siguiente comando:  
   ```bash
   sudo apt install docker.io
   ```
   Para verificar la instalación, ejecuta:

   ```bash
   docker --version
   ```

## Instalación

### Opción 1: Descarga Manual  
1. Descarga el archivo `cyberland.sh` desde este repositorio.  
2. Asigna permisos de ejecución:  
   ```bash
   chmod +x cyberland.sh
   ```
3. Ejecuta el script como root o con sudo:  
   ```bash
   sudo ./cyberland.sh
   ```

### Opción 2: Clonar el Repositorio  
1. Clona este repositorio en tu sistema:  
   ```bash
   git clone https://github.com/4k4m1m3/Cyberland-Labs.git
   ```
2. Accede al directorio clonado y ejecuta:  
   ```bash
   cd Cyberland-Labs  
   chmod +x cyberland.sh  
   sudo ./cyberland.sh  
   ```

## Instrucciones de Uso

### Menú Principal
- **Perfil Jugador:**
  - Importa máquinas CTF desde archivos locales.
  - Lista y elimina imágenes Docker existentes.
  - Inicia máquinas exportadas.
  
- **Perfil Creador:**
  - Crea nuevas máquinas personalizadas.
  - Administra imágenes y contenedores Docker.
  - Exporta máquinas en formato `.tar`.
  
- **Comprobar Requisitos:**  
  Verifica que Docker esté instalado correctamente.

- **Créditos:**  
  Muestra información sobre los colaboradores del proyecto.

- **Salir:**  
  Finaliza el script.

## Ejemplo de Uso

### Importar y Ejecutar una Máquina
1. Selecciona **"Perfil Jugador"**.
2. Escoge **"Importar máquina CTF desde archivo local"**.
3. Ingresa la ruta al archivo `.tar` (ejemplo: `/home/user/Download/cyberland.tar`).
4. Luego de importar la máquina, selecciona **"Iniciar máquina exportada"** para obtener la dirección IP de la máquina y comenzar el reto.

### Crear una Nueva Máquina
1. Selecciona **"Perfil Creador"**.
2. Define la imagen base, puertos, y flags para acceso de usuario y root.

## Colaboradores

| ![Adrián Gisbert](https://cyberlandsec.com/wp-content/uploads/2024/11/adrian_gisbert-5.jpg) | ![Wuilmer Bolívar](https://cyberlandsec.com/wp-content/uploads/2024/11/wuil-4.jpg) | ![Santiago Guevara](https://cyberlandsec.com/wp-content/uploads/2024/11/santi-12.jpg) |
|:--:|:--:|:--:|
| **Adrián Gisbert**  | **Wuilmer Bolívar**  | **Santiago Guevara** |
| CEO de CyberLand Labs | Desarrollador Principal | Creador Principal de Máquinas |
| [LinkedIn](https://www.linkedin.com/in/sr-gisbert/) | [Web](https://4k4m1m3.com) / [LinkedIn](https://www.linkedin.com/in/4k4m1m3/) | [LinkedIn](https://www.linkedin.com/in/santiagoguevara-/) |

## Contribuciones
Las contribuciones son bienvenidas. Si deseas colaborar:
- Abre un issue o envía un pull request.
- Puedes contactar con cualquier colaborador si deseas contribuir con ideas o mejoras.

## Licencia
Este proyecto está licenciado bajo la **Creative Commons Attribution-NonCommercial (CC BY-NC)**.  
Esto significa que puedes usar, modificar y distribuir el proyecto con atribución al autor original, pero **no para fines comerciales**.  
Para más información, visita [Creative Commons](https://creativecommons.org/licenses/by-nc/4.0/).
