# MessingWithMakefiles
Messing around with makefiles and awk, as well as other command line systems

## Make variables
[Make variables](https://www.gnu.org/software/make/manual/html_node/Special-Variables.html#Special-Variables)

`.PHONY` is used by Makefiles to avoid a conflict with a file of the same name, and to improve performance. If you have a make command with the same name as a file, you can use .phony to avoid conflicts. This can be seen with the `Test` command.

`.DEFAULT_GOAL` is used to set the default command. The default command will be run when you use the make command without specifying an option.

## Using make recursion
[Make Recursion](https://www.gnu.org/software/make/manual/make.html#Recursion)

This essentially runs make in make, and is used for running commands in other directories.

However, this didn't seem efficient to me since if you include the file, you would still need to re-write all of the commands with this. Instead I used a variable that changes the directory dependant on what makefile you run the commands from.

## Notes
- Using `@` will stop make from printing the command being run

## Usage
Run `make` to show all of the make commands and their description. Proceed to run any make command, this was just testing for fun. Feel free to mess around with this

## Custom Makefile names

You can use the `.mk` file extention to create make files with custom names. However, they will not be able to be used with the make command.

This can be easily fixed by creating the standard `Makefile` and including the custom makefile which can then be used make.

My custom help command will check all of the included files and display all of the commands available.

```
help: ## Show commands of the makefile (and any included files)
    @awk 'BEGIN {FS = ":.*?## "}; /^[0-9a-zA-Z_.-]+:.*?## .*/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
```

One note about including makefiles. When the include is called, it is immeditely processed. Meaning it will override any changes made currently, or will be overridden by any changes made later.

This can be seen in the `make_variables` folder, where the `variables.mk` makefile assigns `Foo="there"`, but is overridden in the Makefile. This is because the includes is processed all at once, and the Makefile assignes `Foo="test"` after the include.

And although `variables.mk` uses the value of Foo, it will still echo `test` as the variable is assigned after the processing of the makefiles.

## Variables

Variables can be assigned when running make commands. Simply add the varible into the command (e.g `echo $(Foo)`) and then when calling the command, assign the variable like so: `make test Foo=test`. This will echo `test`.

You can assign the variable in the make file as the default value, and any variables passed in the command line will override this value.

This can be particuarly useful for