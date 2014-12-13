module Course::YoutubeEmbeddable

    def format_video(link)
      embed_string = "http://www.youtube.com/embed/"
      if link =~ /\Ahttp:\/\/youtu.be\//
        link.gsub! /\Ahttp:\/\/youtu.be\//, embed_string
      elsif link =~ /\Ahttps:\/\/www.youtube.com\/watch\?v=/
        link.gsub! /\Ahttps:\/\/www.youtube.com\/watch\?v=/, embed_string
      elsif link =~ /\Ahttp:\/\/www.youtube.com\/watch\?v=/
        link.gsub! /\Ahttp:\/\/www.youtube.com\/watch\?v=/, embed_string
      end
      link
    end

end
