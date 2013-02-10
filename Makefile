NAME=1GAM_Feb

all:
	rock main.ooc --sourcepath=source --noclean -v -o=$(NAME) -lmingw32

run:
	./$(NAME)

clean:
	rm -rf rock_tmp .libs
	
test: clean all run