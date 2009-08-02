#!/bin/sh
VER=`svnversion | sed -n 's/\(.*:\)*\([0-9]*\)M/\2/ p'`
if [ -n "$VER" ]; then
let VER=$VER+1
sed -i '' '
/<key>CFBundleVersion<\/key>\s*/ {
    n
    s/\([^<]*<string>\)[^<]*/\1'$VER'/
}' Info.plist
fi

