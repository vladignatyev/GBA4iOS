#!/bin/sh
PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"
OUTPUTDIR="$PWD/build/Enterprise-iphoneos"

echo $PWD
echo $OUTPUTDIR

mkdir /Users/travis/build/vladignatyev/GBA4iOS/build/Enterprise-iphoneos/ipa

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`

read -r -d '' RELEASE_NOTES <<- EOM
  RELEASE NOTES
  =============
  Build: $TRAVIS_BUILD_NUMBER
  Release date: $RELEASE_DATE

  Repo: $TRAVIS_REPO_SLUG
  Branch: $TRAVIS_BRANCH
  Commit: $TRAVIS_COMMIT

  System info
  -----------
  TRAVIS_XCODE_SDK: $TRAVIS_XCODE_SDK
  TRAVIS_XCODE_SCHEME: $TRAVIS_XCODE_SCHEME
  TRAVIS_XCODE_PROJECT: $TRAVIS_XCODE_PROJECT
  TRAVIS_XCODE_WORKSPACE: $TRAVIS_XCODE_WORKSPACE
EOM

echo $RELEASE_NOTES > $OUTPUTDIR/ipa/notes.txt

echo $OUTPUTDIR/ipa/notes.txt

xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/ipa/$APP_NAME - $TRAVIS_BUILD_NUMBER.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"
