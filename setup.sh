#!/usr/bin/env bash

set -e

DIR_ROOT=$(pwd)
DIR_TMP=tmp

function update_version {
    if [ ! -d $DIR_TMP ]; then
	mkdir -p $DIR_TMP
    else
	rm -rf $DIR_TMP/*
    fi
    cd $DIR_TMP
    VERSION=$(curl -L \
	 -H "Accept: application/vnd.github+json" \
	 -H "X-GitHub-Api-Version: 2022-11-28" \
	 https://api.github.com/repos/vrtulka23/scnt-puq/releases/latest \
		  | sed -n 's/.*"tag_name": "\([^"]*\)".*/\1/p')
    TARBALL="https://github.com/vrtulka23/scnt-puq/archive/refs/tags/${VERSION}.tar.gz"
    wget $TARBALL
    HASH=($(sha256sum ${VERSION}.tar.gz))
    echo $TARBALL
    echo $HASH
}

function install_formula {
    NAME_FORMULA="scnt-${1}"
    FILE_FORMULA="./${NAME_FORMULA}.rb"
    if brew info $NAME_FORMULA &>/dev/null; then
	brew reinstall --build-from-source $FILE_FORMULA
    else
	brew install --build-from-source $FILE_FORMULA
    fi
}

function show_help {
    echo "Physical Units and Quantities"
    echo ""
    echo "Options:"
    echo " -u|--update         update code version"
    echo " -i|--install        install formula"
    echo ""
    echo "Examples:"
    echo "./setup.sh -u"
}

if [[ "${1}" == "" ]]; then
    show_help
fi
while [[ $# -gt 0 ]]; do
    case $1 in
	-u|--update)
	    update_version $2; shift; shift;;
	-i|--install)
	    install_formula $2; shift; shift;;
	-*|--*)
	    show_help; exit 1;;
	*)
	    show_help; shift;;
    esac
done

