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
  { name: 'ジャンクフード' },
  { name: 'デザート' }
])

# タグ
Tag.create!([
  { name: 'タグ1' },
  { name: 'タグ2' },
  { name: 'タグ3' },
  { name: 'タグ4' },
  { name: 'タグ5' }
])

