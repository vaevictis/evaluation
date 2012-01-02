class HtmlIndenter

  def self.build_node(array, space_size=0, blank_line=false)
    current_element = array.shift
    space_size.times { putc "\s" }
    puts "<" + current_element.to_s + ">"
    puts if blank_line

    unless array.empty?
      build_node(array, space_size + 2, blank_line)
      puts if blank_line
    end

    space_size.times { putc "\s" }
    puts "</" + current_element.to_s + ">"
  end

end