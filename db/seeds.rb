# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者１
Admin.create!(
  email: "a@a",
  password: "aaaaaa"
)

# ユーザー１
User.create!(
  name: "bbb",
  email: "b@b",
  password: "bbbbbb"
)

# ジャンル
Genre.create!([
  { name: '和食' },
  { name: '洋食' },
  { name: '中華' },
  { name: '東南アジア料理' },
  { name: 'メキシコ料理' },
])

# レシピ
# Recipe 1: お好み焼き
Recipe.create!(
  user_id: 1,
  genre_id: 1,
  title: "お好み焼き",
  introduction: "関西風のお好み焼きで、具材は自由にアレンジできます。",
  serving: 2,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/okonomiyaki.jpg")), filename: "okonomiyaki.jpg")
)
Material.create!([
  { recipe_id: 1, name: "小麦粉", amount: "100g" },
  { recipe_id: 1, name: "水", amount: "120ml" },
  { recipe_id: 1, name: "キャベツ", amount: "200g" },
  { recipe_id: 1, name: "卵", amount: "1個" },
  { recipe_id: 1, name: "豚バラ肉", amount: "4枚" },
  { recipe_id: 1, name: "天かす", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 1, body: "キャベツを細かく切る" },
  { recipe_id: 1, body: "小麦粉、水、卵を混ぜ、キャベツと天かすを加えてさらに混ぜる" },
  { recipe_id: 1, body: "フライパンに油をひいて生地を入れ、豚バラ肉を乗せる" },
  { recipe_id: 1, body: "両面を焼いて完成" },
])

# Recipe 2: カレーライス
Recipe.create!(
  user_id: 1,
  genre_id: 2,
  title: "カレーライス",
  introduction: "家庭で簡単に作れるカレーライスです。具材はお好みでアレンジ可能です。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/curry_rice.jpg")), filename: "curry_rice.jpg")
)
Material.create!([
  { recipe_id: 2, name: "玉ねぎ", amount: "1個" },
  { recipe_id: 2, name: "にんじん", amount: "1本" },
  { recipe_id: 2, name: "じゃがいも", amount: "2個" },
  { recipe_id: 2, name: "豚肉", amount: "300g" },
  { recipe_id: 2, name: "カレールウ", amount: "1箱" },
  { recipe_id: 2, name: "水", amount: "1000ml" },
])
Procedure.create!([
  { recipe_id: 2, body: "野菜と豚肉を一口大に切る" },
  { recipe_id: 2, body: "鍋に油をひいて野菜と豚肉を炒める" },
  { recipe_id: 2, body: "水を加えて煮込む" },
  { recipe_id: 2, body: "カレールウを加えて溶かし、煮込む" },
])

# Recipe 3: 麻婆豆腐
Recipe.create!(
  user_id: 1,
  genre_id: 3,
  title: "麻婆豆腐",
  introduction: "辛さと花椒の風味が特徴の中華料理、麻婆豆腐です。",
  serving: 2,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/mapo_tofu.jpg")), filename: "mapo_tofu.jpg")
)
Material.create!([
  { recipe_id: 3, name: "豆腐", amount: "1丁" },
  { recipe_id: 3, name: "ひき肉", amount: "200g" },
  { recipe_id: 3, name: "ニンニク", amount: "1片" },
  { recipe_id: 3, name: "生姜", amount: "1片" },
  { recipe_id: 3, name: "豆板醤", amount: "大さじ1" },
  { recipe_id: 3, name: "甜麺醤", amount: "大さじ1" },
  { recipe_id: 3, name: "醤油", amount: "大さじ1" },
  { recipe_id: 3, name: "鶏ガラスープの素", amount: "小さじ1" },
  { recipe_id: 3, name: "水", amount: "100ml" },
  { recipe_id: 3, name: "片栗粉", amount: "適量" },
  { recipe_id: 3, name: "花椒", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 3, body: "豆腐を1cm角に切り、ゆでる" },
  { recipe_id: 3, body: "ニンニク、生姜をみじん切りにする" },
  { recipe_id: 3, body: "フライパンに油をひき、ニンニク、生姜を炒める" },
  { recipe_id: 3, body: "ひき肉を加えて炒める" },
  { recipe_id: 3, body: "豆板醤、甜麺醤を加えて炒める" },
  { recipe_id: 3, body: "醤油、鶏ガラスープの素、水を加えて煮込む" },
  { recipe_id: 3, body: "豆腐を加えてさらに煮込む" },
  { recipe_id: 3, body: "片栗粉でとろみをつけ、花椒を振って完成" },
])

# Recipe 4: パッタイ
Recipe.create!(
  user_id: 1,
  genre_id: 4,
  title: "パッタイ",
  introduction: "タイ料理の代表格、パッタイは麺と豆もやしの歯ごたえが楽しい一品です。",
  serving: 2,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/pad_thai.jpg")), filename: "pad_thai.jpg")
)
Material.create!([
  { recipe_id: 4, name: "油", amount: "大さじ2" },
  { recipe_id: 4, name: "にんにく", amount: "2片" },
  { recipe_id: 4, name: "鶏もも肉", amount: "200g" },
  { recipe_id: 4, name: "乾燥米麺", amount: "200g" },
  { recipe_id: 4, name: "もやし", amount: "100g" },
  { recipe_id: 4, name: "ニラ", amount: "1束" },
  { recipe_id: 4, name: "ナムプラー", amount: "大さじ2" },
  { recipe_id: 4, name: "砂糖", amount: "大さじ2" },
  { recipe_id: 4, name: "醤油", amount: "大さじ1" },
  { recipe_id: 4, name: "卵", amount: "2個" },
  { recipe_id: 4, name: "ピーナッツ", amount: "適量" },
  { recipe_id: 4, name: "ライム", amount: "1個" },
])
Procedure.create!([
  { recipe_id: 4, body: "麺を水で戻し、にんにくをみじん切りにする" },
  { recipe_id: 4, body: "鶏もも肉を一口大に切る" },
  { recipe_id: 4, body: "フライパンに油をひき、にんにくを炒める" },
  { recipe_id: 4, body: "鶏もも肉を加えて炒める" },
  { recipe_id: 4, body: "戻した麺を加えて炒める" },
  { recipe_id: 4, body: "ナムプラー、砂糖、醤油を加えて炒める" },
  { recipe_id: 4, body: "卵を割り入れ、麺と絡める" },
  { recipe_id: 4, body: "もやしとニラを加えて炒める" },
  { recipe_id: 4, body: "器に盛り、ピーナッツを散らし、ライムを添えて完成" },
])

# Recipe 5: 冷やし中華
Recipe.create!(
  user_id: 1,
  genre_id: 3,
  title: "冷やし中華",
  introduction: "夏にぴったりのさっぱりとした一品、冷やし中華です。具材はお好みでアレンジしてください。",
  serving: 2,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/hiyashi_chuka.jpg")), filename: "hiyashi_chuka.jpg")
)
Material.create!([
  { recipe_id: 5, name: "中華麺", amount: "2玉" },
  { recipe_id: 5, name: "キュウリ", amount: "1本" },
  { recipe_id: 5, name: "ハム", amount: "4枚" },
  { recipe_id: 5, name: "玉子", amount: "2個" },
  { recipe_id: 5, name: "トマト", amount: "1個" },
  { recipe_id: 5, name: "ゴマ油", amount: "大さじ1" },
  { recipe_id: 5, name: "醤油", amount: "大さじ2" },
  { recipe_id: 5, name: "酢", amount: "大さじ2" },
  { recipe_id: 5, name: "砂糖", amount: "大さじ1" },
  { recipe_id: 5, name: "ラー油", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 5, body: "中華麺を茹で、冷水で冷やす" },
  { recipe_id: 5, body: "キュウリは千切り、ハムは細切り、トマトはくし形に切る" },
  { recipe_id: 5, body: "玉子を薄焼き玉子にして細切りにする" },
  { recipe_id: 5, body: "ゴマ油、醤油、酢、砂糖を混ぜてたれを作る" },
  { recipe_id: 5, body: "麺を盛り付け、具材を上にのせる" },
  { recipe_id: 5, body: "たれをかけ、お好みでラー油を加える" },
  { recipe_id: 5, body: "完成" },
])

# Recipe 6: スパゲッティ・カルボナーラ
Recipe.create!(
  user_id: 1,
  genre_id: 2,
  title: "カルボナーラ",
  introduction: "濃厚なソースとベーコンの旨味が絶妙なスパゲッティ・カルボナーラです。",
  serving: 2,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/spaghetti_carbonara.jpg")), filename: "spaghetti_carbonara.jpg")
)
Material.create!([
  { recipe_id: 6, name: "スパゲッティ", amount: "200g" },
  { recipe_id: 6, name: "ベーコン", amount: "4枚" },
  { recipe_id: 6, name: "卵", amount: "2個" },
  { recipe_id: 6, name: "生クリーム", amount: "100ml" },
  { recipe_id: 6, name: "パルメザンチーズ", amount: "適量" },
  { recipe_id: 6, name: "黒胡椒", amount: "適量" },
  { recipe_id: 6, name: "塩", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 6, body: "スパゲッティを塩加減したお湯で茹でる" },
  { recipe_id: 6, body: "ベーコンを一口大に切り、フライパンで炒める" },
  { recipe_id: 6, body: "卵と生クリームを混ぜる" },
  { recipe_id: 6, body: "茹で上がったスパゲッティをフライパンに加え、炒める" },
  { recipe_id: 6, body: "火を止め、卵と生クリームの混ぜ物を加えて絡める" },
  { recipe_id: 6, body: "パルメザンチーズと黒胡椒を振って完成" },
])

# Recipe 7: 酢豚
Recipe.create!(
  user_id: 1,
  genre_id: 3,
  title: "酢豚",
  introduction: "甘酸っぱいソースと野菜が特徴の中華料理、酢豚です。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/sweet_and_sour_pork.jpg")), filename: "sweet_and_sour_pork.jpg")
)
Material.create!([
  { recipe_id: 7, name: "豚肉", amount: "300g" },
  { recipe_id: 7, name: "塩", amount: "小さじ1" },
  { recipe_id: 7, name: "こしょう", amount: "少々" },
  { recipe_id: 7, name: "片栗粉", amount: "適量" },
  { recipe_id: 7, name: "油", amount: "適量" },
  { recipe_id: 7, name: "玉ねぎ", amount: "1個" },
  { recipe_id: 7, name: "パプリカ", amount: "2個" },
  { recipe_id: 7, name: "パイナップル", amount: "1缶" },
  { recipe_id: 7, name: "ソース用の砂糖", amount: "大さじ4" },
  { recipe_id: 7, name: "ソース用の酢", amount: "大さじ4" },
  { recipe_id: 7, name: "ソース用のケチャップ", amount: "大さじ4" },
  { recipe_id: 7, name: "ソース用の醤油", amount: "大さじ1" },
  { recipe_id: 7, name: "ソース用の片栗粉", amount: "大さじ1" },
  { recipe_id: 7, name: "ソース用の水", amount: "大さじ1" },
])
Procedure.create!([
  { recipe_id: 7, body: "豚肉を一口大に切り、塩、こしょうを振って下味をつける" },
  { recipe_id: 7, body: "豚肉に片栗粉をまぶす" },
  { recipe_id: 7, body: "油を熱し、豚肉を揚げる" },
  { recipe_id: 7, body: "玉ねぎ、パプリカを一口大に切り、パイナップルを水気を切る" },
  { recipe_id: 7, body: "ソースの材料を混ぜる" },
  { recipe_id: 7, body: "フライパンに油をひいて玉ねぎ、パプリカを炒める" },
  { recipe_id: 7, body: "ソースを加えて煮詰める" },
  { recipe_id: 7, body: "揚げた豚肉とパイナップルを加えて絡めて完成" },
])

# Recipe 8: クリームシチュー
Recipe.create!(
  user_id: 1,
  genre_id: 2,
  title: "クリームシチュー",
  introduction: "野菜とクリームのコクが特徴の洋食定番、クリームシチューです。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/cream_stew.jpg")), filename: "cream_stew.jpg")
)
Material.create!([
  { recipe_id: 8, name: "鶏肉", amount: "300g" },
  { recipe_id: 8, name: "じゃがいも", amount: "3個" },
  { recipe_id: 8, name: "にんじん", amount: "1本" },
  { recipe_id: 8, name: "玉ねぎ", amount: "1個" },
  { recipe_id: 8, name: "ブロッコリー", amount: "1株" },
  { recipe_id: 8, name: "バター", amount: "大さじ2" },
  { recipe_id: 8, name: "小麦粉", amount: "大さじ4" },
  { recipe_id: 8, name: "牛乳", amount: "800ml" },
  { recipe_id: 8, name: "固形コンソメ", amount: "1個" },
  { recipe_id: 8, name: "塩", amount: "少々" },
  { recipe_id: 8, name: "こしょう", amount: "少々" },
])
Procedure.create!([
  { recipe_id: 8, body: "鶏肉、じゃがいも、にんじん、玉ねぎを一口大に切る" },
  { recipe_id: 8, body: "ブロッコリーは小房に分ける" },
  { recipe_id: 8, body: "鍋にバターを溶かし、小麦粉を炒める" },
  { recipe_id: 8, body: "牛乳を加えて泡立つまで混ぜる" },
  { recipe_id: 8, body: "鶏肉、じゃがいも、にんじん、玉ねぎ、固形コンソメを加えて煮る" },
  { recipe_id: 8, body: "野菜が柔らかくなったら、ブロッコリーを加えてさらに煮る" },
  { recipe_id: 8, body: "塩、こしょうで味を調えて完成" },
])

# Recipe 9: 親子丼
Recipe.create!(
  user_id: 1,
  genre_id: 1,
  title: "親子丼",
  introduction: "鶏肉と卵がハーモニーを奏でる、日本の定番料理親子丼です。",
  serving: 2,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/oyakodon.jpg")), filename: "oyakodon.jpg")
)
Material.create!([
  { recipe_id: 9, name: "鶏もも肉", amount: "1枚" },
  { recipe_id: 9, name: "玉ねぎ", amount: "1個" },
  { recipe_id: 9, name: "卵", amount: "3個" },
  { recipe_id: 9, name: "ごはん", amount: "2合" },
  { recipe_id: 9, name: "だし汁", amount: "200ml" },
  { recipe_id: 9, name: "醤油", amount: "大さじ3" },
  { recipe_id: 9, name: "みりん", amount: "大さじ2" },
  { recipe_id: 9, name: "砂糖", amount: "大さじ1" },
])
Procedure.create!([
  { recipe_id: 9, body: "鶏もも肉を一口大に切る" },
  { recipe_id: 9, body: "玉ねぎを薄切りにする" },
  { recipe_id: 9, body: "フライパンにだし汁、醤油、みりん、砂糖を入れ、煮立てる" },
  { recipe_id: 9, body: "鶏もも肉と玉ねぎを加え、煮る" },
  { recipe_id: 9, body: "卵を溶きほぐし、鶏肉にかけて蓋をして蒸らす" },
  { recipe_id: 9, body: "ごはんにのせて完成" },
])

# Recipe 10: カオマンガイ
Recipe.create!(
  user_id: 1,
  genre_id: 4,
  title: "カオマンガイ",
  introduction: "タイ料理の定番、鶏肉とご飯のシンプルな組み合わせが美味しいカオマンガイです。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/khao_man_gai.jpg")), filename: "khao_man_gai.jpg")
)
Material.create!([
  { recipe_id: 10, name: "鶏肉", amount: "1枚" },
  { recipe_id: 10, name: "ごはん", amount: "4合" },
  { recipe_id: 10, name: "にんにく", amount: "4片" },
  { recipe_id: 10, name: "生姜", amount: "1かけ" },
  { recipe_id: 10, name: "サラダ油", amount: "大さじ1" },
  { recipe_id: 10, name: "鶏がらスープの素", amount: "大さじ2" },
  { recipe_id: 10, name: "水", amount: "4カップ" },
  { recipe_id: 10, name: "塩", amount: "適量" },
  { recipe_id: 10, name: "胡椒", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 10, body: "鶏肉に塩をふり、茹でる。茹で上がったら、一口大に切る" },
  { recipe_id: 10, body: "にんにくと生姜をみじん切りにし、サラダ油で炒める" },
  { recipe_id: 10, body: "炒めたにんにくと生姜を炊飯器に入れ、ごはんと一緒に炊く" },
  { recipe_id: 10, body: "炊き上がったごはんに鶏肉をのせる" },
  { recipe_id: 10, body: "鶏がらスープの素と水を混ぜてスープを作り、塩胡椒で味を調える" },
  { recipe_id: 10, body: "カオマンガイにスープを添えて完成" },
])

# Recipe 11: バンバンジー
Recipe.create!(
  user_id: 1,
  genre_id: 3,
  title: "バンバンジー",
  introduction: "四川料理の代表的な前菜で、鶏肉の食感とピリ辛ソースが美味しいバンバンジーです。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/bang_bang_chicken.jpg")), filename: "bang_bang_chicken.jpg")
)
Material.create!([
  { recipe_id: 11, name: "鶏むね肉", amount: "2枚" },
  { recipe_id: 11, name: "きゅうり", amount: "1本" },
  { recipe_id: 11, name: "胡麻油", amount: "大さじ1" },
  { recipe_id: 11, name: "ラー油", amount: "大さじ1" },
  { recipe_id: 11, name: "豆板醤", amount: "大さじ1" },
  { recipe_id: 11, name: "砂糖", amount: "大さじ1" },
  { recipe_id: 11, name: "醤油", amount: "大さじ2" },
  { recipe_id: 11, name: "酢", amount: "大さじ1" },
  { recipe_id: 11, name: "塩", amount: "少々" },
])
Procedure.create!([
  { recipe_id: 11, body: "鶏むね肉を茹でる。茹で上がったら、手で細かく裂く" },
  { recipe_id: 11, body: "きゅうりを細かく切る" },
  { recipe_id: 11, body: "胡麻油、ラー油、豆板醤、砂糖、醤油、酢、塩を混ぜてソースを作る" },
  { recipe_id: 11, body: "鶏肉ときゅうりにソースをかけて、よく和える" },
  { recipe_id: 11, body: "盛り付けて完成" },
])

# Recipe 12: ミートソーススパゲッティ
Recipe.create!(
  user_id: 1,
  genre_id: 2,
  title: "ミートソーススパゲッティ",
  introduction: "具だくさんで栄養満点のミートソーススパゲッティです。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/spaghetti_meat_sauce.jpg")), filename: "spaghetti_meat_sauce.jpg")
)
Material.create!([
  { recipe_id: 12, name: "スパゲッティ", amount: "320g" },
  { recipe_id: 12, name: "ひき肉", amount: "200g" },
  { recipe_id: 12, name: "玉ねぎ", amount: "1個" },
  { recipe_id: 12, name: "にんじん", amount: "1本" },
  { recipe_id: 12, name: "セロリ", amount: "1本" },
  { recipe_id: 12, name: "にんにく", amount: "1かけ" },
  { recipe_id: 12, name: "オリーブオイル", amount: "大さじ2" },
  { recipe_id: 12, name: "トマト缶", amount: "1缶" },
  { recipe_id: 12, name: "塩", amount: "適量" },
  { recipe_id: 12, name: "こしょう", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 12, body: "スパゲッティを茹でる" },
  { recipe_id: 12, body: "玉ねぎ、にんじん、セロリ、にんにくをみじん切りにする" },
  { recipe_id: 12, body: "フライパンにオリーブオイルを熱し、野菜を炒める" },
  { recipe_id: 12, body: "ひき肉を加えて炒める" },
  { recipe_id: 12, body: "トマト缶を加え、煮込む" },
  { recipe_id: 12, body: "塩、こしょうで味を調える" },
  { recipe_id: 12, body: "茹でたスパゲッティにミートソースをかける" },
  { recipe_id: 12, body: "盛り付けて完成" },
])

# Recipe 13: ミネストローネ
Recipe.create!(
  user_id: 1,
  genre_id: 1,
  title: "ミネストローネ",
  introduction: "具だくさんのイタリアンスープ、ミネストローネです。野菜をたっぷり摂れるレシピです。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/minestrone.jpg")), filename: "minestrone.jpg")
)
Material.create!([
  { recipe_id: 13, name: "玉ねぎ", amount: "1個" },
  { recipe_id: 13, name: "にんじん", amount: "1本" },
  { recipe_id: 13, name: "セロリ", amount: "1本" },
  { recipe_id: 13, name: "じゃがいも", amount: "1個" },
  { recipe_id: 13, name: "缶詰トマト", amount: "1缶" },
  { recipe_id: 13, name: "水", amount: "1000ml" },
  { recipe_id: 13, name: "塩こしょう", amount: "適量" },
  { recipe_id: 13, name: "オリーブ油", amount: "適量" },
  { recipe_id: 13, name: "パルメザンチーズ", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 13, body: "野菜を一口大に切る" },
  { recipe_id: 13, body: "鍋にオリーブ油をひいて野菜を炒める" },
  { recipe_id: 13, body: "缶詰トマトと水を加えて煮込む" },
  { recipe_id: 13, body: "塩こしょうで味を調える" },
  { recipe_id: 13, body: "器に盛り、パルメザンチーズを振って完成" },
])

# Recipe 14: 豚汁
Recipe.create!(
  user_id: 1,
  genre_id: 1,
  title: "豚汁",
  introduction: "具だくさんの豚汁は栄養満点で冬にぴったりの一品です。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/tonjiru.jpg")), filename: "tonjiru.jpg")
)
Material.create!([
  { recipe_id: 14, name: "豚肉", amount: "200g" },
  { recipe_id: 14, name: "大根", amount: "1/4本" },
  { recipe_id: 14, name: "人参", amount: "1本" },
  { recipe_id: 14, name: "ごぼう", amount: "1本" },
  { recipe_id: 14, name: "こんにゃく", amount: "1枚" },
  { recipe_id: 14, name: "白菜", amount: "4枚" },
  { recipe_id: 14, name: "味噌", amount: "大さじ4" },
  { recipe_id: 14, name: "だし汁", amount: "4カップ" },
  { recipe_id: 14, name: "油", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 14, body: "野菜を一口大に切る" },
  { recipe_id: 14, body: "豚肉を食べやすい大きさに切る" },
  { recipe_id: 14, body: "油を熱した鍋に豚肉を炒める" },
  { recipe_id: 14, body: "豚肉に火が通ったら、野菜を加えて炒める" },
  { recipe_id: 14, body: "だし汁を加え、煮込む" },
  { recipe_id: 14, body: "味噌を加えて煮込み、完成" },
])

# Recipe 15: ブリトー
Recipe.create!(
  user_id: 1,
  genre_id: 5,
  title: "ブリトー",
  introduction: "具材がたっぷり入ったメキシコ料理、ブリトーです。お好みの具材でアレンジして楽しんでください。",
  serving: 4,
  is_draft: false,
  recipe_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/fixtures/burrito.jpg")), filename: "burrito.jpg")
)
Material.create!([
  { recipe_id: 15, name: "大きめのトルティーヤ", amount: "4枚" },
  { recipe_id: 15, name: "豆類（ブラックビーンズなど）", amount: "1缶" },
  { recipe_id: 15, name: "ごはん", amount: "4膳分" },
  { recipe_id: 15, name: "挽肉（鶏肉または牛肉）", amount: "200g" },
  { recipe_id: 15, name: "玉ねぎ", amount: "1個" },
  { recipe_id: 15, name: "ピーマン", amount: "2個" },
  { recipe_id: 15, name: "トマト", amount: "1個" },
  { recipe_id: 15, name: "チーズ", amount: "適量" },
  { recipe_id: 15, name: "サルサソース", amount: "適量" },
  { recipe_id: 15, name: "サワークリーム", amount: "適量" },
  { recipe_id: 15, name: "塩こしょう", amount: "適量" },
])
Procedure.create!([
  { recipe_id: 15, body: "玉ねぎ、ピーマン、トマトをみじん切りにする" },
  { recipe_id: 15, body: "フライパンで挽肉を炒め、塩こしょうで味を調える" },
  { recipe_id: 15, body: "豆類を加えて炒める" },
  { recipe_id: 15, body: "トルティーヤをレンジで温める" },
  { recipe_id: 15, body: "トルティーヤにごはん、肉豆の具、みじん切り野菜、チーズをのせる" },
  { recipe_id: 15, body: "サルサソースとサワークリームをかける" },
  { recipe_id: 15, body: "トルティーヤを巻いて完成" },
])