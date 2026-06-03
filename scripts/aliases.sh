# System Aliases
alias cwd="pwd; ls -last"
alias nano="nano --tabstospaces --tabsize=4"
alias motd="cat ~/.motd"
# Docker ShortCuts
alias proxy-restart="docker restart proxy"
alias docoup="docker compose up -d --build"
alias dlogs="docker logs"
alias doit="docker exec -it"
alias dlog="docker logs"
# Container Creation Scripts
alias create-container-php="source /src/proxy/scripts/create-container-php.sh"
alias create-container-html="source /src/proxy/scripts/create-container-html.sh"
alias create-container-node="source /src/proxy/scripts/create-container-node.sh"
alias create-container-django="source /src/proxy/scripts/create-container-django.sh"
# Host Creation Scripts
alias create-nginx-host-html="source /src/proxy/scripts/create-nginx-host-html.sh"
alias create-nginx-host-django="source /src/proxy/scripts/create-nginx-host-django.sh"
alias create-nginx-host-php="source /src/proxy/scripts/create-nginx-host-php.sh"
alias create-nginx-host-node="source /src/proxy/scripts/create-nginx-host-node.sh"
# User & Cert Management
alias create-certificate="source /src/proxy/scripts/create-certificate.sh"
alias create-user-mail="source /src/proxy/scripts/create-user-mail.sh"
