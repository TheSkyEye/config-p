#!/bin/sh
set -e
VERATARURL='http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=veracrypt&DownloadId=1372347&FileTime=130649793702230000&Build=20959'
VERASIGURL='http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=veracrypt&DownloadId=1372354&FileTime=130649793743570000&Build=20959'
VERASIGID=54DDD393
VERABIN=veracrypt-1.0f-1-setup-console-x64
VERATMP=$(mktemp -d)
VERAINST=/opt/veracrypt
mkdir -pv $VERAINST
gpg --list-keys "$VERASIGID" || exit 1
test -f veracrypt-setup.tar.bz2 || \
    wget --no-clobber -O veracrypt-setup.tar.bz2 "$VERATARURL"
test -f veracrypt-setup.sig || \
    wget --no-clobber -O veracrypt-setup.sig "$VERASIGURL"
gpg --verify veracrypt-setup.sig veracrypt-setup.tar.bz2 || exit 1
mkdir -p $VERATMP/installer
tar -xf veracrypt-setup.tar.bz2 -C $VERATMP
$VERATMP/$VERABIN --nox11 --noexec --target $VERATMP/installer/
VERASTART=$(sed -n 's/.*PACKAGE_START=\([0-9]*\).*/\1/p' $VERATMP/installer/*)
tail -n +$VERASTART $VERATMP/installer/* > $VERATMP/installer.tar
tar -xf $VERATMP/installer.tar --strip-components 1 -C $VERAINST
test -n "$VERATMP" && test -d "$VERATMP" && rm -rvf $VERATMP
