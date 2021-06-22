  
#!/bin/bash

if [ ! "$#" -eq 1 ]
then
    echo "Please provide the release version"
    echo "Usage: $0 <release-version>"
    echo "Example: $0 0.0.3-alpha"
    exit 1
fi

RELEASEVERSION=$1

echo "	>> Creating tag '$RELEASEVERSION'"

if [ $(git tag -l "$RELEASEVERSION") ]; then
	echo "	>>>> [!] '$RELEASEVERSION' tag already exists. Deleting remote tag and re-taging..."
	sleep 5 # give you a chance to cancel
	git tag -d "$RELEASEVERSION"
	git push --delete origin "$RELEASEVERSION"
fi

git tag "$RELEASEVERSION"
git push origin "$RELEASEVERSION"