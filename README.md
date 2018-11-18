# Z80 I/Oボード (KZ80-IOB)

詳細は[以下のwiki](https://github.com/kuninet/Z80_IOB/wiki)にまとめます。
ご覧ください。

https://github.com/kuninet/Z80_IOB/wiki

*☆本ボードは基板を試作して確認中です。参考程度にご覧ください。*

## 概要

- SBC8080ルーズキットバスにつながるI/Oボードです。
  - [Z80 CPUボード(KZ80-CPUB)](https://github.com/kuninet/Z80_CPUB/wiki)、[SBC8080](https://vintagechips.wordpress.com/2018/06/24/sbc8080-cpu%E3%83%AB%E3%83%BC%E3%82%BA%E3%82%AD%E3%83%83%E3%83%88/)、[SBC8085](https://vintagechips.wordpress.com/2018/08/27/sbc8085%e3%81%8c%e5%ae%8c%e6%88%90/)と組み合わせた稼働を確認しています。
  - 8255パラレルI/O LSIを搭載しています。(Lチカに最適)
  - 8251シリアルチップを搭載しています。
  - 将来 ArduinoコネクタのFM音源シールドを搭載するためのコネクタを装備しています。(これ以外の使いみちはありませんが...)

## 回路図

[回路図はこちら](image/Z80-8251-PPI.pdf)です。

## 部品表

[部品表はこちら](KiCAD/Z80-8251-PPI.ods)です。

※LibreOffice/OpenOfficeのcalcで開ける形式となっています。

## ライセンス

- 本リポジトリのデータは MIT License のもとで公開します。[LICENSE.txt](LICENSE.txt)を参照して下さい。

## その他注意点等

- 8251シリアルLSIのアドレスデコードをSBC8080 SUBボードと合わせる場合は、アドレスデコードジャンパ(J2)の1-2を短絡(I/Oアドレス:00h)してください。
- 8255パラレルI/O LSIのアドレスデコードジャンパ(J3)は 13-14を短絡(I/Oアドレス:C0h)が推奨です。

