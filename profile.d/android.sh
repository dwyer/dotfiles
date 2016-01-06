if [ $(uname) = 'Darwin' ]; then
    ANDROID_HOME="$HOME/Library/Android/sdk"
fi

if [ -d "$ANDROID_HOME" ]; then
    PATH="$PATH:$ANDROID_HOME/tools"
    PATH="$PATH:$ANDROID_HOME/platform-tools"
    # Android's sqlite3 doesn't have readline support, so make sure we're using
    # an installed version before adding Android to PATH.
    sqlite3=`which sqlite3`
    if [ -f "$sqlite3" ]; then
        alias sqlite3="$sqlite3"
    fi
else
    unset ANDROID_HOME
fi

