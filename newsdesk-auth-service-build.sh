#!/bin/bash

GOPATH=$HOME/go
PROJECTNAME="newsdesk-auth-service"
PROJECTFULLNAME=github.com/Benzinga/$PROJECTNAME

git config --global url."git@github.com:".insteadOf "https://github.com/"

if [[ $1 = "--full" ]]
then
    rm -r -f $GOPATH/src/$PROJECTFULLNAME
    git clone https://github.com/kgorbunov/$PROJECTNAME $GOPATH/src/$PROJECTFULLNAME
    cd $GOPATH/src/$PROJECTFULLNAME
else
    cd $GOPATH/src/$PROJECTFULLNAME
    git pull origin
fi

killall $PROJECTNAME
rm $GOPATH/bin/$PROJECTNAME
go build -o $GOPATH/bin/$PROJECTNAME
nohup $GOPATH/bin/$PROJECTNAME &
