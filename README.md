# <i class="fas fa-splotch"></i>Aniboard
![Aniboardトップ](https://user-images.githubusercontent.com/75761741/137582841-6cebfdc2-ae92-4c8a-a65a-6efa60c22002.png)
## 概要
アニメの感想を共有し、同じ想いの仲間に出会える。  
他の人の意見を参考に、観たいアニメに出会える。  
__Aniboard__ は、アニメコミュニティアプリケーションです。

## 機能
- アニメタイトル検索
- 感想投稿
- 星評価
- コメント投稿
- いいねボタン
- 楽天ブックスDVD＆Blu-ray検索

## 開発環境
Ruby: 2.6.6   
Ruby on Rails: 6.0.4  
JqueryRaty  
Docker DeskTop  
CircleCI  
VSCode (Visual Studio Code)  
楽天ブックスDVD/Blu-ray検索API  
RSpec  
Rubocop-airbnb  

## 各機能紹介
### __1.アニメタイトル検索__  
検索フォームにキーワードを入力し🔍をクリックすると、  
次ページにて結果が表示されます。(あいまい検索)  
![検索機能](https://user-images.githubusercontent.com/75761741/138652523-5a4627e0-38af-4e1c-a3bf-203a3c532bec.png)
<br>
<br>
### __2.感想投稿、星評価__  
アニメタイトルをクリックし、アニメページから感想を投稿できます。  
![感想投稿1](https://user-images.githubusercontent.com/75761741/138659425-05b257e2-3325-4d4c-b3e4-d9cacd249345.png)  
<br>
<br>
評価はクリックにて星の数を決定。0.5単位で最小0.5〜最大5まで。  
投稿の編集はマイページ(※)から行えます。(※項目4にて紹介)  
![感想投稿2](https://user-images.githubusercontent.com/75761741/138663211-86e96952-c5c9-4c31-8c24-b3ba00657b37.png)  
<br>
<br>
### __3.いいね、コメント投稿__  
各投稿のハートボタンを押すといいねができ、  
「コメントする」から、コメントが投稿できます。  
![いいね、コメント](https://user-images.githubusercontent.com/75761741/138667184-ffbe67cc-bee8-4ca6-962f-86f145265584.png)  
<br>
<br>
### __4.マイページ__  
マイページより、自身のプロフィールとアクションを確認・編集することができます。
![マイページ](https://user-images.githubusercontent.com/75761741/138668544-feca2f9c-efd0-4cd9-a9e5-1c333424d147.png)

### __5.楽天ブックスDVD＆Blu-ray検索__  
アニメページの「楽天DVDを表示」をクリックすると、  
楽天ブックスDVD/Blu-ray検索APIによる検索を行い、結果を表示します。  
各商品カードをクリックすると楽天ブックスの商品ページに移動します。  
![DVD検索](https://user-images.githubusercontent.com/75761741/138664414-1c707ff9-dce2-413a-aa0f-fa683bef10be.png)  
<br>
<br>

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
