#!/bin/bash

GOPATH=$HOME/go
PROJECTNAME="newsdesk-backend"
PROJECTFULLNAME=github.com/Benzinga/$PROJECTNAME

git config --global url."git@github.com:".insteadOf "https://github.com/"

if [[ $1 = "--full" ]] 
then
    rm -r -f $GOPATH/src/$PROJECTFULLNAME | rm -r -f $GOPATH/src/github.com/Benzinga/content-engine
    git clone -b garrett https://github.com/kgorbunov/$PROJECTNAME $GOPATH/src/$PROJECTFULLNAME
    git clone https://github.com/kgorbunov/content-engine $GOPATH/src/github.com/Benzinga/content-engine
    cp ~/configs/config.json / $GOPATH/src/$PROJECTFULLNAME
    cd $GOPATH/src/$PROJECTFULLNAME
else
    cd $GOPATH/src/$PROJECTFULLNAME
    git pull origin/garrett
fi

killall $PROJECTNAME
rm $GOPATH/bin/$PROJECTNAME
go build -o $GOPATH/bin/$PROJECTNAME
nohup $GOPATH/bin/$PROJECTNAME &#!/bin/bash
