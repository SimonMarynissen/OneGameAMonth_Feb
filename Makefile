NAME=1GAM_Feb

all:
	rm -f .libs/$(NAME).a
	rock main.ooc --sourcepath=source --noclean -v -o=$(NAME)

run:
	./$(NAME)

clean:
	rm -rf rock_tmp .libs

debug:
	rock main.ooc --sourcepath=source --noclean -v -o=$(NAME) +-gstabs
	
test: all
	gdb -ex run ./$(NAME) 
