#!/usr/bin/env bash
set -euo pipefail

# Netlify-friendly Flutter build script
# - clones Flutter SDK into $HOME/flutter if absent (cached between builds when configured)
# - exposes flutter on PATH
# - runs flutter pub get and builds the web release into build/web

# adjust channel or tag if you need a different Flutter version
FLUTTER_CHANNEL=stable
FLUTTER_DIR="$HOME/flutter"

echo "==> Using FLUTTER_DIR=$FLUTTER_DIR"

if [ ! -d "$FLUTTER_DIR" ]; then
  echo "==> Cloning Flutter $FLUTTER_CHANNEL into $FLUTTER_DIR"
  git clone https://github.com/flutter/flutter.git -b "$FLUTTER_CHANNEL" --depth 1 "$FLUTTER_DIR"
else
  echo "==> Reusing existing Flutter in $FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

echo "==> Flutter version"
flutter --version

# If your Flutter project is in a subfolder, cd into it here, e.g.
# cd path/to/flutter_project

echo "==> Disabling analytics and precaching web artifacts"
flutter config --no-analytics
flutter precache --web

echo "==> Resolving pub dependencies"
flutter pub get

echo "==> Building Flutter web release"
flutter build web --release

echo "Built to build/web"
