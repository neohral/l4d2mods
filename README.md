# l4d2mods

## 概要

Left 4 dead 2で12人coop用のプラグイン、設定ファイルをまとめて入れる（ついでに難易度ぶち上げ）

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

l4d2serverに `pakkage.sh` の結果で出力されたディレクトリを入れる

- [sourcemod](https://www.sourcemod.net/downloads.php):前提mod
- [metamod](https://www.metamodsource.net/downloads.php?branch=stable):前提mod
- [left4dhooks](https://forums.alliedmods.net/showthread.php?t=321696):前提mod
- [stripper](https://github.com/fbef0102/Game-Private_Plugin/blob/main/Tutorial_%E6%95%99%E5%AD%B8%E5%8D%80/English/Server/Install_Other_File#stripper):前提mod 
- [l4dtoolz](https://github.com/fbef0102/Game-Private_Plugin/blob/main/Tutorial_%E6%95%99%E5%AD%B8%E5%8D%80/English/Server/Install_Other_File#l4dtoolz):人数リミット追加  
- [l4d2_8_slots_lobby](https://github.com/fbef0102/Game-Private_Plugin/releases/tag/file):8スロットのロビー 
- [l4dinfectedbots](https://github.com/fbef0102/L4D1_2-Plugins/tree/master/l4dinfectedbots): 特殊感染者のリミット解除
- [l4dmultislots](https://github.com/fbef0102/L4D1_2-Plugins/tree/master/l4dmultislots):botを追加するやつ  
    - [CreateSurvivorBot](https://forums.alliedmods.net/showpost.php?p=2729883&postcount=16):前提mod  
    - [multicolor](https://github.com/fbef0102/L4D1_2-Plugins/releases/tag/Multi-Colors):前提mod 
- [l4d2_guncontrol](https://forums.alliedmods.net/showthread.php?p=1020236):弾薬管理とか
- [AutoTakeOver](https://github.com/fbef0102/L4D1_2-Plugins/tree/master/_AutoTakeOver):死んだあと別のbotに転生
- [l4d2_incapped_crawling](https://forums.alliedmods.net/showthread.php?p=1291588):ダウン中に動けるように  
- [l4d2_lethal](https://forums.alliedmods.net/showpost.php?p=2686359&postcount=91):スナイパーでチャージショット  
- [Charger_Collision_patch](https://github.com/LuxLuma/Left-4-fix/tree/master):マルチバグ修正系  
    - [SourceScramble](https://github.com/nosoop/SMExt-SourceScramble):前提mod(0.7.1.4)
- [Defib_Fix](https://forums.alliedmods.net/showthread.php?t=315483):マルチバグ修正系  
- [FixChangelevel](https://github.com/Target5150/MoYu_Server_Stupid_Plugins/tree/master/The%20Last%20Stand/l4d2_fix_changelevel):マルチバグ修正系 
- [l4d_survivor_identity_fix](https://forums.alliedmods.net/showpost.php?p=2718792&postcount=36):マルチバグ修正系  
- [l4dafkfix_deadbot](https://github.com/fbef0102/L4D1_2-Plugins/tree/master/l4dafkfix_deadbot):マルチバグ修正系  
- [lfd_both_fixUpgradePack](https://github.com/fbef0102/L4D2-Plugins/tree/master/lfd_both_fixUpgradePack):マルチバグ修正系  
- [survivor_afk_fix](https://forums.alliedmods.net/showthread.php?t=326742):マルチバグ修正系  
- [witch_prevent_target_loss](https://github.com/LuxLuma/Left-4-fix/tree/master/left%204%20fix/witch/witch_target_patch):マルチバグ修正系  
- [l4d2_ty_saveweapons](https://github.com/fbef0102/L4D2-Plugins/tree/master/l4d2_ty_saveweapons):マルチバグ修正系  
    - [l4d_heartbeat](https://github.com/fbef0102/L4D1_2-Plugins/tree/master/l4d_heartbeat):ライフ数と白黒ステータスの調整mod(前提mod)
- [zenomServerBase](mods/zenomServerBase):cfgや起動バッチの設定をまとめて入れておく(mods.txtの一番下にすることで設定ファイルを上書きする)

#### サーバ系の設定をする。
left4dead2/cfgをだいたい設定あります

- [server.cfg](mods/zenomServerBase/cfg/server.cfg)
- [l4dmultislots.cfg](mods/zenomServerBase/cfg/sourcemod/l4dmultislots.cfg)
    - 開始時のbot数などを設定
- [coop.cfg](mods/zenomServerBase/addons/sourcemod/data/l4dinfectedbots/coop.cfg)
    - coopモードの特殊感染者の数を設定
- [motd.txt](mods/zenomServerBase/motd.txt)

#### start.batを起動する。

起動オプションを設定し、srcds.exeを起動するやつ。

- [start.bat](mods/zenomServerBase/start.bat)

| 起動オプション            | 概要                | 設定値               |
| ------------------ | ----------------- | ----------------- |
| -autoupdate        | 起動時にアップデートチェックをする |                   |
| -console           | CUIコンソールで起動する     |                   |
| +hostport          | IPポート番号を指定する      | 27016             |
| +map "マップ名 ゲームモード" | マップとゲームモードを指定     | "c1m1_hotel coop" |
| +maxplayers        | サバイバー+特殊感染者になるっぽい | **32**            |

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
    - https://github.com/fbef0102/Game-Private_Plugin/tree/main/Tutorial_%E6%95%99%E5%AD%B8%E5%8D%80/English/Game/L4D2/8%2B_Survivors_In_Coop  
    - https://github.com/fbef0102/L4D1_2-Plugins/tree/master
    - https://github.com/fbef0102/L4D2-Plugins

- これも参考にしました。  
    - https://github.com/wyxls/SourceModPlugins-L4D2


