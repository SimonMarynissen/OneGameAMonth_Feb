NAME=1GAM_Feb

all:
	mkdir -pv bin
	cp -r source/assets bin/assets
	rock main.ooc --sourcepath=source --noclean -v -o=bin/$(NAME) -lmingw32
