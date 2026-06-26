#!/bin/bash
set -e

if [ ! -f "run.sh" ]; then
    echo "Файл run.sh не найден. Идет первичная установка Neoforge..."
    
    INSTALLER=$(ls neoforge-*-installer.jar 2>/dev/null | head -n 1)
    
    if [ -n "$INSTALLER" ]; then
        if java -jar "$INSTALLER" --installServer; then
            echo "Установка успешно завершена."
        else
            echo "ОШИБКА: Установка прервалась!"
            rm -f run.sh run.bat
            exit 1
        fi
    else
        echo "ОШИБКА: Файл run.sh не найден и установщик (installer.jar) отсутствует!"
        exit 1
    fi
fi

echo "Принятие EULA..."
echo "eula=true" > eula.txt

if [ -f "run.sh" ]; then
    echo "Запуск сервера Neoforge..."
    exec bash run.sh
else
    echo "ОШИБКА: Файл run.sh не найден даже после выполнения установки!"
    exit 1
fi