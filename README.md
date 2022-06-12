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