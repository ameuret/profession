#!/usr/bin/env ruby

require 'prawn'
require 'prawn/measurement_extensions'

class Book
  include Prawn::View

  IGNORE = [/PROFESSION/i, /Asimov/].freeze

  def document
    @document ||= Prawn::Document.new page_size: 'A5'
  end

  def build
    textFile = File.open('fullText.txt')
    # zwsp = Prawn::Text::ZWSP
    shy = Prawn::Text::SHY
    # stroke_circle [0, 0], 10
    font('et-book-roman-line-figures.ttf')
    font_families.update('ETBembo' =>
                         {normal: {file:'et-book-roman-line-figures.ttf'}})
    font_families.update(
      'Shippori Gothic B2' =>
      {
        bold: { file: 'ShipporiGothicB2-Bold.ttf'}
      }
    )

    font_families.update(
      'Droid Sans Japanese' =>
      {
        normal: { file: 'DroidSansJapanese.ttf'}
      }
    )

    puts font_families
    puts '===='
    puts font.family

    canvas do
      bounding_box([20.mm, (210-20).mm], width: (297/2-20-20).mm, height: (210-20-20).mm) do
        # stroke_bounds
        text('PROFESSION', align: :center, size: 30)
        start_new_page
        text('PROFESSION', align: :center, size: 30)
        move_down 30.mm
        text('by', align: :center)
        text("\n", align: :center)
        text('Isaac Asimov', align: :center)
        move_down 100.mm

        # font('Shippori Gothic B2', style: :bold)
        font('Droid Sans Japanese', style: :normal)
        # text('Atelier 広尾', align: :center, fallback_fonts: ['ETBembo', 'Droid Sans Japanese'])
        text('Atelier 広尾', align: :center, fallback_fonts: ['ETBembo'], style: :normal)
        # text('Atelier 広尾', align: :center)
        font('ETBembo', style: :normal)
        # formatted_text(
        #   [
        #     { text: 'Atelier ' },
        #     { text: '広尾', font: 'Shippori Gothic B2', style: :bold }
        #   ])
        start_new_page
        move_down 110.mm
        text("Profession, copyright ©1957 by Street and Smith Publications, Inc.\nfrom ISAAC ASIMOV: THE COMPLETE STORIES OF VOL. 1\nby Isaac Asimov.\nUsed by permission of Doubleday, a division of Random House, Inc.", align: :left, size: 9)
        move_down 5.mm
        font('Droid Sans Japanese', style: :normal)
        text('Layout by Atelier 広尾, Tokyo, December 2023', fallback_fonts: ['ETBembo'], style: :normal, align: :left, size: 9)

        yPos = cursor
        image('profession.png', width:20.mm, at: [-5, yPos])
        move_down 20.mm
        font 'Courier'
        text('https://github.com/ameuret/profession', align: :left, size:8)
        font('ETBembo', style: :normal)
        start_new_page
        # stroke_axis
        idx = 0
        prevLineBlank = false
        prevLine = ''

        textFile.each_line() do
          |line|

          lineBlank = line.strip.empty?
          line = line.strip + "\n" unless lineBlank && prevLineBlank
          if prevLineBlank
            line = line
          end
          idx += 1
          next if lineBlank && prevLineBlank
          next if IGNORE.any? {|exp| line.match exp  }

          if line.match /[a-z]\s$/
            prevLine = line
            next
          else
            unless prevLine.empty?
              # puts "Prepending prev line ending with lower-case"
              line = prevLine.strip + ' ' + line
              prevLine = ''
            end
          end

          line.gsub!('^', "")
          line.gsub!('“ ', '“')
          line.gsub!(/”([A-Z])/, '“\1')
          line.gsub!(' ”', '”')
          line.gsub!('””', '”')
          line.gsub!(/\.([^\s)”“])/, '. \1')
          line.gsub!('screaming', "screa#{shy}ming")
          line.gsub!('understand', "under#{shy}stand")
          line.gsub!('Junior', "Ju#{shy}nior")
          line.gsub!('consider', "con#{shy}si#{shy}der")
          line.gsub!('already', "al#{shy}ready")
          line.gsub!('thinking', "thin#{shy}king")
          line.gsub!('vacuum', "va#{shy}cuum")
          line.gsub!('watching', "wat#{shy}ching")
          line.gsub!('Laborer', "La#{shy}bo#{shy}rer")
          line.gsub!('psychologist', "psy#{shy}cho#{shy}logist")
          line.gsub!('Metallurgy', "Me#{shy}tal#{shy}lurgy")
          line.gsub!('Computer', "Com#{shy}pu#{shy}ter")
          line.gsub!('Programmer', "Pro#{shy}gram#{shy}mer")
          line.gsub!('programming', "pro#{shy}gram#{shy}ming")
          line.gsub!('understanding', "under#{shy}stand#{shy}ing")
          line.gsub!('pandemonium', "pan#{shy}demo#{shy}nium")
          line.gsub!('beginning', "be#{shy}gin#{shy}ning")
          line.gsub!('Antonelli', "An#{shy}to#{shy}nelli")
          line.gsub!('negligently', "ne#{shy}gli#{shy}gently")
          line.gsub!('different', "dif#{shy}ferent")
          line.gsub!('background', "back#{shy}ground")
          line.gsub!('leaving', "leav#{shy}ing")
          line.gsub!('center', "cen#{shy}ter")
          line.gsub!('corner', "cor#{shy}ner")
          line.gsub!('conscious', "con#{shy}scious")
          line.gsub!('nothing', "no#{shy}thing")
          line.gsub!('earnestly', "earn#{shy}estly")
          line.gsub!('explained', "ex#{shy}plained")
          line.gsub!('number', "num#{shy}ber")
          line.gsub!('sharpened', "shar#{shy}pened")
          line.gsub!('drumming', "drum#{shy}ming")
          line.gsub!('completely', "comp#{shy}lete#{shy}ly")
          line.gsub!('competition', "com#{shy}peti#{shy}tion")
          line.gsub!('Contestant', "Con#{shy}tes#{shy}tant")
          line.gsub!('potentially', "po#{shy}ten#{shy}tially")
          line.gsub!('Registered', "Re#{shy}gi#{shy}stered")
          line.gsub!('thoughtfully', "thought#{shy}ful#{shy}ly")
          line.gsub!('relationship', "re#{shy}la#{shy}tion#{shy}ship")
          line.gsub!('reprisal', "re#{shy}pri#{shy}sal")
          line.gsub!('advancing', "ad#{shy}van#{shy}cing")
          line.gsub!('Educative', "Edu#{shy}cati#{shy}ve")
          line.gsub!('Educational', "Edu#{shy}catio#{shy}nal")
          line.gsub!('Education', "Edu#{shy}ca#{shy}tion")
          line.gsub!('individual', "indi#{shy}vi#{shy}dual")
          line.gsub!('Distinguished', "Dis#{shy}tin#{shy}guished")
          line.gsub!('Transportation', "Trans#{shy}por#{shy}tation")
          line.gsub!('Rationalization', "Ratio#{shy}nali#{shy}ation")
          line.gsub!('accomplishment', "ac#{shy}com#{shy}pli#{shy}shment")
          line.gsub!('Microspectrograph', "Micro#{shy}spec#{shy}tro#{shy}graph")
          line.gsub!('Spectrograph', "Spec#{shy}tro#{shy}graph")
          line.gsub!('communication', "com#{shy}muni#{shy}ca#{shy}tion")
          line.gsub!('gleaming', "glea#{shy}ming")
          line.gsub!('structure', "struc#{shy}ture")
          line.gsub!('machine', "ma#{shy}chine")
          line.gsub!('grandfather', "grand#{shy}father")
          line.gsub!('always', "al#{shy}ways")
          line.gsub!('mustache', "mus#{shy}tache")
          line.gsub!('himself', "him#{shy}self")
          line.gsub!('thinning', "thin#{shy}ning")
          line.gsub!('happy', "hap#{shy}py")
          line.gsub!('nonexistent', "non#{shy}exis#{shy}tant")
          line.gsub!('sensation', "sen#{shy}sa#{shy}tion")
          line.gsub!('extraordinary', "extra#{shy}ordi#{shy}nary")
          line.gsub!('exception', "ex#{shy}cep#{shy}tion")
          line.gsub!('Furthermore', "Fur#{shy}ther#{shy}more")
          line.gsub!('furthermore', "fur#{shy}ther#{shy}more")
          line.gsub!('everywhere', "every#{shy}where")
          line.gsub!('throughout', "through#{shy}out")
          line.gsub!('name', "na#{shy}me")
          line.gsub!('Olympics', "Olym#{shy}pics")
          line.gsub!('Scientist', "Scien#{shy}tist")
          line.gsub!('nearly', "near#{shy}ly")
          line.gsub!('shining', "shi#{shy}ning")
          line.gsub!('anyway', "any#{shy}way")
          line.gsub!('Historian', "Hi#{shy}sto#{shy}rian")
          line.gsub!('important', "im#{shy}por#{shy}tant")
          line.gsub!('disturbance', "dis#{shy}tur#{shy}ban#{shy}ce")
          line.gsub!('policeman', "po#{shy}lice#{shy}man")
          line.gsub!('technician', "tech#{shy}ni#{shy}cian")
          line.gsub!('excitement', "ex#{shy}cit#{shy}ment")
          line.gsub!('handling', "hand#{shy}ling")
          line.gsub!('amused', "am#{shy}used")
          line.gsub!('suddenly', "sud#{shy}denly")
          text(line, size: 12, align: :justify)
          prevLineBlank = line.strip.empty?
        end

        pagi = '<page>'
        # Green page numbers 1 to 7
        options = {
          at: [bounds.right - 10.mm, bounds.top + 12.mm],
          width: 10.mm,
          align: :right,
          start_count_at: 1,
          page_filter: ->(n) {n>3},
        }
        number_pages pagi, options

        textFile.close
      end
    end
  end
end

book = Book.new
book.build

book.render_file('profession.pdf')
