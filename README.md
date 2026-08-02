# Custom apps for a self built GrapheneOS image

Each directory holds one app: a Soong module that imports its prebuilt apk, the
privileged permission whitelist it needs, and a script that rebuilds the apk
from source.

Building an app from source, from the root of the OS tree:

    external/rokuz-apps/LibrePods/build.sh

Adding the app to the image is done in the platform_build fork, by listing the
module name in target/product/handheld_system_ext.mk
