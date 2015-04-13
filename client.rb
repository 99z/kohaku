require 'base64'
require 'faraday'
require 'json'
require './uploaded_image.rb'
require './tagged_image.rb'

class Client

  IMAGGA_API_BASE_URL = 'https://api.imagga.com'
  IMAGGA_API_TAG_PATH = '/v1/tagging'
  IMAGGA_API_UPLOAD_PATH = 'v1/content'

  attr_reader :response, :content_id

  def initialize(api_key, api_secret)
    @conn_upload = Faraday.new('https://api.imagga.com') do |f|
      f.request :multipart
      f.request :url_encoded
      f.adapter :net_http
    end
    @conn_upload.basic_auth api_key, api_secret
  end

  def fetch_uploaded(content_id)
    @response = @conn_upload.get(IMAGGA_API_TAG_PATH, content: content_id)

    TaggedImage.new(@response)
  end

  def upload(image_path) # make media type conditional
    image_to_upload = { image: Faraday::UploadIO.new(image_path, 'image/jpeg')}
    content_id = @conn_upload.post(IMAGGA_API_UPLOAD_PATH, image_to_upload)

    UploadedImage.new(content_id)
  end

end
