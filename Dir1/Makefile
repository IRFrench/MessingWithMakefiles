DIR1 = 

test1: ## Echo Test 1
	echo $(currentDir)

test2: ## Echo Test 2
	echo "Test 2"

makeBash: ## Runs bash script
	./$(DIR1)bash

showAutomaticVariables: ## Echos makes automatic variables
	echo $(@D)
	echo $@
	echo $(CURDIR)