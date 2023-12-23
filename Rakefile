# frozen_string_literal: true

DEST = 'profession.pdf'
SOURCE = DEST + '.rb'
BODY = 'fullText.txt'
BODY_SRC = 'profession.html'
BODY_URL = 'https://www.inf.ufpr.br/renato/profession.html'
FONTS = {'et-book-roman-line-figures.ttf' => 'https://github.com/edwardtufte/et-book/raw/gh-pages/et-book/et-book-roman-line-figures/et-book-roman-line-figures.ttf'}

task default: DEST

file DEST => [BODY, SOURCE] + FONTS.keys do
  ruby SOURCE
end

file BODY => BODY_SRC do
  `lynx -dump -nolist --display_charset=utf-8 #{BODY_SRC} > #{BODY}`
end

file BODY_SRC do
  `wget #{BODY_URL}`
end

FONTS.each do
  |f, u|

  file f do
    `wget #{u}`
  end
end
