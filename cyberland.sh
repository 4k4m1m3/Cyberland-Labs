#!/bin/bash

GREEN="\e[92m"
LIGHT_GREEN="\e[1;32m"
RED="\e[31m"
LIGHT_RED="\e[1;31m"
YELLOW="\e[93m"
BLUE="\e[1;34m"
CYAN="\e[96m"
MAGENTA="\e[1;35m"
RESET="\e[0m"

if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}❌ Este script debe ejecutarse como root o con sudo.${RESET}" 
   exit 1
fi

comprobar_requisitos() {
    clear
    echo -e "${GREEN}==========================================${RESET}"
    echo -e "${LIGHT_RED}      🔍 Comprobar Requisitos 🔍${RESET}"
    echo -e "${GREEN}==========================================${RESET}"
    echo
    if ! command -v docker &> /dev/null
    then
        echo -e "${RED}❌ Docker no está instalado.${RESET}"
        echo -e "Por favor, instala Docker y vuelve a intentarlo."
        echo -e "${YELLOW}Puedes descargarlo desde: https://docs.docker.com/get-docker/${RESET}"
    else
        echo -e "${GREEN}✅ Docker está instalado.${RESET}"
        docker --version
    fi
    echo
    read -p "Presione Enter para regresar al menú principal..."
}

iniciar_perfil_jugador() {
    clear
    echo -e "${LIGHT_GREEN}🕹️ Cargando el Perfil Jugador...${RESET}"
    menu_jugador
}

iniciar_perfil_creador() {
    clear
    echo -e "${LIGHT_GREEN}🛠️ Cargando el Perfil Creador...${RESET}"
    menu_creador
}

salir_script() {
    echo -e "${LIGHT_RED}👋 Saliendo del script...${RESET}"
    exit 0
}

mostrar_creditos() {
    clear
    echo -e "\e[1;35m==========================================\e[0m"
    echo -e "\e[1;35m                Créditos                  \e[0m"
    echo -e "\e[1;35m==========================================\e[0m"
    echo
    echo -e "\e[1;33m✨ Desarrollador:\e[0m"
    echo -e "\e[93mVersión: 1.0\e[0m"
    echo -e "\e[93mAutor: 4k4m1m3\e[0m"
    echo -e "\e[93mWeb: 4k4m1m3.com\e[0m"
    echo -e "\e[96mLinkedIn: https://www.linkedin.com/in/4k4m1m3/\e[0m"
    echo
    echo -e "\e[1;33m👨‍💼 CEO de CyberLand Labs:\e[0m"
    echo -e "\e[93mAdrián Gisbert\e[0m"
    echo -e "\e[96mDesarrollo, programación y mejora de la web\e[0m"
    echo -e "\e[96mWeb: https://cyberlandsec.com\e[0m"
    echo -e "\e[96mLinkedIn: https://www.linkedin.com/in/sr-gisbert/\e[0m"
    echo
    echo -e "\e[1;33m🛠️ Creador Principal de Máquinas:\e[0m"
    echo -e "\e[93mSantiago Guevara\e[0m"
    echo -e "\e[96mAdministración, creación y desarrollo de nuevas máquinas CTFs\e[0m"
    echo -e "\e[96mLinkedIn: https://www.linkedin.com/in/santiagoguevara-/\e[0m"
    echo
    echo -e "\e[1;35m==========================================\e[0m"
    echo
    read -p "Presione Enter para regresar al menú principal..."
}

menu_principal() {
    while true; do
        clear
        echo -e "${GREEN}==========================================${RESET}"
        echo -e "${LIGHT_GREEN}       🦾 Bienvenidos a Cyberland Labs 🦾${RESET}"
        echo -e "${GREEN}==========================================${RESET}"
        echo
        echo -e "${CYAN}Este script te permite administrar, crear, exportar y eliminar imágenes y contenedores Docker.${RESET}"
        echo -e "${CYAN}Podrás crear y configurar nuevas máquinas para CTFs, exportarlas y, si lo deseas, jugar en ellas.${RESET}"
        echo
        echo -e "${MAGENTA}🔹 Existen cinco opciones disponibles: ${RESET}"
        echo -e "${GREEN}1)${RESET} Perfil Jugador    - Descargar, ejecutar y resolver desafíos en las máquinas CTF ya configuradas."
        echo -e "${GREEN}2)${RESET} Perfil Creador    - Crear, configurar y exportar nuevas máquinas CTF."
        echo -e "${GREEN}3)${RESET} Comprobar Requisitos"
        echo -e "${GREEN}4)${RESET} Créditos"
        echo -e "${GREEN}5)${RESET} Salir del script"
        echo
        echo -e "${BLUE}🌐 Web principal:${RESET} ${LIGHT_GREEN}cyberlandsec.com${RESET}"
        echo
        echo -e "${GREEN}==========================================${RESET}"
        echo
        echo -e "${CYAN}Ingrese el número correspondiente a la opción deseada:${RESET}"
        echo -e "${GREEN}1)${RESET} Perfil Jugador"
        echo -e "${GREEN}2)${RESET} Perfil Creador"
        echo -e "${GREEN}3)${RESET} Comprobar Requisitos"
        echo -e "${GREEN}4)${RESET} Créditos"
        echo -e "${GREEN}5)${RESET} Salir"
        echo
        read -p "Opción: " opcion
        case $opcion in
            1)
                iniciar_perfil_jugador
                ;;
            2)
                iniciar_perfil_creador
                ;;
            3)
                comprobar_requisitos
                ;;
            4)
                mostrar_creditos
                ;;
            5)
                salir_script
                ;;
            *)
                echo -e "${LIGHT_RED}❌ Opción inválida. Por favor, ingrese un número entre 1 y 5.${RESET}"
                sleep 2
                ;;
        esac
    done
}

menu_jugador() {
    while true; do
        clear
        echo -e "${GREEN}==========================================${RESET}"
        echo -e "${LIGHT_GREEN}      🎮 Menú del Perfil Jugador 🎮${RESET}"
        echo -e "${GREEN}==========================================${RESET}"
        echo
        echo -e "${CYAN}1) Importar máquina CTF desde archivo local${RESET}"
        echo -e "${CYAN}2) Listar imágenes Docker existentes${RESET}"
        echo -e "${CYAN}3) Eliminar imagen Docker existente${RESET}"
        echo -e "${CYAN}4) Iniciar máquina exportada${RESET}"
        echo -e "${CYAN}5) Regresar al menú principal${RESET}"
        echo -e "${CYAN}6) Salir del script${RESET}"
        echo
        read -p "Seleccione una opción: " opcion
        if [[ -z "$opcion" || ! "$opcion" =~ ^[1-6]$ ]]; then
            echo "❌ Opción inválida. Por favor ingrese un número entre 1 y 6."
            read -p "Presione Enter para continuar..." dummy
            continue
        fi
        case $opcion in
            1) importar_maquina ;;
            2) listar_imagenes_existentes ;;
            3) eliminar_imagen ;;
            4) iniciar_maquina_exportada ;;
            5) break ;;
            6) salir_script ;;
        esac
    done
}

importar_maquina() {
    clear
    echo "=========================================="
    echo -e "    📂 Importar máquina CTF desde archivo 📂"
    echo "=========================================="
    read -p "Ingrese la ruta del archivo de la máquina (ejemplo: /ruta/a/mi_archivo.tar): " archivo_maquina
    if [ ! -f "$archivo_maquina" ]; then
        echo "❌ El archivo no existe. Intente nuevamente."
        read -p "Presione Enter para regresar al menú..."
        return
    fi
    echo "Importando la máquina desde '$archivo_maquina'..."
    docker load -i "$archivo_maquina"
    if [ $? -eq 0 ]; then
        echo "🎉 La máquina ha sido importada exitosamente."
    else
        echo "❌ Ocurrió un error al importar la máquina."
    fi
    read -p "Presione Enter para regresar al menú..."
}

listar_imagenes_existentes() {
    clear
    echo "=========================================="
    echo -e "    📋 Imágenes Docker Existentes 📋"
    echo "=========================================="
    docker images
    read -p "Presione Enter para regresar al menú..."
}

eliminar_imagen() {
    clear
    echo "=========================================="
    echo -e "    🗑️ Eliminar Imagen Docker 🗑️"
    echo "=========================================="
    docker images
    read -p "Ingrese el nombre de la imagen que desea eliminar (nombre:tag, ej: debian:latest): " nombre_imagen
    if [ -z "$nombre_imagen" ]; then
        echo "❌ No ha ingresado un nombre de imagen. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    contenedores_que_usan_imagen=$(docker ps -a -q -f "ancestor=$nombre_imagen")
    if [ -n "$contenedores_que_usan_imagen" ]; then
        echo "⚠️ Hay contenedores usando la imagen '$nombre_imagen'. Deteniéndolos y eliminándolos..."
        docker stop $contenedores_que_usan_imagen
        docker rm $contenedores_que_usan_imagen
        if [ $? -ne 0 ]; then
            echo "❌ Ocurrió un error al detener o eliminar los contenedores."
            read -p "Presione Enter para regresar al menú..."
            return
        fi
    fi
    docker rmi "$nombre_imagen"
    if [ $? -eq 0 ]; then
        echo "🎉 La imagen '$nombre_imagen' ha sido eliminada correctamente."
    else
        echo "❌ Ocurrió un error al eliminar la imagen."
    fi
    read -p "Presione Enter para regresar al menú..."
}

iniciar_maquina_exportada() {
    clear
    echo "=========================================="
    echo -e "    🚀 Iniciar máquina exportada 🚀"
    echo "=========================================="
    docker images
    read -p "Ingrese el nombre de la máquina que desea iniciar (nombre:tag, ej: debian:latest): " nombre_maquina
    if [ -z "$nombre_maquina" ]; then
        echo "❌ No ha ingresado el nombre de la máquina. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    contenedor_nombre="${nombre_maquina//:/_}_container"
    contenedor_existente=$(docker ps -a -q -f "name=$contenedor_nombre")
    if [ -n "$contenedor_existente" ]; then
        echo "⚠️ El contenedor '$contenedor_nombre' ya existe. Deteniéndolo y eliminándolo..."
        docker stop "$contenedor_nombre"
        docker rm "$contenedor_nombre"
        if [ $? -ne 0 ]; then
            echo "❌ Ocurrió un error al detener o eliminar el contenedor."
            read -p "Presione Enter para regresar al menú..."
            return
        fi
    fi
    echo "Iniciando el contenedor '$nombre_maquina'..."
    docker run -d --name "$contenedor_nombre" "$nombre_maquina" tail -f /dev/null
    container_status=$(docker ps -q -f "name=$contenedor_nombre")
    if [ -z "$container_status" ]; then
        echo "❌ El contenedor no se está ejecutando. Esto podría ser por un error en el contenedor."
        sleep 2
        docker logs "$contenedor_nombre" 2>&1 | tee logs.txt
        echo "Los logs del contenedor están guardados en 'logs.txt'."
        read -p "Presione Enter para regresar al menú..."
        return
    fi
    container_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$contenedor_nombre")
    if [ -z "$container_ip" ]; then
        echo "❌ No se pudo obtener la dirección IP del contenedor."
    else
        echo
        echo "=========================================="
        echo -e "\e[1;36m🔌 La dirección IP de la máquina es: $container_ip\e[0m"
        echo "=========================================="
        echo
        echo -e "\e[1;34m➡️ Ahora puedes realizar pruebas de conexión con \`ping\`, usar \`nmap\` para identificar puertos y servicios, y comenzar tu CTF.\e[0m"
        echo
    fi
    read -p "Presione Enter para regresar al menú..."
}

conectar_contenedor() {
    clear
    echo "=========================================="
    echo -e "    🔧 Conectar a un Contenedor Docker 🔧"
    echo "=========================================="
    docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"
    read -p "Ingrese el CONTAINER ID del contenedor que desea modificar: " container_id
    if [ -z "$container_id" ]; then
        echo "❌ No ha ingresado un CONTAINER ID. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    container_exists=$(docker ps -a -q -f "id=$container_id")
    if [ -z "$container_exists" ]; then
        echo "❌ El contenedor con ID '$container_id' no existe. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    container_status=$(docker inspect --format '{{.State.Status}}' "$container_id")
    if [ "$container_status" != "running" ]; then
        echo "❌ El contenedor con ID '$container_id' no está en ejecución."
        read -p "¿Desea iniciar el contenedor? (s/n): " iniciar_cont
        if [[ "$iniciar_cont" =~ ^[sS]$ ]]; then
            docker start "$container_id"
            if [ $? -ne 0 ]; then
                echo "❌ Ocurrió un error al iniciar el contenedor."
                read -p "Presione Enter para regresar al menú..."
                return
            fi
            echo "🚀 Contenedor '$container_id' iniciado correctamente."
        else
            echo "❌ No se inició el contenedor. Regresando al menú..."
            read -p "Presione Enter para continuar..." dummy
            return
        fi
    fi
    echo "Conectando al contenedor '$container_id'..."
    docker exec -it "$container_id" bash
    read -p "¿Desea guardar los cambios realizados en una nueva imagen? (s/n): " guardar_cambios
    if [[ "$guardar_cambios" =~ ^[sS]$ ]]; then
        read -p "Ingrese el nombre para la nueva imagen (ej: cyber:latest): " nueva_imagen
        if [ -n "$nueva_imagen" ]; then
            docker commit "$container_id" "$nueva_imagen"
            if [ $? -eq 0 ]; then
                echo "🎉 Los cambios se han guardado en la nueva imagen '$nueva_imagen'."
            else
                echo "❌ Ocurrió un error al guardar la nueva imagen."
            fi
        else
            echo "❌ No se proporcionó un nombre para la nueva imagen. No se guardaron los cambios."
        fi
    fi
    read -p "Presione Enter para regresar al menú..."
}

menu_creador() {
    while true; do
        clear
        echo -e "${GREEN}==========================================${RESET}"
        echo -e "${LIGHT_GREEN}      🔧 Menú del Perfil Creador 🔧${RESET}"
        echo -e "${GREEN}==========================================${RESET}"
        echo
        echo -e "${CYAN}1) Crear nueva máquina${RESET}"
        echo -e "${CYAN}2) Administrar imágenes Docker${RESET}"
        echo -e "${CYAN}3) Administrar contenedores Docker${RESET}"
        echo -e "${CYAN}4) Regresar al menú principal${RESET}"
        echo -e "${CYAN}5) Salir del script${RESET}"
        echo
        read -p "Seleccione una opción: " opcion
        if [[ -z "$opcion" || ! "$opcion" =~ ^[1-5]$ ]]; then
            echo "❌ Opción inválida. Por favor ingrese un número entre 1 y 5."
            read -p "Presione Enter para continuar..." dummy
            continue
        fi
        case $opcion in
            1) crear_maquina ;;
            2) administrar_imagenes ;;
            3) administrar_contenedores ;;
            4) break ;;
            5) salir_script ;;
        esac
    done
}

crear_maquina() {
    local HIDDEN_MARKER="TcOhcXVpbmEgZ2VuZXJhZGEgY29uIGN5YmVybGFuZC5zaCBzY3JpcHQgZGVzYXJyb2xsYWRvIHBvciA0azRtMW0zLiDCgUdyYWNpYXMgcG9yIGVsZWdpciBDeWJlckxhbmQgTGFicyEgVmlzaXRhOiBodHRwczovL2N5YmVybGFuZHNlYy5jb20="

    clear
    echo "=========================================="
    echo -e "    🛠️ Crear una nueva máquina CTF 🛠️${RESET}"
    echo "=========================================="
    read -p "Ingrese el nombre de la nueva máquina (en minúscula sin espacios): " nombre_maquina
    read -p "Ingrese la imagen base (Ej: ubuntu:20.04): " imagen_base
    read -p "Ingrese los puertos a exponer (Ej: 22,80): " puertos
    read -p "Ingrese el contenido de la flag user.txt: " flag_user
    read -p "Ingrese el contenido de la flag root.txt: " flag_root
    if [ -z "$nombre_maquina" ] || [ -z "$imagen_base" ] || [ -z "$puertos" ] || [ -z "$flag_user" ] || [ -z "$flag_root" ]; then
        echo "❌ Todos los campos obligatorios deben ser llenados. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    echo "Creando Dockerfile..."
    cat <<EOF > Dockerfile
FROM $imagen_base

RUN groupadd cyberland && \
    useradd -m -g cyberland cyberland

RUN echo "cyberland:password" | chpasswd && \
    echo "root:password" | chpasswd

RUN echo "$flag_user" > /home/cyberland/user.txt && \
    echo "$flag_root" > /root/root.txt

RUN mkdir /home/cyberland/.cyberland_info && \
    echo "$HIDDEN_MARKER" | base64 --decode > /home/cyberland/.cyberland_info/.cyberland_info.txt && \
    chown cyberland:cyberland /home/cyberland/.cyberland_info/.cyberland_info.txt && \
    chmod 600 /home/cyberland/.cyberland_info/.cyberland_info.txt

RUN echo "$(echo "$HIDDEN_MARKER" | base64 --decode)" >> /etc/motd

RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER cyberland
WORKDIR /home/cyberland

# Exponer los puertos individualmente
EOF

IFS=',' read -ra PUERTOS_ARRAY <<< "$puertos"
for puerto in "${PUERTOS_ARRAY[@]}"; do
    echo "EXPOSE $puerto" >> Dockerfile
done

cat <<EOF >> Dockerfile

CMD ["bash"]
EOF

    echo "Construyendo la imagen Docker..."
    docker build -t "$nombre_maquina" .
    if [ $? -ne 0 ]; then
        echo "❌ Error al construir la imagen Docker. Verifica el Dockerfile y los parámetros ingresados."
        rm -f Dockerfile
        read -p "Presione Enter para regresar al menú..."
        return
    fi
    rm -f Dockerfile
    echo "🚀 Máquina '$nombre_maquina' creada exitosamente."
    echo
    read -p "¿Desea iniciar el contenedor para conectarse y configurarlo? (s/n): " iniciar
    if [[ "$iniciar" =~ ^[sS]$ ]]; then
        echo -e "Para finalizar la configuración y regresar al menú principal, escriba 'exit' y presione Enter."
        echo -e "\nIniciando contenedor...\n"
        docker run -it --name "${nombre_maquina}_container" "$nombre_maquina" bash
    fi
    read -p "¿Desea exportar esta máquina a formato tar para enviarla? (s/n): " exportar
    if [[ "$exportar" =~ ^[sS]$ ]]; then
        docker save -o "${nombre_maquina}.tar" "$nombre_maquina"
        if [ $? -eq 0 ]; then
            echo "🎉 La imagen ha sido exportada a '${nombre_maquina}.tar'."
        else
            echo "❌ Ocurrió un error al exportar la imagen."
        fi
    fi
    echo -e "\n¿Qué le gustaría hacer ahora?"
    echo -e "${GREEN}1)${RESET} Regresar al menú principal"
    echo -e "${GREEN}2)${RESET} Salir del script"
    read -p "Seleccione una opción: " opcion_final
    case $opcion_final in
        1) return ;;
        2) salir_script ;;
        *) echo "❌ Opción inválida. Regresando al menú principal..."; read -p "Presione Enter para continuar..." dummy ;;
    esac
}

administrar_imagenes() {
    while true; do
        clear
        echo "=========================================="
        echo -e "    📋 Administrar Imágenes Docker 📋"
        echo "=========================================="
        echo -e "${CYAN}1) Listar imágenes Docker${RESET}"
        echo -e "${CYAN}2) Eliminar imagen Docker${RESET}"
        echo -e "${CYAN}3) Conectar a un contenedor para modificarlo${RESET}"
        echo -e "${CYAN}4) Regresar al menú del perfil Creador${RESET}"
        read -p "Seleccione una opción: " opcion_imagen
        case $opcion_imagen in
            1) listar_imagenes ;;
            2) eliminar_imagen ;;
            3) conectar_contenedor ;;
            4) break ;;
            *) echo "❌ Opción inválida."; read -p "Presione Enter para continuar..." dummy ;;
        esac
    done
}

listar_imagenes() {
    clear
    echo "=========================================="
    echo -e "    📋 Listar Imágenes Docker 📋"
    echo "=========================================="
    docker images
    read -p "Presione Enter para regresar al menú..."
}

eliminar_imagen() {
    clear
    echo "=========================================="
    echo -e "    🗑️ Eliminar Imagen Docker 🗑️"
    echo "=========================================="
    docker images
    read -p "Ingrese el nombre de la imagen que desea eliminar (nombre:tag, ej: debian:latest): " nombre_imagen
    if [ -z "$nombre_imagen" ]; then
        echo "❌ No ha ingresado un nombre de imagen. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    contenedores_que_usan_imagen=$(docker ps -a -q -f "ancestor=$nombre_imagen")
    if [ -n "$contenedores_que_usan_imagen" ]; then
        echo "⚠️ Hay contenedores usando la imagen '$nombre_imagen'. Deteniéndolos y eliminándolos..."
        docker stop $contenedores_que_usan_imagen
        docker rm $contenedores_que_usan_imagen
        if [ $? -ne 0 ]; then
            echo "❌ Ocurrió un error al detener o eliminar los contenedores."
            read -p "Presione Enter para regresar al menú..."
            return
        fi
    fi
    docker rmi "$nombre_imagen"
    if [ $? -eq 0 ]; then
        echo "🎉 La imagen '$nombre_imagen' ha sido eliminada correctamente."
    else
        echo "❌ Ocurrió un error al eliminar la imagen."
    fi
    read -p "Presione Enter para regresar al menú..."
}

administrar_contenedores() {
    while true; do
        clear
        echo "=========================================="
        echo -e "    ⚙️ Administrar Contenedores Docker ⚙️"
        echo "=========================================="
        echo -e "${CYAN}1) Listar contenedores Docker${RESET}"
        echo -e "${CYAN}2) Eliminar contenedor Docker${RESET}"
        echo -e "${CYAN}3) Regresar al menú del perfil Creador${RESET}"
        read -p "Seleccione una opción: " opcion_contenedor
        case $opcion_contenedor in
            1) listar_contenedores ;;
            2) eliminar_contenedor ;;
            3) break ;;
            *) echo "❌ Opción inválida."; read -p "Presione Enter para continuar..." dummy ;;
        esac
    done
}

listar_contenedores() {
    clear
    echo "=========================================="
    echo -e "    📋 Listar Contenedores Docker 📋"
    echo "=========================================="
    docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"
    read -p "Presione Enter para regresar al menú..."
}

eliminar_contenedor() {
    clear
    echo "=========================================="
    echo -e "    🗑️ Eliminar Contenedor Docker 🗑️"
    echo "=========================================="
    docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Names}}"
    read -p "Ingrese el CONTAINER ID del contenedor que desea eliminar: " contenedor_id
    if [ -z "$contenedor_id" ]; then
        echo "❌ No ha ingresado un CONTAINER ID. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    container_exists=$(docker ps -a -q -f "id=$contenedor_id")
    if [ -z "$container_exists" ]; then
        echo "❌ El contenedor con ID '$contenedor_id' no existe. Regresando al menú..."
        read -p "Presione Enter para continuar..." dummy
        return
    fi
    docker rm -f "$contenedor_id"
    if [ $? -eq 0 ]; then
        echo "🎉 El contenedor '$contenedor_id' ha sido eliminado correctamente."
    else
        echo "❌ Ocurrió un error al eliminar el contenedor."
    fi
    read -p "Presione Enter para regresar al menú..."
}

menu_jugador() {
    while true; do
        clear
        echo -e "${GREEN}==========================================${RESET}"
        echo -e "${LIGHT_GREEN}      🎮 Menú del Perfil Jugador 🎮${RESET}"
        echo -e "${GREEN}==========================================${RESET}"
        echo
        echo -e "${CYAN}1) Importar máquina CTF desde archivo local${RESET}"
        echo -e "${CYAN}2) Listar imágenes Docker existentes${RESET}"
        echo -e "${CYAN}3) Eliminar imagen Docker existente${RESET}"
        echo -e "${CYAN}4) Iniciar máquina exportada${RESET}"
        echo -e "${CYAN}5) Regresar al menú principal${RESET}"
        echo -e "${CYAN}6) Salir del script${RESET}"
        echo
        read -p "Seleccione una opción: " opcion
        if [[ -z "$opcion" || ! "$opcion" =~ ^[1-6]$ ]]; then
            echo "❌ Opción inválida. Por favor ingrese un número entre 1 y 6."
            read -p "Presione Enter para continuar..." dummy
            continue
        fi
        case $opcion in
            1) importar_maquina ;;
            2) listar_imagenes_existentes ;;
            3) eliminar_imagen ;;
            4) iniciar_maquina_exportada ;;
            5) break ;;
            6) salir_script ;;
        esac
    done
}

menu_principal
