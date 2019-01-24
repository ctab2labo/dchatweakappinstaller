#!/bin/bash

# Tweaked App Installer
# ver 0.0.1
# by A_One_Of_Fan
	clear
#条件処理
function ConfirmExecution() {

echo " _____                    _            _       _"
echo "|_   _|_      _____  __ _| | _____  __| |     / \   _ __  _ __"
echo "  | | \ \ /\ / / _ \/ _' | |/ / _ \/ _' |    / _ \ | '_ \| '_ \\"
echo "  | |  \ V  V /  __/ (_| |   <  __/ (_| |   / ___ \| |_) | |_) |"
echo "  |_|   \_/\_/ \___|\__,_|_|\_\___|\__,_|  /_/   \_\ .__/| .__/"
echo "                                                   |_|   |_|"
echo "                     ___           _        _ _"
echo "                    |_ _|_ __  ___| |_ __ _| | | ___ _ __"
echo "                     | || '_ \/ __| __/ _  | | |/ _ \ '__|"
echo "                     | || | | \__ \  | (_| | | |  __/ |"
echo "                    |___|_| |_|___/\__\__,_|_|_|\___|_|"
echo "                                                         v0.0.1"
echo "※注意: 1.android-adb-toolsのインストールが前提となっています"
echo "   　　2.APTパッケージマネージャーのみサポートしています"
echo ""
echo " 実行するなら y キャンセルするなら n を入力してください"
	read input

  if [ -z $input ] ; then

    ConfirmExecution

  elif [ $input = 'y' ] ; then

    echo " 実行します"

  elif [ $input = 'n' ] ; then

    echo " キャンセルされました"
    exit 1

  else
    clear
    echo " yまたは n を入力して下さい"
    ConfirmExecution

  fi

}

# y 選択時の処理
	ConfirmExecution

# デバイスの接続チェック(工事中)

# インストールブロックの解除
	echo "インストールブロックを解除中..."
	adb shell content update --uri content://settings/secure --where 'name=\"install_non_market_apps\"' --bind value:i:1

#Wifiの接続を確認(工事中)

# アプリDL
	echo "アプリのインストールを開始します"
# 一時的なフォルダの作成
	mkdir temp
	cd ./temp
	echo "Yalp Storeをダウンロード中..."
	wget https://f-droid.org/repo/com.github.yeriomin.yalpstore_45.apk
	echo "システムUI改造ツールをダウンロード中..."
	wget http://squidsky.ml/cdn/installer/dchatweak/SystemUITweaker.apk
	echo "専用ブラウザーをダウンロード中..."
	wget http://squidsky.ml/cdn/installer/dchatweak/ChuZemiBrowser.hacked.apk
	echo "インストールを開始します"
	adb install *
	echo "インストールが終わりました"
	echo "一時ファイルを消去します..."
	cd ..
	rm -rf temp/
	
exit 0
