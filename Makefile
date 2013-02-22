NAME=1GAM_Feb

all:
	rock shmup.use --noclean -v -o=$(NAME) +-g

release:
	rock shmup.use --noclean -v -o=$(NAME) +-O2

run:
	./$(NAME)

clean:
	rm -rf rock_tmp .libs
	
test: all
	gdb -ex run ./$(NAME) 
