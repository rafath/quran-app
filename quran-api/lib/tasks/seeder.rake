# frozen_string_literal: true

namespace :seeder do
  task :create_chapters => :environment do
    File.readlines('tmp/0/0_sury.txt').each do |line|
      name, id, ayets_qty, pl_name = *line.split('|')
      Chapter.create(
        name: name,
        pl_name: pl_name.strip,
        chapter_number: id,
        ayets_quantity: ayets_qty,
        slug: [SecureRandom.hex(8), 99, id] * ''
      )
    end
  end

  task :create_ayets => :environment do
    (1..114).each do |sura|
      File.readlines("tmp/0/#{sura}.txt").each do |line|
        chapter_id, ayet, content = *line.split('|')
        content.gsub!(/\t/, '')

        puts "#{chapter_id} #{ayet} #{sura}"

        Ayet.create(
          chapter_id: chapter_id,
          ayet_number: ayet,
          content: content.strip,
          slug: [SecureRandom.hex(8), 90, chapter_id, 0, ayet] * ''
        )
      end
    end
  end

  task :add_history => :environment do
    (1..114).each do |sura|
      body = File.read("tmp/0/#{sura}_historia.txt")
      chapter = Chapter.find(sura)
      chapter.update(history: body&.strip&.gsub(/\t|\r\n/, ' '))

    rescue Errno::ENOENT
      puts "brak pliku dla #{sura}"
    end
  end

  task :add_notes => :environment do
    (1..114).each do |sura|
      File.readlines("tmp/0/#{sura}_przypisy.txt").each do |line|
        line.strip!

        chapter_id, ayet_id, note = *line.split('|')

        ayet = Ayet.find_by(chapter_id: chapter_id, ayet_number: ayet_id)
        puts "#{chapter_id} #{ayet_id} #{sura}"
        ayet.update(note: note&.strip&.gsub(/\t|\r\n/, ' '))
      end
    rescue Errno::ENOENT
      puts "brak pliku dla #{sura}"
    end
  end
end
