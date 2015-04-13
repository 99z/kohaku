class TaggedImage

  attr_reader :status, :tags

  def initialize(api_response)
    # { 'results' => [{ 'image' => 'filename or id', 'tags' => [{}, {}, {}] }] }
    body = JSON.parse(api_response.body)
    @tags = []

    body['results'][0]['tags'].each do |tag|
      @tags.push Tag.new(tag)
    end

    @status = api_response.status
  end

end
