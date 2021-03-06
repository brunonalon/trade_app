# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"

  end
    
  def extension_white_list
    %w(jpg jpeg gif png)
  end


  version :thumb do
    process :resize_to_limit => [200, 200]
  end


  version :mini do
    process :resize_to_limit => [32, 32]
  end

  version :big do
    process :resize_to_limit => [400, 400]
  end

end
