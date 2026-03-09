@echo off
chcp 65001 >nul
echo =======================================================
echo     Script de Subida a GitHub - Digitales III
echo =======================================================
echo.

:: Verifica si ya es un repositorio git
IF NOT EXIST ".git" (
    echo [!] Inicializando repositorio local por primera vez...
    git init
    git branch -M main
    git remote add origin https://github.com/javierssj22/Digitales_III.git
)

:: Pide la descripción del commit
set /p desc="Ingresa el nombre o descripcion del cambio (presiona Enter para usar fecha/hora): "

:: Si no se ingresa nada, usa la fecha y hora actual como mensaje
if "%desc%"=="" (
    set desc=Actualizacion del %date% a las %time%
)

echo.
echo [1/3] Añadiendo archivos...
git add .

echo [2/3] Guardando cambios localmente (commit)...
git commit -m "%desc%"

echo [A/3] Sincronizando repositorio local con GitHub...
git pull origin main --rebase

echo [3/3] Subiendo a GitHub...
git push -u origin main

echo.
echo =======================================================
echo              ¡Subida finalizada!
echo =======================================================
pause
