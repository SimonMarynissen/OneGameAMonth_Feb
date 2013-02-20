NAME=1GAM_Feb

all:
	rock shmup.use --noclean -v -o=$(NAME)

run:
	./$(NAME)

clean:
	rm -rf rock_tmp .libs

debug:
	rock shmup.use --noclean -v -o=$(NAME) +-gstabs
	
test: all
	gdb -ex run ./$(NAME) 
