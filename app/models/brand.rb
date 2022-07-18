class Brand < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'コールマン(Coleman)' },
    { id: 3, name: 'スノーピーク(Snow Peak)' },
    { id: 4, name: 'モンベル(mont-bell)' },
    { id: 5, name: 'ロゴス(LOGOS)' },
    { id: 6, name: 'キャプテンスタッグ(CAPTAIN STAG)' },
    { id: 7, name: 'ザ・ノース・フェイス(THE NORTH FACE)' },
    { id: 8, name: 'チャムス(CHUMS)' },
    { id: 9, name: 'オガワ(ogawa)' },
    { id: 10, name: 'NANGA(ナンガ)' },
    { id: 11, name: 'DOD(ディーオーディー)' },
    { id: 12, name: 'SOTO(ソト)' },
    { id: 13, name: 'ノルディスク(Nordisk)' },
    { id: 14, name: 'MSR(エムエスアール)' },
    { id: 15, name: 'テンマクデザイン(tent-Mark DESIGNS)' },
    { id: 16, name: 'ユニフレーム(UNIFLAME)' },
    { id: 17, name: 'キャラバン' },
    { id: 18, name: 'マムート(MAMMUT)' },
    { id: 19, name: 'KEEN(キーン)' },
    { id: 20, name: 'アークテリクス(Arcteryx)' },
    { id: 21, name: 'パタゴニア(Patagonia)' },
    { id: 22, name: 'グレゴリー(Gregory)' },
    { id: 23, name: 'ヒルバーグ(Hilleberg)' },
    { id: 24, name: 'ベンガルス(Bergans)' },
    { id: 25, name: 'アライテント' },
    { id: 26, name: 'ノースイーグル(North Eagle)' },
    { id: 27, name: 'バンドック(BUNDOK)' },
    { id: 28, name: 'テンティピ(Tentipi)' },
    { id: 29, name: 'ゼログラム(ZEROGRAM)' },
    { id: 30, name: 'キャンバスキャンプ(CanvasCamp)' },
    { id: 31, name: 'ケシュア(Quechua)' },
    { id: 32, name: 'サウスフィールド(SOUTH FIELD)' },
  ]

  include ActiveHash::Associations
  has_many :posts
end
