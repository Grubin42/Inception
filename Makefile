DOCKER      = sudo docker
COMPOSE     = cd srcs/ && sudo docker-compose
DATA_PATH   = /home/grubin/data

all:
			mkdir -p $(DATA_PATH)
			mkdir -p $(DATA_PATH)/database
			mkdir -p $(DATA_PATH)/wordpress
			sudo chmod 777 /etc/hosts
			sudo echo "127.0.0.1 grubin.42.fr" >> /etc/hosts
			sudo echo "127.0.0.1 www.grubin.42.fr" >> /etc/hosts
			$(COMPOSE) up -d

build:
			$(COMPOSE) build
up:
			${COMPOSE} up -d 
down:
			$(COMPOSE) down
clean:
			$(COMPOSE) down --v --rmi all --remove-orphans

fclean:	clean
			$(DOCKER) system prune --volumes --all --force
			sudo rm -rf $(DATA_PATH)
			$(DOCKER) network prune --force
			echo docker volume rm $(docker volume ls -q)
			$(DOCKER) image prune --force

re:         fclean all

.PHONY:     all build up down clean fclean re
		