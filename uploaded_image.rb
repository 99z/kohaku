class UploadedImage

  attr_reader :id, :status

  def initialize(api_response)
    # { 'status' => status, 'uploaded' => [
    # { 'id' => "image id on imagga's servers", 'filename' => 'original filename' } ]}
    body = JSON.parse(api_response.body)
    @id = body['uploaded'][0]['id']
    @status = api_response.status
  end

end
