# COLORS
NONE			= \033[0m
CL_LINE			= \033[2K
B_RED			= \033[1;31m
B_GREEN			= \033[1;32m
B_MAGENTA 		= \033[1;35m
B_CYAN 			= \033[1;36mi

SRC=srcs/docker-compose.yml

up:
	@printf "${B_MAGENTA}Start docker compose\n${NONE}"
	docker compose -f ${SRC} up

down:
	@printf "${B_RED}XX clean XX\n${NONE}"
	@docker compose -f ${SRC} down

clean:	down
	@printf "${B_CYAN}XX clean XX\n${NONE}"
	@docker image rm -f pleveque/wordpress:stable
	@docker image rm -f pleveque/mariadb:stable
	@docker image rm -f pleveque/nginx:stable
	@docker image rm -f pleveque/adminer:stable
	@docker image rm -f pleveque/redis:stable
	@docker image rm -f pleveque/www-static:stable
	@docker image rm -f pleveque/nextjs:stablei

restart:	down clean up

.PHONY: up down clean restart
