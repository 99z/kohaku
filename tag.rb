class Tag

  attr_reader :confidence, :name

  def initialize(tag_data)
    @confidence = tag_data['confidence']
    @name = tag_data['tag']
  end

end
