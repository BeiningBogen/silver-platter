#!/bin/bash

#User input

EXAMPLEPROJECT=example-project
PROJECTPATH=$HOME/Documents
PROJECTNAME=Grr
PROJECTDIR=$PROJECTPATH/$PROJECTNAME


#Copy procedure
mkdir $PROJECTDIR

#Main target
cp -r $EXAMPLEPROJECT/___PROJECTNAME___ $PROJECTDIR/$PROJECTNAME

#Api target
mkdir $PROJECTDIR/$PROJECTNAME'Api'
cp -r $EXAMPLEPROJECT/___PROJECTNAME___Api/network $PROJECTDIR/$PROJECTNAME'Api'/network
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

#Replace ___X___ in file content
find $PROJECTDIR -type f \( -name \*.swift -o -name \*.h -o -name \Podfile -o -name \*.xcworkspacedata -o -name \*.xcscheme -o -name \*.pbxproj \) -print0 | xargs -0 sed -i '' 's/___PROJECTNAME___/'$PROJECTNAME'/g'
