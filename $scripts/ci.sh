cd ./nanc_backend || exit
bash ci.sh
cd ../nanc_client || exit
bash ci.sh --all