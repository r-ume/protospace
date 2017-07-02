# coding: utf-8

Prototype.delete_all
Prototype.create(:name => 'hoge', :user_id => 5, :catchcopy => 'hoge1', :concept => 'hoge1', :likes_count => 1, :image => 'hoge1.jpg')
Prototype.create(:name => 'fuga', :user_id => 5, :catchcopy => 'fuga1', :concept => 'fuga1', :likes_count => 2, :image => 'fuga1.jpg')
Prototype.create(:name => 'piyo', :user_id => 5, :catchcopy => 'piyo1', :concept => 'piyo1', :likes_count => 3, :image => 'piyo1.jpg')
Prototype.create(:name => 'hoge', :user_id => 5, :catchcopy => 'hoge2', :concept => 'hoge2', :likes_count => 1, :image => 'hoge2.jpg')
Prototype.create(:name => 'fuga', :user_id => 5, :catchcopy => 'fuga2', :concept => 'fuga2', :likes_count => 2, :image => 'fuga2.jpg')
Prototype.create(:name => 'piyo', :user_id => 5, :catchcopy => 'piyo2', :concept => 'piyo2', :likes_count => 3, :image => 'piyo2.jpg')
Prototype.create(:name => 'hoge', :user_id => 5, :catchcopy => 'hoge3', :concept => 'hoge3', :likes_count => 1, :image => 'hoge3.jpg')
Prototype.create(:name => 'fuga', :user_id => 5, :catchcopy => 'fuga3', :concept => 'fuga3', :likes_count => 2, :image => 'fuga3.jpg')
Prototype.create(:name => 'piyo', :user_id => 5, :catchcopy => 'piyo3', :concept => 'piyo3', :likes_count => 3, :image => 'piyo3.jpg')

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
