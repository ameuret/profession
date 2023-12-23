#!/usr/bin/env ruby

require 'prawn'
require 'prawn/measurement_extensions'

class Book
  include Prawn::View

  def document
    @document ||= Prawn::Document.new page_size: 'A5'
  end

  def build
    textFile = File.open('fullText.txt')
    stroke_axis
    stroke_circle [0, 0], 10
    font('et-book-roman-line-figures.ttf')

    text('PROFESSION', align: :center, size: 30)
    text("\n", align: :center)
    text('by Isaac Asimov', align: :center)
    text("\n", align: :center)
    textFile.each_line('fullText.txt') do
      |line|

      text(line, size: 12)
    end
    textFile.close
  end
end

book = Book.new
book.build

book.render_file('profession.pdf')
