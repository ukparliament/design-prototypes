#! /usr/bin/env bash

IMAGE=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMPFILE=$(mktemp)
cat $DIR/task-definition.json   | sed -e s/\{\{IMAGE\}\}/$IMAGE/ /\
                                | sed -e s/\{\{APP_NAME\}\}/$APP_NAME/ /\
                                | sed -e s/\{\{AWS_REGION\}\}/$AWS_REGION/ /\
                                > $TMPFILE
aws ecs register-task-definition --cli-input-json file://$TMPFILE
rm $TMPFILE
