namespace :seeds do

  desc "Generate seed fu seed data files from Excel spreadsheet"
  task :generate => :environment do

    # assumes countries have already been loaded

    require 'spreadsheet'
    composers_seed_file_path = File.join(Rails.root, 'db/fixtures/005__composers.rb')
    SeedFu::Writer.write(composers_seed_file_path, :class_name => 'Person', :constraints => [:first_name, :last_name]) do |writer|
      book = Spreadsheet.open File.join(Rails.root, 'db', 'composers.xls')
      sheet1 = book.worksheet 0
      sheet1.each_with_index do |row, idx|
        next if idx == 0
        name = row[1..7].join(' ').gsub(/\s+/, ' ').strip!
        dob = row[9] && row[10] ? "#{row[9]} #{row[10]}, #{row[11]}" : row[11]
        dod = row[14] && row[15] ? "#{row[14]} #{row[15]}, #{row[16]}" : row[16]
        birth_country = Country.find(:first, :conditions => ["name like '#{row[13]}'"])
        birth_country_id = birth_country ? birth_country.id : nil
        death_country = Country.find(:first, :conditions => ["name like '#{row[18]}'"])
        death_country_id = death_country ? death_country.id : nil
        writer.add(:composer => 1, :canonical_name => name, :first_name => row[2], :last_name => row[5],
                   :date_of_birth => dob, :place_of_birth => row[12], :birth_country_id => birth_country_id,
                   :date_of_death => dod, :place_of_death => row[17], :death_country_id => death_country_id,
                   :wikipedia_url => row[19])
      end
    end
    puts "#{composers_seed_file_path} generated!"

  end

end