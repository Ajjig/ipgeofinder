RM = rm -rf

deploy:
	@echo "Deploying..."
	@flutter build web
	-@git add ./web
	-@git commit -m "deploy"
	-@git push origin main

run:
	@echo "Running..."
	@flutter run

clean:
	@echo "Cleaning..."
	@flutter clean




.DEFAULT_GOAL := deploy
.PHONY: deploy run clean
