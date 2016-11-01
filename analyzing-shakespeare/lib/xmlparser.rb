class XMLParser
  def initialize(path)
    @path = path
  end

  def parse

    File.readlines(@path)
    # require 'pry' ; binding.pry
  end
end
