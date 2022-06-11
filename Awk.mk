test4: ## Echo Test 4
	echo "Test 4"

Awk4help: ## Take commands and use awk on them
	"Makefile:help: ## Show make commands" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}

awkMakeFile: ## Read make files
	awk '/^[0-9a-zA-Z_-]+:.*?## .*/ { print $0 }' Makefile Awk.mk Dir1/Makefile

awkPrintf2: ## Uses printf table to display make file commands
	awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$3}' Makefile Awk.mk Dir1/Makefile
