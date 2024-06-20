#!/usr/bin/env bash
# shellcheck disable=SC2016

trap 'rm -rf "$TMPDIR"' EXIT
TMPDIR=$(mktemp -d) || exit 1

rm -rf ./package/qca/shortcut-fe
rm -rf ./package/turboacc
if [ ! -z "./package/turboacc" ];then
    mkdir -p ./package/turboacc
fi

git clone --depth=1 --single-branch https://github.com/fullcone-nat-nftables/nft-fullcone "$TMPDIR/turboacc/nft-fullcone" || exit 1
git clone --depth=1 --single-branch https://github.com/chenmozhijin/turboacc "$TMPDIR/turboacc/turboacc" || exit 1
if [[ $# = 2 ]] && [[ $1 = "update" ]]; then
    mkdir -p "$TMPDIR/package"
    cp -RT "$2" "$TMPDIR/package" || exit 1
    echo "get the package from $2"
else
    git clone --depth=1 --single-branch --branch "package" https://github.com/chenmozhijin/turboacc "$TMPDIR/package" || exit 1
fi
cp -r "$TMPDIR/turboacc/turboacc/luci-app-turboacc" "$TMPDIR/turboacc/luci-app-turboacc"
rm -rf "$TMPDIR/turboacc/turboacc"
#cp -r "$TMPDIR/package/shortcut-fe" "$TMPDIR/turboacc/shortcut-fe"


cp -rf "$TMPDIR/turboacc" "./package"

echo "Finish"
exit 0