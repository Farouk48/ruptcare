require 'csv'

csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
filepath    = 'drugs.csv'

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', '', '']

end
