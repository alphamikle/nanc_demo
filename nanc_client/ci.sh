version="0.0.0+0"

extract_version() {
  file_path="$1"
  version=$(grep 'version:' "$file_path" | awk '{ print $2 }' | awk -F'+' '{ printf "v%s+%s", $1, $2 }')
}

extract_version ./pubspec.yaml

name="nanc_client_installer_${version}"

echo "Build $name"

#flutter clean
#flutter pub get
#flutter pub run build_runner build --delete-conflicting-outputs

#flutter build web \
#--no-pub \
#--web-renderer canvaskit \
#--dart2js-optimization=O1 \
#--dart-define=ANALYTICS_KEY="$NANC_ANALYTICS_KEY" \
#--dart-define=ANALYTICS_PROJECT=client_web \
#--no-tree-shake-icons \

# ? Need to precompile shaders before each build!
# ? https://docs.flutter.dev/perf/shader
#flutter build apk \
#--no-pub \
#--target-platform="android-arm64" \
#--bundle-sksl-path flutter_01.sksl.json \

flutter build appbundle \
--no-pub \
--target-platform="android-arm64" \
--dart-define=ANALYTICS_KEY="$NANC_ANALYTICS_KEY" \
--dart-define=ANALYTICS_PROJECT=client_android \

# ? Copy Android build
#mv ./build/app/outputs/flutter-apk/app-release.apk "$APPS_BUILDS_DIR/$name.apk"
mv ./build/app/outputs/bundle/release/app-release.aab "$APPS_BUILDS_DIR/nanc_client_bundle_${version}.aab"

# ? Copy Web build
#cp -R ./build/web/ "$NANC_MOBILE"
#cd "$NANC_MOBILE" || exit
#git add .
#git commit -m "Release v$version"
#git push

echo "Job done!"