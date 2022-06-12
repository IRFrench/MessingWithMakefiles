test4: ## Echo Test 4
	echo "Test 4"

awkMakeFile: ## Read make files
	awk '/^[0-9a-zA-Z_-]+:.*?## .*/ { print $0 }' Makefile Awk.mk Dir1/Makefile

awkReadMakeCommands: ## Show commands of the makefile (and any included file
	@awk 'BEGIN {FS = ":.*?## "}; /^[0-9a-zA-Z_-]+:.*?## .*/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
