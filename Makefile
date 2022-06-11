.PHONY: help
.DEFAULT_GOAL := help

include Awk.mk
include Dir1/Makefile

help_multi: ## Show make commands when including other make files
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":( ##)?"; OFS = ":"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'

help_single: ## Show make commands when no other make files are included
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

readMakeCommands: ## Reads the commands from the makefiles
	grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort

readMakeFiles: ## Echo make files
	echo $(MAKEFILE_LIST)

test3: ## Echo Test 3
	echo "Test 3"

help: ## Show commands of the makefile (and any included files)
	@awk 'BEGIN {FS = ":.*?## "}; /^[0-9a-zA-Z_-]+:.*?## .*/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
