# coding: utf-8

def set_prototype_image(file_name)
  image_path = Rails.root + "public/uploads/#{file_name}.jpg"
  File.open(image_path)
end

Prototype.delete_all
PrototypeImage.delete_all

user = User.find(2)

9.times do |prototype_num| 
  prototype = user.prototypes.create!({
    name:        "name_hoge#{prototype_num}",
    catchcopy:   "catchcopy_hoge#{prototype_num}",
    concept:     "concept_hoge#{prototype_num}",
    likes_count: prototype_num,
	})

  2.times do |image_into_prototype_num|
    p prototype
    when 0 then
      prototype.prototype_images.create!({
        content: set_prototype_image('12'),
        status: image_into_prototype_num
      })
    when 1 then
      prototype.prototype_images.create!({
        content: set_prototype_image('148'),
        status: image_into_prototype_num
      })
    end
  end
end
