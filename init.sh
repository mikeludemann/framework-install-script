#!/bin/bash

echo "Checking and installing frameworks"

file=./package.json
apps=./apps.txt

if node -v > /dev/null; then
  if npm -v > /dev/null; then
    echo "installing frameworks"
    if [ -e "$file" ]; then
      echo "File - package.json - exists"
      if [ -e "$apps" ]; then
        echo "File - apps.txt - exists"
        while read -r line
        do
          app=`echo $line | cut -d \; -f 1`
          npm install $app
        done < $apps
      else
        echo "File not exists"
      fi
    else
      echo "File not exists"
      npm init
    fi
  else
    echo "npm is not installed"
  fi
else
  echo "node is not installed"
fi

if curl --version > /dev/null; then
  echo "installing meteor framework"
  curl https://install.meteor.com/ | sh
else
  echo "curl is not installed"
fi
