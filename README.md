# 概要
ユーザーがアンケートを作成し、他のユーザーがそのアンケートに回答できるアプリケーション

## テーブル設計
### Usersテーブル(ユーザー)
- deviseで作成されたからカラム一式
### Surveysテーブル（アンケート）
- **タイトル (title)**: 文字列
- **詳細 (description)**: 文字列
- **Usersテーブルの外部キー**
### Questionsテーブル（質問）
- **タイトル (title)**: 文字列
- **詳細 (description)**: 文字列
- **Usersテーブルの外部キー**
- **Surveysテーブルの外部キー**
### Answersテーブル（回答）
- **タイトル (title)**: 文字列
- **詳細 (description)**: 文字列
- **Usersテーブルの外部キー**
- **Questionsテーブルの外部キー**


## 機能
- **ユーザー認証機能**:  
  ユーザーは新規登録、ログイン、ログアウトができる。アンケートの回答はログインしていなくても可能だが、アンケートの管理画面はログインしていないと使用できない。
- **アンケート管理機能**:  
  アンケートに対するすべての回答を一覧で表示するページ。
  ここでアンケートと質問を作成することができる。
- **アンケート管理機能**:
  アンケートに対して、不特定多数のユーザーがそれぞれの質問に回答を投稿できる。
  同じユーザーが何度でも回答できる。再度回答した場合は別の回答として扱う。

## 使用技術
- **フロントエンド**: Vue3.4.31
- **バックエンド**: Ruby3.3.4, Rails7.0.8
