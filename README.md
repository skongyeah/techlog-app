# バージョン
- ruby: 3.0.4p208
- rails: 7.0.8.6
- yarn: 1.22.22
- vue: 3.5.13

# セットアップ
## 必要なプログラムのインストール
1. yarn Dependencies インストール
```bash
yarn install
```
2. ruby Gems インストール
```
bundle install
```
## データベースの初期化とマイグレーション

1. データベース生成
```
rails db:create
```
2. マイグレーション適用
```
rails db:migrate
```
## プロジェクト実行
- Rails サーバー実行
```
rails server
```

# 機能説明
## ログイン
1. ログインしていないのに文を作成しようとしている状況<br>
![ex_screenshot](./img/로그인%20필요%20화면.png)

2. ログイン失敗画面 
![ex_screenshot](/img/로그인%20실패.png)

3. ログイン完了画面
![ex_screenshot](/img/로그인%20완료%20화면.png)

## ログアウト 
1. ログアウト完了画面
![ex_screenshot](/img/로그아웃%20완료%20화면.png)

## 会員登録
1. ユーザー登録画面
![ex_screenshot](/img/유저%20등록%20페이지.png)

2. 空のフィールドがあるときのユーザー登録失敗画面
![ex_screenshot](/img/유저등록%20실패.png)

3. ユーザーユーザー登録完了
![ex_screenshot](/img/유저%20등록%20완료.png)

## 登録
1. 文の登録画面
![ex_screenshot](/img/글작성%20페이지.png)

2. 空のフィールドがあるときの文の登録失敗画面
![ex_screenshot](/img/글%20작성%20실패.png)

3. 文の登録完了
![ex_screenshot](/img/작성%20완료.png)

## 修正
1. 他人の書き込みを照会した時は、削除·修正ボタンが表示されない
![ex_screenshot](/img/남%20글.png)

2. 自分の文章を照会した時は、削除·修正ボタンが見える
![ex_screenshot](/img/내%20글.png)

3. 文の修正完了画面
![ex_screenshot](/img/수정%20완료.png)

## 削除 
1. 削除完了後、照会ページへ移動
![ex_screenshot](/img/삭제%20완료.png)

## 検索
1. 「会社」で検索
![ex_screenshot](/img/회사%20검색.png)

2. 「プロジェクト」で検索
![ex_screenshot](/img/프로젝트%20검색.png)

## レスポンシブデザイン
@mediaを活用してモバイル支援デザインを実現
``` html
  @media (max-width: 480px){
    .content .btn {
      font-size: 1.2rem;
    }
  }
``` 
