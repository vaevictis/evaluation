class TextBlock

  attr_accessor :input_string

  def initialize(input_string)
    @input_string = input_string
  end

  def check_tags_symetry
    tmp_tags = tags

    while tmp_tags.size != 0 do
      if tmp_tags.first != tmp_tags.last
        puts "HTML badly formatted. Please check your input string. Hint: each tag should have a matching closing one."
        exit 1
      end
      tmp_tags.shift
      tmp_tags.pop
    end
  end

  def to_indentable_array
    cleaned_printable_string.split('><')
  end

private
  def cleaned_symetric_string
    tmp_string = @input_string.gsub('><', ' ')
    tmp_string.gsub!('><', ' ')
    tmp_string.gsub!('<', ' ')
    tmp_string.gsub!('>', ' ')
    tmp_string.gsub!('/', '')
    tmp_string
  end

  def tags
    cleaned_symetric_string.split
  end

  def cleaned_printable_string
    tmp_string = @input_string.gsub(/\/.*$/, '')
    tmp_string.chop.chop
    tmp_string.slice!(0)
    tmp_string
  end

end