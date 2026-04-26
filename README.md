# 📦 Linux AutoBackup Tool

Sistema de respaldo automatizado desarrollado en Bash para **Fedora**. Este script comprime directorios importantes, gestiona el almacenamiento eliminando copias antiguas y envía notificaciones nativas al escritorio.

## 🚀 Características
* **Compresión Inteligente:** Usa `tar` con gzip para ahorrar espacio.
* **Mantenimiento Automático:** Elimina respaldos con más de 7 días de antigüedad.
* **Integración con GNOME:** Envía notificaciones de éxito o error vía `notify-send`.
* **Automatización:** Diseñado para ejecutarse mediante tareas `cron`.

## 🛠️ Instalación y Uso
1. Clona el repositorio.
2. Otorga permisos de ejecución:
   ```bash
   chmod +x backup.sh
3. Ejecuta manuealmente: ./backup.sh

⏰ Automatización (Cron)
Para programarlo todos los domingos a las 11:59 PM, añade esto a tu crontab -e:
59 23 * * 0 /ruta/a/tu/script/backup.sh

Desarrollado por Alex-20KD como parte de los proyectos de Ingeniería de Software.