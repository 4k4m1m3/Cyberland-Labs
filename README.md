# Cyberland Labs Script (`cyberland.sh`)  

## Descripción del Proyecto  
Cyberland Labs Script es una herramienta completa diseñada para administrar laboratorios de Docker orientados a CTFs (Capture The Flag). Es el corazón del proyecto disponible en [CyberLand Labs](https://cyberlandsec.com/cyberland-labs/), donde encontrarás desafíos clasificados desde nivel fácil hasta nivel experto. Este script permite a los usuarios importar, crear, configurar y exportar máquinas Docker de manera sencilla para resolver CTFs.  

## Características Principales  
- **Perfil Jugador:**  
  - Importa máquinas CTF desde archivos `.tar`.  
  - Lista y elimina imágenes existentes.  
  - Inicia máquinas para desafíos.  
- **Perfil Creador:**  
  - Crea nuevas máquinas CTF con configuraciones personalizadas.  
  - Exporta imágenes Docker para compartir.  
  - Gestiona imágenes y contenedores Docker.  
- Verifica los requisitos previos para garantizar la compatibilidad.  

## Requisitos Previos  
1. **Docker:**  
   Asegúrate de tener instalado Docker:  
   ```bash
   sudo apt install docker.io
   ```
   Verifica que esté instalado ejecutando:

   ```bash
   docker --version
   ```

## Instalación

### Opción 1: Descarga Manual  
Descarga el archivo `cyberland.sh` desde este repositorio.  
Asigna permisos de ejecución:  
```bash
chmod +x cyberland.sh
```
Ejecuta el script como root o con sudo:  
```bash
sudo ./cyberland.sh
```

### Opción 2: Clonar el Repositorio  
Clona este repositorio en tu sistema:  
```bash
git clone https://github.com/4k4m1m3/Cyberland-Labs.git
```
Accede al directorio clonado y ejecuta:  
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

Para importar una máquina y ejecutarla:
1. Selecciona "Perfil Jugador".
2. Escoge "Importar máquina CTF desde archivo local".
3. Ingresa la ruta al archivo `.tar` y sigue las instrucciones en pantalla.

Para crear una nueva máquina:
1. Selecciona "Perfil Creador".
2. Define imagen base, puertos y flags de usuario y root.

## Créditos
**Desarrollador Principal:**  
4k4m1m3  
[Web](https://cyberlandsec.com)  
[LinkedIn](https://www.linkedin.com)

**CEO de CyberLand Labs:**  
Adrián Gisbert  
[Web](https://cyberlandsec.com)  
[LinkedIn](https://www.linkedin.com)

**Creador Principal de Máquinas:**  
Santiago Guevara  
[LinkedIn](https://www.linkedin.com)

## Contribuciones
Las contribuciones son bienvenidas. Si deseas colaborar, abre un issue o envía un pull request.

## Licencia
Este proyecto está licenciado bajo la **Creative Commons Attribution-NonCommercial (CC BY-NC)**.  
Esto significa que puedes usar, modificar y distribuir el proyecto con atribución al autor original, pero no para fines comerciales.  
Para más información, visita [Creative Commons](https://creativecommons.org/licenses/by-nc/4.0/).
