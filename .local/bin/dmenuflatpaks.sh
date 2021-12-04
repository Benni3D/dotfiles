#!/bin/sh

flatpak list --app | awk -F'\t' '{printf "%-30s,%s\n", $1, $2}' | sort | dmenuconfig.sh "Flatpaks" - "flatpak run"

