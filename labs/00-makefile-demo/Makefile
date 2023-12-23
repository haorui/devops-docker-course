# https://opensource.com/article/18/8/what-how-makefile
# 默认执行 方式一
#.DEFAULT_GOAL := say-hello

.PHONY: all say-hello generate clean 
# 默认执行 方式二
all: say-hi

say-hello:
	echo hello make

say-hi:
	@echo hi make

generate:
	@echo Create empty text files...
	touch file-{1..10}.txt

clean:
	@echo Cleaning up...
	rm *.txt