#! /usr/bin/env bash

IMAGE=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMPFILE=$(mktemp)
cat $DIR/design-prototypes.json | sed -e s/\{\{IMAGE\}\}/$IMAGE/ > $TMPFILE
aws ecs register-task-definition --cli-input-json file://$TMPFILE
rm $TMPFILE
