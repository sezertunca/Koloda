#!/bin/bash
set -e

if [ ! "$#" -eq 1 ]
then
    echo "Please provide the release number"
    echo "Usage: $0 <release version>"
    # echo "Example: $0 1.0.1"
    exit 1
fi

# COMPONENT_NAME=$1
RELEASEVERSION=$1

# Echo the release version
echo "Releasing version $RELEASEVERSION"

DIRECTORY=`dirname $0`

# Tag the repo and push it
$DIRECTORY/tag_and_push.sh $RELEASEVERSION
