# coding: utf-8

Prototype.delete_all
Prototype.create(name: 'hoge1', user_id: 5, catchcopy: 'hoge1', concept: 'hoge1', likes_count: 1)
Prototype.create(name: 'fuga1', user_id: 5, catchcopy: 'fuga1', concept: 'fuga1', likes_count: 2)
Prototype.create(name: 'piyo1', user_id: 5, catchcopy: 'piyo1', concept: 'piyo1', likes_count: 3)
Prototype.create(name: 'hoge2', user_id: 5, catchcopy: 'hoge2', concept: 'hoge2', likes_count: 1)
Prototype.create(name: 'fuga2', user_id: 5, catchcopy: 'fuga2', concept: 'fuga2', likes_count: 2)
Prototype.create(name: 'piyo1', user_id: 5, catchcopy: 'piyo2', concept: 'piyo2', likes_count: 3)
Prototype.create(name: 'hoge3', user_id: 5, catchcopy: 'hoge3', concept: 'hoge3', likes_count: 1)
Prototype.create(name: 'fuga2', user_id: 5, catchcopy: 'fuga3', concept: 'fuga3', likes_count: 2)
Prototype.create(name: 'piyo1', user_id: 5, catchcopy: 'piyo3', concept: 'piyo3', likes_count: 3)

Comment.delete_all
Comment.create(text: 'hoge', user_id: 1, prototype_id: 1)
Comment.create(text: 'fuga', user_id: 2, prototype_id: 2)
Comment.create(text: 'piyo', user_id: 3, prototype_id: 3)

Like.delete_all
Like.create(user_id: 1, prototype_id: 1)
Like.create(user_id: 2, prototype_id: 2)
Like.create(user_id: 3, prototype_id: 3)

Tag.delete_all
Tag.create(name: 'hoge', taggings_count: 1)
Tag.create(name: 'fuga', taggings_count: 2)
Tag.create(name: 'piyo', taggings_count: 3)

PrototypeImage.delete_all
PrototypeImage.create(content: 'hoge1.jpg', status: 1)
PrototypeImage.create(content: 'hoge2.jpg', status: 2)
PrototypeImage.create(content: 'fuga1.jpg', status: 1)
PrototypeImage.create(content: 'fuga2.jpg', status: 2)
PrototypeImage.create(content: 'piyo1.jpg', status: 1)
PrototypeImage.create(content: 'piyo2.jpg', status: 2)
