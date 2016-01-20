require 'csv'
require 'json'
require 'pry'

def curl_command
`curl https://data.ny.gov/api/views/d6yy-54nr/rows.json?accessType=DOWNLOAD`
end

dataset = JSON.parse(curl_command)
columns = dataset['meta']['view']['columns'].map{|c| c['name'] }
CSV.open('lottery.csv', 'w') do |csv|
  csv << columns
  dataset['data'].each do |row|
    csv << row.map{|element| element.to_s.gsub("{\n}","") }
  end
end

f = File.open('lottery.json', 'wb')
CSV.foreach('lottery.csv', headers: true) do |row|
  f.write("{ \"index\" : { \"_index\" : \"lottery\", \"_type\" : \"draw\", \"_id\" : \"#{row['id']}\" } }\n")
  f.write "#{row.to_hash.to_json}\n"
end
f.close
