#!/bin/bash

GOPATH=$HOME/go
PROJECTNAME="newsdesk-frontend"
PROJECTFULLNAME=github.com/Benzinga/$PROJECTNAME

git config --global url."git@github.com:".insteadOf "https://github.com/"

if [[ $1 = "--full" ]]
then
    rm -r -f $GOPATH/src/$PROJECTFULLNAME
    git clone -b garrett https://github.com/kgorbunov/$PROJECTNAME $GOPATH/src/$PROJECTFULLNAME
    cd $GOPATH/src/$PROJECTFULLNAME
    cp $HOME/configs/webpack.development.js $GOPATH/src/$PROJECTFULLNAME/config/
    npm install
else
    cd $GOPATH/src/$PROJECTFULLNAME
    git pull origin/garrett
fi

npm run clean
npm run build
