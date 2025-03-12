#!/usr/bin/env bash

APP=brave

# TEMPORARY DIRECTORY
mkdir -p tmp
cd ./tmp || exit 1

# DOWNLOAD APPIMAGETOOL
if ! test -f ./appimagetool; then
	wget -q https://github.com/AppImage/appimagetool/releases/download/continuous/appimagetool-x86_64.AppImage -O appimagetool || exit 1
	chmod a+x ./appimagetool
fi

# CREATE BRAVE BROWSER APPIMAGES

Stable=$(curl -Ls https://api.github.com/repos/brave/brave-browser/releases/latest | sed 's/[()",{} ]/\n/g' | grep -oi "https.*download.*linux.*zip$" | grep -v "symbol")
Releases=$(curl -Ls https://api.github.com/repos/brave/brave-browser/releases?per_page=100 | sed 's/[()",{} ]/\n/g' | grep -oi "https.*download.*linux.*zip$" | grep -v "symbol")
LIST=$(printf "%b\n%b\n" "$Stable" "$Releases" | grep . )
[ -z "$LIST" ] && exit 0
LAUNCHER=$(curl -Ls https://aur.archlinux.org/cgit/aur.git/plain/brave-browser.desktop?h=brave-bin | sed 's/^MimeType=x-scheme-handler/X-MimeType=x-scheme-handler/g')
[ -z "$LAUNCHER" ] && exit 0

_create_brave_appimage() {
	if [ "$CHANNEL" != stable ]; then
		DOWNLOAD_URL=$(echo "$LIST" | grep -i "$CHANNEL.*$archref" | head -1)
	else
		DOWNLOAD_URL=$(echo "$LIST" | grep -v "beta\|nightly" | grep -i "$archref" | head -1)
	fi
	if wget --version | head -1 | grep -q ' 1.'; then
		wget -q --no-verbose --show-progress --progress=bar "$DOWNLOAD_URL" || exit 1
	else
		wget "$DOWNLOAD_URL" || exit 1
	fi
	mkdir "$APP"-"$arch".AppDir
	unzip -qq ./*"$archref".zip -d "$APP"-"$arch".AppDir/ || exit 1
	cd "$APP"-"$arch".AppDir || exit 1
	echo "$LAUNCHER" > brave.desktop
	if [ "$CHANNEL" != stable ]; then
		sed -i "s/Name=Brave/Name=Brave ${CHANNEL^}/g; s/Class=brave-browser/Class=brave-browser-$CHANNEL/g" brave.desktop
	fi
	cp ./*128*.png brave.png
	sed -i "s#Icon=.*#Icon=$APP#g" brave.desktop
	cd .. || exit 1

	VERSION=$(echo "$DOWNLOAD_URL" | tr '/-' '\n' | grep "^[0-9].*" | head -1)

	cat <<-'HEREDOC' >> ./"$APP"-"$arch".AppDir/AppRun
	#!/bin/sh
	HERE="$(dirname "$(readlink -f "${0}")")"
	export UNION_PRELOAD="${HERE}"
	exec "${HERE}"/brave "$@"
	HEREDOC
	chmod a+x ./"$APP"-"$arch".AppDir/AppRun

	ARCH="$arch" ./appimagetool --comp zstd --mksquashfs-opt -Xcompression-level --mksquashfs-opt 20 \
		-u "gh-releases-zsync|$GITHUB_REPOSITORY_OWNER|Brave-appimage|continuous|*$arch.AppImage.zsync" \
		./"$APP"-"$arch".AppDir Brave-Web-Browser-"$CHANNEL"-"$VERSION"-"$arch".AppImage || exit 1
}

_create_brave_appimages() {
	architectures="x86_64 aarch64"
	for arch in $architectures; do
		if [ "$arch" = x86_64 ]; then
			archref="amd64"
		else
			archref="arm64"
		fi
		_create_brave_appimage
	done
}

CHANNEL="stable"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && cd "$CHANNEL" || exit 1
_create_brave_appimages
cd .. || exit 1
mv ./"$CHANNEL"/*.AppImage* ./

CHANNEL="beta"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && cd "$CHANNEL" || exit 1
_create_brave_appimages
cd .. || exit 1
mv ./"$CHANNEL"/*.AppImage* ./

CHANNEL="nightly"
mkdir -p "$CHANNEL" && cp ./appimagetool ./"$CHANNEL"/appimagetool && cd "$CHANNEL" || exit 1
_create_brave_appimages
cd .. || exit 1
mv ./"$CHANNEL"/*.AppImage* ./

cd ..
mv ./tmp/*.AppImage* ./
