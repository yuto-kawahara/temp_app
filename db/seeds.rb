# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
EntryCondition.create!(
  [
    {
      name: "初心者歓迎",
      introduction: "初心者の方も安心してご参加ください。"
    },
    {
      name: "多弁禁止",
      introduction: "1人のプレイヤーが話しすぎると議論が進みませんのでご注意ください。"
    },
    {
      name: "強弁禁止",
      introduction: "楽しく遊んでいただくため感情的にならないようにしましょう。"
    },
    {
      name: "PC環境(必須)",
      introduction: "PC環境で遊ぶことを推奨しています。"
    },
    {
      name: "推奨ブラウザ(Chrome)",
      introduction: "ブラウザはChromeを推奨しています。"
    },
    {
      name: "イヤホン/ヘッドセット(必須)",
      introduction: "イヤホン/ヘッドセットが必要になります。"
    },
    {
      name: "キャンセル無効",
      introduction: "やむを得ない場合のキャンセル以外無効となります。"
    },
    {
      name: "マナー重視",
      introduction: "あくまでもゲームを楽しむ場なので感情的にならず皆で楽しもうとする気持ちが必要です。"
    }
  ])

PlayForm.create!(
  [
    {
      name: "Discord"
    },
    {
      name: "ボードゲームアリーナ"
    },
    {
      name: "ユドナリウム"
    },
    {
      name: "ココフォリア"
    },
    {
      name: "その他"
    }
  ])