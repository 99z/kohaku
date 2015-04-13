require './client.rb'
require './tag.rb'
require './tagged_image.rb'

class Kohaku

  def initialize
    @client
    @api_key = ''
    @api_secret = ''
    @folder_path = ''
    @wants_to_continue = true
  end

  def ohayou

    hajimemashite
    prompt_for_api_info
    create_client
    while @wants_to_continue
      prompt_for_directory
      rename_images
      prompt_for_continue
    end

  end

  def hajimemashite
    puts ''
    puts 'Welcome to Kohaku!'
  end

  def prompt_for_api_info
    puts ''
    print 'Please enter your Imagga API key: '

    @api_key = gets.chomp.strip

    puts ''
    print 'Please enter your Imagga API secret: '

    @api_secret = gets.chomp.strip
  end

  def create_client
    @client = Client.new(@api_key, @api_secret)
  end

  def prompt_for_directory
    puts ''
    print "Enter the FULL PATH to the directory containing the images you'd like to tag: "
    @folder_path = gets.chomp.strip
  end

  def rename_images
    Dir.glob(@folder_path + '*.jpg').each do |image|
      test_upload = @client.upload(image)
      uploaded_image = @client.fetch_uploaded(test_upload.id)
      top_tags = []
      10.times do |i|
        top_tags << uploaded_image.tags[i].name
      end
      File.rename(image, @folder_path + top_tags[0] + ' ' + top_tags[1] + ' ' + top_tags[2] + ' ' +
                         top_tags[3] + ' ' + top_tags[4] + ' ' + top_tags[5] + ' ' +
                         top_tags[6] + ' ' + top_tags[7] + ' ' + top_tags[8] + ' ' +
                         top_tags[9] + File.extname(image))
    end
    puts 'Renaming complete!'
  end

  def prompt_for_continue
    puts ''
    puts 'Would you like to auto-tag images in another directory? (y/n)'
    response = gets.chomp.strip.upcase

    @wants_to_continue = false if response != 'Y'
  end

end

Kohaku.new.ohayou