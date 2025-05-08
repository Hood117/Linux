#!/bin/bash

# Services to check
services=("sshd" "firewalld" "crond" "NetworkManager")

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "\n🔧 ${YELLOW}Service Status Dashboard${NC}\n"

for service in "${services[@]}"
do
    if systemctl is-active --quiet "$service"; then
        echo -e "$service: ${GREEN}ACTIVE ✅${NC}"
    else
        echo -e "$service: ${RED}INACTIVE ❌${NC}"

        read -p "   ➤ Do you want to restart $service? (y/n): " choice
        if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
            sudo systemctl restart "$service"
            if systemctl is-active --quiet "$service"; then
                echo -e "   ↳ ${GREEN}$service restarted successfully ✔️${NC}"
            else
                echo -e "   ↳ ${RED}Failed to restart $service ❌${NC}"
            fi
        fi
    fi
done

echo -e "\n✅ ${GREEN}Done checking all services.${NC}\n"
