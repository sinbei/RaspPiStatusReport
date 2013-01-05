RaspPiStatusReport
==================

Report Raspberry Pi's Status via Gmail


## これはなに
Gmailを利用してRaspberry Piの現在の状態を通知するスクリプトです。

適当にcronなどを用いて定期実行するといいかもしれません。

今のところ、現在のチップ温度と現在の動作周波数を通知する事が出来ます。
30分強のやっつけ←


## ひつようなもの

＊Ruby(1.9.3でのみ動作確認済み)

＊RubyGemsでmail,tlsmailをいれたってください

(GemFile書いてくださったtomoariさんありがとうございます)


## 使い方

コード中のアカウント情報を入力してください

YOUR_NAME           : メール本文に記載する送信者名

ADDRESS_FROM        : 送信元アドレス

ADDRESS_TO          : 送信先アドレス

YOUR_GMAIL_ACCOUNT  : 通知メールを送信するGmailアカウントのアカウント名

YOUR_GMAIL_PASS     : 通知メールを送信するGmailアカウントのパスワード


以上を入力し

    $ ruby reportstatus.rb

を実行すればメールが送信されます
