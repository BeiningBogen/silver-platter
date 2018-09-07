DOCUMENTS_DIR = ~/Documents
PROJECT_NAME = test-project
PROJECT_DIR = $(DOCUMENTS_DIR)/$(PROJECT_NAME)
EXAMPLE_PROJECT = example-project

GENERATED_PROJECT_NAME = Lol

install:
	rm -rf $(PROJECT_DIR)
	mkdir $(PROJECT_DIR)

	#Main target
	cp -r $(EXAMPLE_PROJECT)/___PROJECTNAME___ $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)

	#Api target
	mkdir $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Api
	cp -r $(EXAMPLE_PROJECT)/___PROJECTNAME___Api/network $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Api/network
	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___Api/___PROJECTNAME___Api.h $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Api/$(GENERATED_PROJECT_NAME)Api.h
	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___Api/Info.plist $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Api/Info.plist

	#Framework target
	mkdir $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Framework
	cp -r $(EXAMPLE_PROJECT)/___PROJECTNAME___Framework/Library $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Framework/Library

	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___Framework/___PROJECTNAME___Framework.h $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Framework/$(GENERATED_PROJECT_NAME)Framework.h
	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___Framework/Info.plist $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Framework/Info.plist

	#Test target
	cp -r $(EXAMPLE_PROJECT)/___PROJECTNAME___Tests $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME)Tests

	#Proj
	mkdir $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj
	cp -r $(EXAMPLE_PROJECT)/___PROJECTNAME___.xcodeproj/project.xcworkspace $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/project.xcworkspace
	mkdir $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/xcshareddata
	mkdir $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/xcshareddata/xcschemes

	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___.xcodeproj/xcshareddata/xcschemes/___PROJECTNAME___Api.xcscheme $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/xcshareddata/xcschemes/$(GENERATED_PROJECT_NAME)Api.xcscheme

	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___.xcodeproj/xcshareddata/xcschemes/___PROJECTNAME___.xcscheme $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/xcshareddata/xcschemes/$(GENERATED_PROJECT_NAME).xcscheme

	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___.xcodeproj/xcshareddata/xcschemes/___PROJECTNAME___Framework.xcscheme $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/xcshareddata/xcschemes/$(GENERATED_PROJECT_NAME)Framework.xcscheme

	mkdir $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/xcuserdata

	cp $(EXAMPLE_PROJECT)/___PROJECTNAME___.xcodeproj/project.pbxproj $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcodeproj/project.pbxproj

	#Workspace
	cp -r $(EXAMPLE_PROJECT)/___PROJECTNAME___.xcworkspace $(PROJECT_DIR)/$(GENERATED_PROJECT_NAME).xcworkspace

	#POD
	cp $(EXAMPLE_PROJECT)/Podfile $(PROJECT_DIR)/Podfile

	#Replace ___X___ in file content
	find $(PROJECT_DIR) -type f \( -name \*.swift -o -name \*.h -o -name \Podfile -o -name \*.xcworkspacedata -o -name \*.xcscheme -o -name \*.pbxproj \) -print0 | xargs -0 sed -i '' 's/___PROJECTNAME___/$(GENERATED_PROJECT_NAME)/g'

uninstall:
	rm -rf $(PROJECT_DIR)
