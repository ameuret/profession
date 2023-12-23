DEST = 'profession.pdf'
SOURCE = DEST + '.rb'
BODY = 'fullText.txt'
BODY_SRC = 'profession.html'
BODY_URL = 'https://www.inf.ufpr.br/renato/profession.html'

task :default => DEST

file DEST => [BODY, SOURCE] do
  ruby SOURCE
end

file BODY => BODY_SRC do
  `lynx -dump -nolist --display_charset=utf-8 profession.html > #{BODY}`
end

file BODY_SRC do
  `wget #{BODY_URL}`
end
