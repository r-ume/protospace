# coding: utf-8

Prototype.delete_all
Prototype.create(:name => 'hoge', :user_id => 1, :catchcopy => 'hoge', :concept => 'hoge', :likes_count => 1, :image => 'hoge.jpg')
Prototype.create(:name => 'fuga', :user_id => 2, :catchcopy => 'fuga', :concept => 'fuga', :likes_count => 2, :image => 'fuga.jpg')
Prototype.create(:name => 'piyo', :user_id => 3, :catchcopy => 'piyo', :concept => 'piyo', :likes_count => 3, :image => 'piyo.jpg')

Comment.delete_all
Comment.create(:text => 'hoge', :user_id => 1, :prototype_id => 1)
Comment.create(:text => 'fuga', :user_id => 2, :prototype_id => 2)
Comment.create(:text => 'piyo', :user_id => 3, :prototype_id => 3)

Like.delete_all
Like.create(:user_id => 1, :prototype_id => 1)
Like.create(:user_id => 2, :prototype_id => 2)
Like.create(:user_id => 3, :prototype_id => 3)

Tag.delete_all
Tag.create(:name => 'hoge', :taggings_count => 1)
Tag.create(:name => 'fuga', :taggings_count => 2)