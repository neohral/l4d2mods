# l4d2mods

## 概要

Left 4 dead 2で10人coop用のプラグイン、設定ファイルをまとめて入れる（ついでに難易度ぶち上げ）

## このリポジトリについて

- packeage.sh  
「mods.txt」のディレクトリをマージして一つのディレクトリにします。  
outputディレクトリが出来るので中身をL4D2のサーバーのインストールディレクトリ入れればおｋ  
上から順番に入れるので、zenomServerBaseに設定ファイルをまとめることで最後に上書きしてる。  
※各mod自体のアプデしても設定ファイル変えなくても上書きされる。

- list.sh  
「mods」の中のディレクトリから「mods.txt」を作る

## L4D2サーバーのインストール方法

### サーバの設定

#### [steamcmd](https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip)をダウンロード

#### SteamCMD.exeを起動しL4D2サーバをインストール

```bash
login anonymous
force_install_dir l4d2server
app_update 222860
exit
```

#### modの追加

l4d2serverにoutputディレクトリの中身を上書きで保存する。


#### サーバ系の設定をする。
left4dead2/cfgをだいたい設定あります

- [server.cfg](mods/zenomServerBase/cfg/server.cfg)
- [l4dmultislots.cfg](mods/zenomServerBase/cfg/sourcemod/l4dmultislots.cfg)
    - 開始時のbot数などを設定
- [coop.cfg](mods/zenomServerBase/addons/sourcemod/data/l4dinfectedbots/coop.cfg)
    - coopモードの特殊感染者の数を設定

#### start.batを起動する。

起動オプションを設定し、srcds.exeを起動するやつ。

- [start.bat](mods/zenomServerBase/start.bat)

| 起動オプション            | 概要                | 設定値               |
| ------------------ | ----------------- | ----------------- |
| -autoupdate        | 起動時にアップデートチェックをする |                   |
| -console           | CUIコンソールで起動する     |                   |
| +hostport          | IPポート番号を指定する      | 27016             |
| +map "マップ名 ゲームモード" | マップとゲームモードを指定     | "c1m1_hotel coop" |
| +maxplayers        |                   | **10**            |

人数増やすなら、太字部分を変える。

#### コンソールから接続

connect `ローカルのIPアドレス`:`ポート`

※ローカルのIPアドレスはループバックアドレス(127.0.0.1)じゃなかった

確認方法はサーバをGUIで起動してIPアドレスのとこに出るやつ

### クライアントからの接続

#### コンソールを有効化する

設定→キーボード→開発者コンソール

#### コンソールから接続

半角キーでコンソールを開く

connect `グローバルのIPアドレス`:`ポート`

## メモ

- ログは`left4dead2\addons\sourcemod\logs`あたりに出てそう
- `meta list`で入っているmodが確認できる(sourcemodのプラグインなどは出ない)

### マップについて

`changelevel mapid`でマップの変更ができる。   
[mapid](https://commands.gg/l4d2/map)でデフォルトのマップIDは確認できる。

## 参考
- だいたいこれ
https://github.com/fbef0102/Game-Private_Plugin/tree/main/Tutorial_%E6%95%99%E5%AD%B8%E5%8D%80/English/Game/L4D2/8%2B_Survivors_In_Coop

- これも参考にしました。
https://github.com/fbef0102/L4D1_2-Plugins/tree/master


