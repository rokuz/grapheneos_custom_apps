#!/bin/bash
set -o errexit -o nounset -o pipefail

# Builds LibrePods from source and refreshes the prebuilt apk used by the image.
# Source: https://github.com/rokuz/librepods branch system-app

readonly src=${LIBREPODS_SRC:-$HOME/Dev/librepods}
readonly here=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export ANDROID_HOME=${ANDROID_HOME:-$HOME/Android/Sdk}
export JAVA_HOME=${JAVA_HOME:-$HOME/Dev/grapheneos17/prebuilts/jdk/jdk21/linux-x86}
export PATH="$JAVA_HOME/bin:$PATH"

cd "$src/android"
./gradlew :app:assembleFossRelease --no-daemon

cp app/build/outputs/apk/foss/release/app-foss-release-unsigned.apk \
    "$here/prebuilt/LibrePods.apk"

echo "updated $here/prebuilt/LibrePods.apk"
