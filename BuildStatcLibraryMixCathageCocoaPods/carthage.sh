#!/bin/bash
set -euo pipefail

echo "用法：
1.本脚本后面无参数，直接默认：
carthage update --platform iOS --no-use-binaries --cache-builds
2.有参数则等同于carthage命令"
# Make a unique temporary file with mktemp
XCCONFIG=$(mktemp /tmp/static.xcconfig.XXXXXX)

# Perform clean-up on Interrupt, Hang Up, Terminate, Exit signals
trap 'rm -f "$XCCONFIG"' INT TERM HUP EXIT

# Base framework search path
FMWK_SEARCH_PATHS="\$(inherited) ./Carthage/Build/iOS/**"

# For Xcode 12 make sure EXCLUDED_ARCHS is set to arm architectures otherwise
# the build will fail on lipo due to duplicate architectures.
echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64__XCODE_1200 = arm64 arm64e armv7 armv7s' >> $XCCONFIG
echo 'EXCLUDED_ARCHS = $(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT)__XCODE_$(XCODE_VERSION_MAJOR))' >> $XCCONFIG

# Write properties to the temp xconfig file
echo "MACH_O_TYPE = staticlib" >> $XCCONFIG
echo "DEBUG_INFORMATION_FORMAT = dwarf" >> $XCCONFIG
echo "FRAMEWORK_SEARCH_PATHS = $FMWK_SEARCH_PATHS" >> $XCCONFIG

# Echo outcome
echo
echo "Building static frameworks with Xcode temporary xconfig file:"
echo $XCCONFIG
echo
echo "With contents:"
while read line; do
echo "$line"
done < $XCCONFIG

export XCODE_XCCONFIG_FILE="$XCCONFIG"

if [ $# == 0 ];then
    carthage update --platform iOS --no-use-binaries --cache-builds
else
    carthage "$@"
fi
