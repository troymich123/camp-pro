FactoryBot.define do
  factory :rank1, class: RankSetting do
    rank { 1 }
    rank_name { 'ルーキーⅣ' }
    threshold { 0 }
  end

  factory :rank2, class: RankSetting do
    rank { 2 }
    rank_name { 'ルーキーⅢ' }
    threshold { 1 }
  end
end
