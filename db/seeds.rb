# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

["Saxes and other Woodwinds", "Brass", "Guitars and Amps", "Orchestral Strings", "Miscellaneous"].each do |category_name|
  c = Category.find_or_create_by!(slug: category_name.parameterize)
  if c
    c.title = category_name
    c.save
  end
end

if Rails.env == 'development' # safety for production

  # ALSO NOTE From the original site the YEAR AND CONDITION are FLIP FLOPPING
saprano_saxes = [
  #['Manufacturer', 'Model', 'Serial #', 'Condition', 'Year', 'Price', 'Comments'],
 ['Buescher', 'Vintage alto', '106162', "1920's", 'VG +', '$300', 'Wonderful playing and looking vintage alto /td>'],
 ['Buffet', 'Super Dyna Action S-1', 'TBA', "Late 1970's", 'VG +', '$1500', 'Pending repairs /td>'],
 ['Cannonball', 'Big Bell', '110811', "2000's", 'VG+', '$1700', 'Beautiful Blk nicle w/ silver keys'],
 ['Cannonball', 'Big Bell Stone series', '114112', "2000's", 'EX', '$1800', 'SOLD/td>'],
 ['Cannonball', 'Big Bell Stone series', '114093', "2000's", 'EX', '$1800', 'BSOLD'],
 ['Import', 'Alto sax', '8102022', "2020's", 'AS NEW !', '$700', 'Import Nicely done'],
 ['Jupiter', 'JAS-869', '5755', "2000's", 'VG++', '$1200', 'Silver w/ gold keys . Sterling silver neck'],
 ['Jupiter', 'JAS-869', '1655', "2000's", 'VG+', '$1100', 'Silver w/ gold keys . Sterling silver neck'],
 ['Kessler', 'Custom', '1322932', "2000's", 'VG+', '$1000', 'Satin brass finish . highly engraved'],
 ['Keilwerth', 'SX-90', '105648', "2000's", 'EX', '$2800', 'Pro model AS NEW made in Germany'],
 ['Keilwerth', 'SX-90R', '1223571', "2000's", 'NEW !', '$3500', 'SOLD'],
 ['Martin', 'The Indiana', '40512', "1960's", 'VG', '$500', 'Classic USA alto'],
 ['Martin', 'Typewriter !', '99173', '1930', 'VG +', '$1000', 'SOLD'],
 ['Selmer', 'Balanced Action alto', '22778', '1936', 'VG ++', '$4500', 'SOLD'],
 ['Selmer', 'MK VII alto', '292141', "mid 70's", 'EX', '$3000', 'SOLD'],
 ['Selmer', 'MK VI', '216953', 'VG+', '1973', '$6000', 'Pending overhaul'],
 ['Selmer', 'MK VI', '99,519', 'VG+', '1962', '$7000', 'SOLD'],
 ['Selmer', 'S-80', '326132', 'EX', '19881', '$3000', 'Exceptional condition !'],
 ['Selmer', 'S-80', '371146', 'VG++', '1986', '$3000', 'Great condition ! Fresh overhaul'],
 ['Selmer', 'S-80', '379117', 'VG', '1987', '$2800', 'Some finish issues'],
 ['Selmer', 'S-80', '324059', 'VG', '1982', '$3000', 'One owner'],
 ['Selmer', 'S-80III', 'N683860', '2022', 'EX', "2000's", '$3700', 'As new !'],
 ['Selmer', 'Reference 54', '805120', 'EX+', '2022', '$4500', 'SOLD'],
 ['Yamaha', 'YAS-32/52', '50890', 'EX', "80's", '$1500', 'Early Purple Logo mdl'],
 ['Yamaha', 'YAS-32/52', '208590', 'EX', "80's", '$1400', 'Early Purple Logo mdl'],
 ['Yamaha', 'YAS-34II', '16495', 'VG+', "2000's", '$1400', 'Same as YAS-475'],
 ['Yamaha', 'YAS-52', '6140', 'EX', "1990's", '$1700', 'As new , closet queen'],
 ['Yamaha', 'YAS-52', '20801', 'VG++', "2000's", '$1500', 'Earlier model'],
 ['Yamaha', 'YAS-575AL', '5638', 'VG+', "2000's", '$1500', 'SOLD'],
 ['Yamaha', 'YAS-61', '11450', 'VG+', "1975's", '$1700', 'SOLD'],
 ['Yamaha', 'YAS-62', '27306', 'EX', "1980's", '$2300', 'Purple Logo !'],
 ['Yamaha', 'YAS-62II', '196221', 'EX', "2000's", '$2400', 'As new'],
 ['Yamaha', 'YAS-62II', 'C48224', 'EX+', "2000's's", '$2500', 'Close to new'],
 ['Yamaha', 'YAS-62III', 'F04601', 'NEW', "2000's's", '$2600', 'SOLD'],
 ['Yamaha', 'YAS-855', '38706', 'VG+', "2000's", '$2500', 'Lacquer wear on the back side'],
 ['Yamaha', 'YAS-875', '24699', 'EX', "2000's", '$3000', 'Orig model 875'],
 ['Yamaha', 'YAS-875', '9516', 'VG+', "2000's's", '$2900', 'Early top pro mdl'],
 ['Yamaha', 'YAS-875', '13132', 'EX+', "2000's's", '$3100', 'As close to new as you can get'],
 ['Yamaha', 'YAS-875', '7943', 'EX+', "2000's's", '$3100', 'As new condition'],
 ['Yamaha', 'YAS-875', '11855', 'EX+', "2000's's", '$3100', 'As new condition'],
 ['Yamaha', 'YAS-875EX', 'C040504', 'VG++', "2000's", '$3000', 'Top of the line Ymaha alto'],
 ['Yamaha', 'YAS-82Z', '327831', 'EX', "2000's", '$3000', 'Top of the line alto'],
 ['Yamaha', 'YAS-82Z', '58883', 'VG+', "2000's", '$3000', 'Top of the line alto'],
 ['Yanagisawa', 'A-5', '3731161', 'EX', "Late 60's", '$1800', 'Early Yani , Dorado stencil , as new@'],
 ['Yanagisawa', 'A-902', '310302', 'VG', "2000's", '$2200', 'lacquer wear on the keys'],
 ['Yanagisawa', 'A-902', '291008', 'EX', "2000's", '$2700', 'As close to new as you can get!'],
 ['Yanagisawa', 'A-991', '290901', 'EX', "2000's", '$2800', 'very close to new condition']
]

saprano_saxes.each do |s|
  next if Instrument.find_by(serial_no: s[2]).present?
# remove dollar sign to make integer
  i = Instrument.new(manafacturer: s[0], model_type: s[1], serial_no: s[2], condition: s[3], year: s[4], price: s[5].tr('^0-9', ''), details: s[6])
  timetest = Time.find_zone('Alaska').local(s[4].to_i,1,1)

  i.year = timetest if timetest
  i.year = nil if timetest.year < 1000
  if !i.year.present?
    i.year_est = s[4]
  end
  i.save
end
end # production safety
