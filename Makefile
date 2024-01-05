all: up

linux:
	@sudo apt-get update 
	@sudo apt-get upgrade -y
	@sudo apt-get install -y curl gnupg ca-certificates lsb-release docker.io docker docker-compose
	@sudo touch /etc/hosts
	@sudo chmod 777 /etc/hosts
	@echo "127.0.0.1 aaudevar.42.fr" >> /etc/hosts
	@echo "127.0.0.1 ws.aaudevar.42.fr" >> /etc/hosts
	@echo "127.0.0.1 adminer.aaudevar.42.fr" >> /etc/hosts

up:
	@sudo mkdir -p /home/aaudevar/data/db /home/aaudevar/data/wordpress
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

restart:
	@sudo docker-compose -f ./srcs/docker-compose.yml stop
	@sudo docker-compose -f ./srcs/docker-compose.yml start

down:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	@sudo docker rm -f $$(sudo docker ps -qa)
	@sudo docker volume rm -f $$(sudo docker volume ls)
	@sudo rm -rf /home/aaudevar/data

prune:
	@sudo docker system prune -af 