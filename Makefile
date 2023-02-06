RM = rm -rf
CP = cp -r

deploy:
	@echo "Deploying..."
	@flutter build web
	@$(RM) docs/*
	@$(CP) build/web/* docs/
	-@git add docs/
	-@git commit -m "📦 Deploy web"
	-@git push origin
	-@echo "Deployed! => https://ajjig.github.io/ipgeofinder/"

run:
	@echo "Running..."
	@flutter run

clean:
	@echo "Cleaning..."
	@flutter clean


.DEFAULT_GOAL := run
.PHONY: deploy run clean
