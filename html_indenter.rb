class HtmlIndenter

  def self.build_node(array, space_size=0)
    current_element = array.shift
    space_size.times { putc "\s" }
    puts "<" + current_element.to_s + ">"

    unless array.empty?
      build_node(array, space_size + 2)
    end

    space_size.times { putc "\s" }
    puts "</" + current_element.to_s + ">"
  end

end