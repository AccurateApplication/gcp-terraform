# gcp-terraform

help: ## help
	@grep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: build
build: ## terraform apply
	terraform apply -auto-approve
	sleep 30s
	ansible-playbook -i ansible/inventory.yml ansible/provision.yml


.PHONY: destroy
destroy: ## terraform destroy
	terraform destroy -auto-approve

.PHONY: req
req: ##  req(uirements)
	ansible-galaxy install -r ./ansible/collections/requirements.yml


.PHONY: rebuild
rebuild: ##  destroy & rebuild
	make destroy
	sleep 5s
	make build
