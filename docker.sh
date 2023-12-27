#!/bin/bash
# this is to draw pattern
# stty size | perl -ale 'print "-"x$F[1]'
# set color variable (RED setaf 1, GREEN setaf 2, YELLOW setaf 3, BLUE setaf 4, RESET sgr0)
export RED=$(tput setaf 1 :-"" 2>/dev/null)
export GREEN=$(tput setaf 2 :-"" 2>/dev/null)
export YELLOW=$(tput setaf 3 :-"" 2>/dev/null)
export BLUE=$(tput setaf 4 :-"" 2>/dev/null)
export RESET=$(tput sgr0 :-"" 2>/dev/null)
# Draw colored line
# echo $GREEN; printf -- "-%.0s" $(seq $(tput cols)); echo $RESET
# Write something in color and go back to normal color
# echo $GREEN Hello $RESET
echo "$BLUE ==========>>>>>     Welcome to kubernetes installation     <<<<<========== $RESET"
echo ""
echo "$YELLOW ==========>>>>>                Please wait                 <<<<<========== $RESET"
sleep 5
echo "$YELLOW ==========>>>>>               Step 01 of 05                <<<<<========== $RESET"
echo "$RED ==========>>>>>         Installing pre-requisites          <<<<<========== $RESET"
sleep 5
yum install -y yum-utils
echo "$GREEN ==========>>>>>                    Done                    <<<<<========== $RESET"
sleep 3
echo ""
echo ""
echo ""
echo "$YELLOW ==========>>>>>               Step 02 of 05                <<<<<========== $RESET"
echo "$RED ==========>>>>>        Uninstalling existing docker        <<<<<========== $RESET"
sleep 5
yum remove containers-common -y
echo "$GREEN ==========>>>>>                    Done                    <<<<<========== $RESET"
sleep 3
echo ""
echo ""
echo ""
echo "$YELLOW ==========>>>>>               Step 03 of 05                <<<<<========== $RESET"
echo "$RED ==========>>>>>             Installing Docker              <<<<<========== $RESET"
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y
systemctl enable --now docker
docker --version
echo "$GREEN ==========>>>>>                    Done                    <<<<<========== $RESET"
sleep 3
echo "Docker is installed."
echo "Do you want to install Kubernetes?"
read KUBE
if
        [[ $KUBE =~ ^([]|[nN]|[nN][oO])$ ]]
then
        echo ""
        echo "$GREEN Docker is installed $RESET"
        echo "$YELLOW Thank You for using Docker installation bash script $RESET"
        echo "$BLUE Have a nice Day $RESET"
        echo ""
        exit 0
fi
echo "$RED ==========>>>>> Do if yourself, you little bastard lazy punk shit  <<<<<========== $RESET"

exit
