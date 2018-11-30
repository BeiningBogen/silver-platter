#!/bin/bash

#User input
read -p "Project name: " PROJECTNAME
read -e -p "Project path: " PROJECTPATH
#read -e -p "Author: " author

if [[ $PROJECTPATH != *"/" ]] ;
then
    echo "Please include a '/' at the end of your path."
    exit 1
fi

EXAMPLEPROJECT=example-project
PROJECTDIR=$PROJECTPATH$PROJECTNAME

#some prompt before we begin
read -p "Install $PROJECTNAME in $PROJECTDIR ? " yesorno

if [ $yesorno != "y" ] && [ $yesorno != "yes" ] ;
then
  echo "Install cancelled."
  exit 1
fi

echo "Copying xcode template to $PROJECTDIR"

#Copy procedure
mkdir $PROJECTDIR

#Main target
cp -r $EXAMPLEPROJECT/___PROJECTNAME___ $PROJECTDIR/$PROJECTNAME

#Api target
mkdir $PROJECTDIR/$PROJECTNAME'Api'
cp -r $EXAMPLEPROJECT/___PROJECTNAME___Api/network $PROJECTDIR/$PROJECTNAME'Api'/network
cp -r $EXAMPLEPROJECT/___PROJECTNAME___Api/valueCell $PROJECTDIR/$PROJECTNAME'Api'/valueCell
cp $EXAMPLEPROJECT/___PROJECTNAME___Api/___PROJECTNAME___Api.h $PROJECTDIR/$PROJECTNAME'Api'/$PROJECTNAME'Api'.h
cp $EXAMPLEPROJECT/___PROJECTNAME___Api/Info.plist $PROJECTDIR/$PROJECTNAME'Api'/Info.plist

#Framework target
mkdir $PROJECTDIR/$PROJECTNAME'Framework'
cp -r $EXAMPLEPROJECT/___PROJECTNAME___Framework/Library $PROJECTDIR/$PROJECTNAME'Framework'/Library

cp $EXAMPLEPROJECT/___PROJECTNAME___Framework/___PROJECTNAME___Framework.h $PROJECTDIR/$PROJECTNAME'Framework'/$PROJECTNAME'Framework.h'
cp $EXAMPLEPROJECT/___PROJECTNAME___Framework/Info.plist $PROJECTDIR/$PROJECTNAME'Framework'/Info.plist

#Test target
cp -r $EXAMPLEPROJECT/___PROJECTNAME___Tests $PROJECTDIR/$PROJECTNAME'Tests'

#Proj
mkdir $PROJECTDIR/$PROJECTNAME'.xcodeproj'
cp -r $EXAMPLEPROJECT/___PROJECTNAME___.xcodeproj/project.xcworkspace $PROJECTDIR/$PROJECTNAME'.xcodeproj/project.xcworkspace'
mkdir $PROJECTDIR/$PROJECTNAME'.xcodeproj/xcshareddata'
mkdir $PROJECTDIR/$PROJECTNAME'.xcodeproj/xcshareddata/xcschemes'

cp $EXAMPLEPROJECT/___PROJECTNAME___.xcodeproj/xcshareddata/xcschemes/___PROJECTNAME___Api.xcscheme $PROJECTDIR/$PROJECTNAME'.xcodeproj'/xcshareddata/xcschemes/$PROJECTNAME'Api.xcscheme'

cp $EXAMPLEPROJECT/___PROJECTNAME___.xcodeproj/xcshareddata/xcschemes/___PROJECTNAME___.xcscheme $PROJECTDIR/$PROJECTNAME'.xcodeproj'/xcshareddata/xcschemes/$PROJECTNAME'.xcscheme'

cp $EXAMPLEPROJECT/___PROJECTNAME___.xcodeproj/xcshareddata/xcschemes/___PROJECTNAME___Framework.xcscheme $PROJECTDIR/$PROJECTNAME'.xcodeproj'/xcshareddata/xcschemes/$PROJECTNAME'Framework.xcscheme'

mkdir $PROJECTDIR/$PROJECTNAME'.xcodeproj/xcuserdata'

cp $EXAMPLEPROJECT/___PROJECTNAME___.xcodeproj/project.pbxproj  $PROJECTDIR/$PROJECTNAME'.xcodeproj/project.pbxproj'

#Workspace
cp -r $EXAMPLEPROJECT/___PROJECTNAME___.xcworkspace $PROJECTDIR/$PROJECTNAME'.xcworkspace'

#POD
cp $EXAMPLEPROJECT/Podfile $PROJECTDIR/Podfile

#Replace ___PROJECTNAME___ in file content
find $PROJECTDIR -type f \( -name \*.swift -o -name \*.h -o -name \Podfile -o -name \*.xcworkspacedata -o -name \*.xcscheme -o -name \*.pbxproj \) -print0 | xargs -0 sed -i '' 's/___PROJECTNAME___/'$PROJECTNAME'/g'

#Replace ___FULLUSERNAME___ in file content

#Replace ___DATE___ in file content

#Clean project
xcodebuild clean

#Pod install
cd "$PROJECTDIR"
pod install

#Build targets
xcodebuild -target $PROJECTNAME'Api'
xcodebuild -target $PROJECTNAME'Framework'
xcodebuild -target $PROJECTNAME

#Open workspace
echo "Install complete, opening workspace file."
open $PROJECTDIR'/'$PROJECTNAME'.xcworkspace'
