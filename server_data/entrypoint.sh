#!/bin/bash

if [ ! -f "run.sh" ]; then
    echo "Файл run.sh не найден. Идет первичная установка Neoforge..."
    
    INSTALLER=$(ls neoforge-*-installer.jar 2>/dev/null | head -n 1)
    
    if [ -n "$INSTALLER" ]; then
        java -jar "$INSTALLER" --installServer
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