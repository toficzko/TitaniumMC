#!/usr/bin/env bash

basedir=$1
set -e

patcherDir=$basedir/KibblePatcher
patcherJar=$patcherDir/KibblePatcher.jar
# Get server jar
paperworkdir="$basedir/Paper/work"
mcver=$(cat "$paperworkdir/BuildData/info.json" | grep minecraftVersion | cut -d '"' -f 4)
serverJar="$basedir/Purpur-Server/target/purpur-$mcver.jar"

cd $patcherDir
./gradlew buildRoot

java -jar $patcherJar -yatopia -patch $serverJar