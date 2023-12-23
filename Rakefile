DEST = 'profession.pdf'
SOURCE = DEST + '.rb'

task :default => DEST

file DEST => ['fullText.txt', SOURCE] do
  ruby SOURCE
end
