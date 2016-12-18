# LaiNES - suzukiplan edition 
- これは, [LaiNES](https://github.com/AndreaOrru/LaiNES) を SUZUKI PLAN で カスタム しているモノです
- [LaiNES](https://github.com/AndreaOrru/LaiNES)からプラットフォーム依存レイヤを分離するカスタマイズをしています
- about [LaiNES](https://github.com/AndreaOrru/LaiNES): [README-original.md](README-original.md)
- プラットフォーム依存レイヤの実装例: [Android](https://github.com/suzukiplan/nes-view-android)

## 本家との違い
- これ単体では動きません
- SDLは不要です
- デフォルトのパレットのカラーを16bitカラーにしています
  - コンパイル時に `-DUSE_32BIT_COLOR` を指定すれば 32bit になります
- `Cartridge::load` をファイルからではなくメモリから読み込む仕様に変更しています
- 使い方: [test.cpp](test.cpp)を参照
- [test.cpp](test.cpp) は コマンドライン上で読み込んだromファイルを60フレーム実行するサンプルです

以下, 適当なromファイルを読み込んで実行してみた結果です
```
$ ./a.out ~/test.nes 
loading
execute 1 frame
new_frame: 0x10c0d1300
execute 1 frame
new_frame: 0x10c0d1300
execute 1 frame
new_frame: 0x10c0d1300
new_samples: 0x10c0ce100, 4096
execute 1 frame
new_frame: 0x10c0d1300
get_joypad_state: 0
get_joypad_state: 1
execute 1 frame
new_frame: 0x10c0d1300
execute 1 frame
new_frame: 0x10c0d1300
new_samples: 0x10c0ce100, 4096
execute 1 frame
new_frame: 0x10c0d1300
get_joypad_state: 0
get_joypad_state: 1
execute 1 frame
new_frame: 0x10c0d1300
get_joypad_state: 0
get_joypad_state: 1
new_samples: 0x10c0ce100, 4096
execute 1 frame
（以下略）
```

memo:
- 映像フレームのコールバック (new_frame) は 毎フレーム呼ばれる
- 音声フレームのコールバック (new_samples) は 3フレームに1回 (つまり, 50msづつ) 呼ばれる
- ジョイパッドのコールバック (get_joypad_state) は,
  - 恐らく入力受付可能なフレームでのみ呼ばれる
  - 1P, 2Pセット（各2回) 呼ばれる
