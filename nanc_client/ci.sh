version="v0.0.0+0"

extract_version() {
  file_path="$1"
  version=$(grep 'version:' "$file_path" | awk '{ print $2 }' | awk -F'+' '{ printf "v%s+%s", $1, $2 }')
}

extract_version ./pubspec.yaml

echo "Starting build $version"

run_cleaning() {
  flutter clean
  flutter pub get
  flutter pub run build_runner build --delete-conflicting-outputs

  echo "Clearing completed"
}

build_web() {
  flutter build web \
  --no-pub \
  --web-renderer canvaskit \
  --dart2js-optimization=O2 \
  --dart-define=ANALYTICS_KEY="$NANC_ANALYTICS_KEY" \
  --dart-define=ANALYTICS_PROJECT=client_web \
  --no-tree-shake-icons

  echo "Web build completed"

  cp -R ./build/web/ "$NANC_MOBILE"
  cd "$NANC_MOBILE" || exit
  git add .
  git commit -m "Release $version"
  git push

  echo "Web build deployed"
}

build_apk() {
  flutter build apk \
  --no-pub \
  --target-platform="android-arm64" \
  --bundle-sksl-path flutter_01.sksl.json

  echo "Apk build completed"

  mv ./build/app/outputs/flutter-apk/app-release.apk "$APPS_BUILDS_DIR/nanc_demo_app_${version}.apk"

  echo "Apk build moved to builds folder"
}

build_bundle() {
  flutter build appbundle \
  --no-pub \
  --target-platform="android-arm64" \
  --dart-define=ANALYTICS_KEY="$NANC_ANALYTICS_KEY" \
  --dart-define=ANALYTICS_PROJECT=client_android

  echo "App bundle build completed"

  mv ./build/app/outputs/bundle/release/app-release.aab "$APPS_BUILDS_DIR/nanc_demo_app_${version}.aab"

  echo "App bundle moved to builds folder"
}

if [[ "$*" == *"--all"* ]]; then
  run_cleaning
  build_web
  build_apk
  build_bundle
  echo "All jobs done!"
  exit
fi

[[ "$*" == *"--clear"* ]] && run_cleaning
[[ "$*" == *"--web"* ]] && build_web
[[ "$*" == *"--apk"* ]] && build_apk
[[ "$*" == *"--bundle"* ]] && build_bundle

echo "Selected jobs done!"
