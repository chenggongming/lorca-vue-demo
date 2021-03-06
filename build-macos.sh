#!/bin/sh

APP="lorca-vue.app"
mkdir -p $APP/Contents/{MacOS,Resources}

if [ ! -d "./dist/" ];then
  npm run build
fi

go build -ldflags "-X main.SOURCE_DIR=../Resources/html" -o $APP/Contents/MacOS/lorca-vue

cat > $APP/Contents/Info.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleExecutable</key>
	<string>lorca-vue</string>
	<key>CFBundleIconFile</key>
	<string>icon.icns</string>
	<key>CFBundleIdentifier</key>
	<string>com.cnbattle.lorca.vue</string>
</dict>
</plist>
EOF
cp icons/icon.icns $APP/Contents/Resources/icon.icns
cp -r dist/* $APP/Contents/Resources/html
find $APP
