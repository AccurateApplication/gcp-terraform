# gcp-terraform

help: ## help
	@grep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: build
build: ## terraform apply
	terraform apply -auto-approve

.PHONY: destroy
destroy: ## terraform destroy
	terraform destroy -auto-approve
