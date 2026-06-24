.PHONY: clean restart run stop

run:
	docker compose up -d

stop:
	docker compose down

clean:
	@echo "Остановка контейнеров..."
	docker compose down
	@echo "Удаление кэша установки и бинарников NeoForge..."
	rm -rf server_data/libraries/
	rm -rf server_data/versions/
	rm -rf server_data/defaultconfigs/
	rm -f server_data/run.sh
	rm -f server_data/run.bat
	rm -f server_data/user_jvm_args.txt
	rm -rf server_data/config/*
	rm -rf server_data/logs/*
	rm -rf server_data/eula.txt
	rm -rf server_data/neoforge-*-installer.jar.log
	rm -rf server_data/*json
	@echo "Очистка завершена. Папка server_data готова к чистой установке."

restart: clean
	@echo "Запуск контейнера в фоновом режиме..."
	docker compose up -d
	@echo "Подключение к логам установщика (Ctrl+C для выхода из логов)..."
	docker compose logs -f