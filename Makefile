help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  -  init      to setup project"
	@echo "  -  install   to install all dependencies"

PODSROOT=./Pods
BUNDLE=bundle
CARTHAGE=carthage

init: brew-install install git-hook

brew-install: brew_update carthage_install license_plist_install

install: bundle_install pod_install carthage_bootstrap

# Brew

brew_update:
	brew update

# Bundler

gem_install:
	gem install bundler

bundle_install:
	$(BUNDLE) install --path=vendor/bundle --jobs 4 --retry 3

# CocoaPods

pod_install:
	$(BUNDLE) exec pod install

pod_update:
	$(BUNDLE) exec pod update

# Carthage

carthage_install:
	brew install carthage

carthage_bootstrap:
	$(CARTHAGE) bootstrap --platform iOS --cache-builds --no-use-binaries

carthage_update:
	$(CARTHAGE) update --platform iOS --cache-builds --no-use-binaries

# lint

lint:
	$(PODSROOT)/SwiftLint/swiftlint

git-hook:
	cp ./Scripts/pre-commit.sh .git/hooks/pre-commit
	chmod a+x .git/hooks/pre-commit

# license_plist

license_plist_install:
	brew install mono0926/license-plist/license-plist

license_plist:
	./Scripts/license-plist.sh