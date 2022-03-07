#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://repo1.maven.org/maven2/ch/qos/reload4j/reload4j

dl_ver() {
    local ver=$1
    local file=reload4j-${ver}.jar
    local lfile=$DIR/$file
    local url=$MIRROR/$ver/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl_ver ${1:-1.2.19}
