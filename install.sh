#!/bin/bash

#Delete derived data
read -p "Delete derived data? It is highly recommended. (yes or no) " deleteDerived

if [ $deleteDerived == "y" ] || [ $deleteDerived == "yes" ] ;
then
  rm -rf $HOME'/Library/Developer/Xcode/DerivedData'
fi

#User input
read -p "Project name: " PROJECTNAME
read -e -p "Project path: " PROJECTPATH
#read -e -p "Author: " author

if [[ $PROJECTPATH != *"/" ]] ;
then
    PROJECTPATH="$PROJECTPATH/"
fi

EXAMPLEPROJECT=example-project
PROJECTDIR=$PROJECTPATH$PROJECTNAME

#some prompt before we begin
read -p "Install $PROJECTNAME in $PROJECTDIR ? (yes or no) " yesorno

if [ $yesorno != "y" ] && [ $yesorno != "yes" ] ;
then
  echo "Install cancelled."
  exit 1
fi

echo "Copying xcode template to $PROJECTDIR"

#Copy procedure
mkdir $PROJECTDIR

# Copy github settings
mkdir $PROJECTDIR/'.github'
cp -r './.github/' $PROJECTDIR/'.github'

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
cp -r $EXAMPLEPROJECT/___PROJECTNAME___Framework/valueCell $PROJECTDIR/$PROJECTNAME'Framework'/valueCell

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

#Replace "-" with "_" in imports
sed -i '' '/import/s/\-/\_/g' $PROJECTDIR'/'$PROJECTNAME'Framework/Library/Environment.swift'
sed -i '' '/import/s/\-/\_/g' $PROJECTDIR'/'$PROJECTNAME'/AppDelegate.swift'
sed -i '' '/import/s/\-/\_/g' $PROJECTDIR'/'$PROJECTNAME'Framework/Library/AppEnvironment.swift'

#Replace "-" with "_" in test imports
sed -i '' '/@testable import/s/\-/\_/g' $PROJECTDIR'/'$PROJECTNAME'/example/tableView/Cell/ExampleCellViewModelTests.swift'
sed -i '' '/@testable import/s/\-/\_/g' $PROJECTDIR'/'$PROJECTNAME'/example/tableView/Cell/ExampleCell2ViewModelTests.swift'
sed -i '' '/@testable import/s/\-/\_/g' $PROJECTDIR'/'$PROJECTNAME'/example/ExampleViewModelTests.swift'
sed -i '' '/@testable import/s/\-/\_/g' $PROJECTDIR'/'$PROJECTNAME'/example/tableView/ExampleTableViewModelTests.swift'

#Replace ___FULLUSERNAME___ in file content

#Replace ___DATE___ in file content

#Pod install
cd "$PROJECTDIR"

#Clean project
xcodebuild clean

pod install

#Build targets
xcodebuild -target $PROJECTNAME'Api'
xcodebuild -target $PROJECTNAME'Framework'
xcodebuild -target $PROJECTNAME

#Open workspace
echo "Install complete, opening workspace file."
open $PROJECTDIR'/'$PROJECTNAME'.xcworkspace'
