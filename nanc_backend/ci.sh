#flutter clean
#flutter pub get
#flutter pub run build_runner build --delete-conflicting-outputs

flutter build web \
--no-pub \
--web-renderer canvaskit \
--dart2js-optimization=O1 \
--dart-define=ANALYTICS_KEY="$NANC_ANALYTICS_KEY" \
--dart-define=ANALYTICS_PROJECT=cms_nui \

cp -R ./build/web/ "$NANC_NUI" || exit
cd "$NANC_NUI" || exit
git add .
git commit -m "nanc nui-cms release"
git push
echo "Job done!"