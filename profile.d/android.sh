android_paths=
export ANDROIDPATH=/usr/local/android-sdk

# Add Android SDK to path.
if [ -e $ANDROIDPATH ]; then
    # Android's sqlite3 doesn't have readline support, so make sure we're using
    # an installed version before adding Android to PATH.
    sqlite3=`which sqlite3`
    if [ -f "$sqlite3" ]; then
        alias sqlite3="$sqlite3"
    fi
    PATH=$ANDROIDPATH/platform-tools:$PATH
    PATH=$ANDROIDPATH/tools:$PATH
fi
