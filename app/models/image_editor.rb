class ImageEditor < ApplicationRecord
  def self.apply_transformation(image, transformation)
    case transformation
    when 'black and white'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'blackwhite')
    when 'sepia'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'sepia')
    when 'red rock'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'art:red_rock')
    when 'zorro'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'art:zorro')
    when 'vignette'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'vignette')
    when 'pixelate'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'pixelate')
    when 'blur faces'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'blur_faces')
    when 'blur'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'blur')
    when 'transparent'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'make_transparent')
    when 'hairspray'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'art:hairspray')
    when 'sizzle'
      transformed = Cloudinary::Uploader.upload(image, :effect => 'art:sizzle')
    else
      raise "Valid transformation not provided"
    end
    transformed["url"]
  end
end
