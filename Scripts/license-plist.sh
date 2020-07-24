#!/bin/sh

LICENSE_PLIST=/usr/local/bin/license-plist

if [[ -e "${LICENSE_PLIST}" ]]; then
	echo "license-plist..."
else
	echo "license-plist does not exist, download from https://github.com/mono0926/LicensePlist"
	exit 1
fi

${LICENSE_PLIST} --output-path ./WS-iOS-SDK/Settings.bundle
