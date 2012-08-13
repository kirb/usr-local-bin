#!/bin/bash
# MobileSubstrate Dylib Disabler
# By Ad@m <http://hbang.ws>
# Licensed under the MIT License <http://adam.mit-license.org>
if [[ "$1" == "" || "$1" == "--help" ]]; then
	echo "Usage: $(basename "$0") <dylib name>"
	exit 1
elif [[ "$1" == "MobileSafety" ]]; then
	echo "Cowardly refusing to enable/disable MobileSafety">&2
elif [[ -f "/Library/MobileSubstrate/DynamicLibraries/$1.dylib" ]]; then
	mv "/Library/MobileSubstrate/DynamicLibraries/$1.dylib" "/Library/MobileSubstrate/DynamicLibraries/$1.disabled"&&echo "$1 disabled."
elif [[ -f "/Library/MobileSubstrate/DynamicLibraries/$1.disabled" ]]; then
	mv "/Library/MobileSubstrate/DynamicLibraries/$1.disabled" "/Library/MobileSubstrate/DynamicLibraries/$1.dylib"&&echo "$1 enabled."
else
	echo "Dylib not found">&2
	exit 2
fi
