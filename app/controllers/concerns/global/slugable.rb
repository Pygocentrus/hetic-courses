module Global::Slugable

  def to_slug(str)
    #strip the string
    ret = str.strip.downcase

    #blow away apostrophes
    ret.gsub! /['`\.]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #special characters
    ret.gsub! /é|è|ê|ë/, "e"
    ret.gsub! /à|ä|â/, "a"
    ret.gsub! /î|ï/, "i"
    ret.gsub! /ô|ö/, "o"
    ret.gsub! /û/, "u"

    #replace all non alphanumeric, underscore or periods with underscore
    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'

    #convert double underscores to single
    ret.gsub! /_+/,"_"
    ret.gsub! /\-+/,"-"

    #strip off leading/trailing underscore
    ret.gsub! /\A[_\-\.]+|[_\-\.]+\z/,""

    ret
  end

  def to_slug2(str)
    str.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
