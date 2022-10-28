.PHONY: help run
.DEFAULT_GOAL := help

file="test"

help: ## Show commands of the makefile (and any included files)
	@awk 'BEGIN {FS = ":.*?## "}; /^[0-9a-zA-Z_-]+:.*?## .*/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## Run the given C++ file with the variable 'file'
	@g++ $(file).cpp -o $(file)
	@./$(file)

test_commands: ## gives you some test commands
	@echo "make run:"
	@echo "	uses the default value of 'test' to run the test file"
	@echo ""
	@echo "make run file=first:"
	@echo "	uses the file variable to run the 'first' file"