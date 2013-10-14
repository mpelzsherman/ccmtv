class CleanupCountryDupes < ActiveRecord::Migration

  def change
    cleanup_countries
    merge_countries
  end

  def cleanup_countries
    country_map = {
      'Austrian' => 'Austria',
      'Mexican' => 'Mexico',
      'Azerbaijani' => 'Azerbaijan',
      'Bosnia-Herzegovina' => 'Bosnia and Herzegovina',
      'California' => 'USA',
      'America' => 'USA',
      'Czechoslovakia' => 'Czech Republic',
      'German' => 'Germany',
      'Kansas' => 'USA'
    }
    country_map.each do |bad, good|
      execute "update countries set name = '#{good}' where name = '#{bad}'"
    end
  end

  def merge_countries
    good_countries = {}
    duplicate_countries = {}
    Country.order('name').each do |country|
      if !good_countries[country.name]
        good_countries[country.name] = country
        merge_country(country)
      else
        if duplicate_countries.has_key? country.name
          duplicate_countries[country.name] << country
        else
          duplicate_countries[country.name] = [country]
        end
      end
    end

    duplicate_countries.values.each do |countries|
      countries.map {|c| c.delete }
    end
  end

  def merge_country(country)
    execute "update people set birth_country_id = #{country.id} where birth_country_id in (select id from countries where name = '#{country.name}')"
    execute "update people set death_country_id = #{country.id} where death_country_id in (select id from countries where name = '#{country.name}')"
  end

end
