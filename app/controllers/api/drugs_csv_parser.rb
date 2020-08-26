require 'csv'

csv_options = { col_sep: ',', 
	quote_char: '"', 
	headers: :first_row }
filepath    = 'drugs.csv'

CSV.foreach(filepath, csv_options) do |row|
  puts "#{row['Name']}, a #{row['Galenic']} drug from #{row['Action']}"
end
