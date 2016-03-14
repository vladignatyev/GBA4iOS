#!/bin/sh
PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"
OUTPUTDIR="$PWD/build/Enterprise-iphoneos"

mkdir /Users/travis/build/vladignatyev/GBA4iOS/build/Enterprise-iphoneos/ipa

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`

read -r -d '' RELEASE_NOTES <<- EOM
  RELEASE NOTES\r\n
  =============\r\n
  Build: $TRAVIS_BUILD_NUMBER\r\n
  Release date: $RELEASE_DATE\r\n
\r\n
  Repo: $TRAVIS_REPO_SLUG\r\n
  Branch: $TRAVIS_BRANCH\r\n
  Commit: $TRAVIS_COMMIT\r\n
EOM

echo $RELEASE_NOTES > "$OUTPUTDIR/ipa/notes - $TRAVIS_BUILD_NUMBER.txt"

xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/ipa/$APP_NAME - $TRAVIS_BUILD_NUMBER.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"
