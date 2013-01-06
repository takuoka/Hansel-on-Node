

var mongoose = require('mongoose');
var db = mongoose.connect('mongodb://localhost/HanselMongoBox');


function validator(v) {
	return v.length > 0;
}


// 投稿データのフォーマット(スキーマ)を設定。
var User = new mongoose.Schema({
	user_id: {type:Number},
	username: {type:String, validate:[validator,"Empty Error"]},
	pages: {}
});

var Book = new mongoose.Schema({
	user_id: {type:Number},
	username: {type:String, validate:[validator,"Empty Error"]},
	pages: {}
});
/*
もっとMongoDB勉強しないとわからん。
[User]
user_name
user_id

[Page]
date
items
	type
	time
	content


元のやつ
	text: {type:String, validate:[validator,"Empty Error"]},
	created: {type:Date, default:Date.now() },

 */


// Postという名前でスキーマを登録
exports.Post = db.model( 'User', User );
exports.Post = db.model( 'Book', Book );

