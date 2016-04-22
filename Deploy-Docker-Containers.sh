cd "$1/Apps/Node-Proxy"
sudo docker build -t 'Docker-Build' .
sudo docker run --expose 3000 -p 8080:3000 -d -it --name 'Node-Proxy' 'Docker-Build'

cd "$1/Apps/Node-Server"
sudo docker build -t 'Docker-Build' .
sudo docker run -d -it --name 'Node-Server' 'Docker-Build' --link 'Node-Proxy'
