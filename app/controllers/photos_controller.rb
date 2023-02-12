class PhotosController < ApplicationController

  def index
    
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render ({ :template => "photos_template/index.html.erb" })

  end

  def details
    
    url_photo = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => url_photo })
    @the_photo = matching_photos.at(0)
    render ({ :template => "photos_template/details.html.erb" })

  end

  def delete
    
    url_photo = params.fetch("path_photo")
    matching_photos = Photo.where({ :id => url_photo })
    @the_photo = matching_photos.at(0)
    @the_photo.destroy
    redirect_to("/photos")

  end

  def insert

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)

  end

  def update
    
    url_update = params.fetch("update_id")
    matching_photos = Photo.where({ :id => url_update })
    the_photo = matching_photos.at(0)

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)

  end

  def comment

    photo_id = params.fetch("input_photo_id")
    input_author = params.fetch("input_author_id")
    input_comment = params.fetch("input_body")
    
    matching_photos = Photo.where({ :id => photo_id })
    the_photo = matching_photos.at(0)

    the_comments = Comment.new
    the_comments.photo_id = photo_id
    the_comments.body = input_comment
    the_comments.author_id = input_author

    the_comments.save

    redirect_to("/photos/" + photo_id.to_s)

  end
end
