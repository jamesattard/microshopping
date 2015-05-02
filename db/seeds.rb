# e = Category.create!(name: 'Electronicos')
# o = Category.create!(name: 'Ocio')
# v = Category.create!(name: 'Vestimenta')

# Subcategory.create!(name: 'Computadora', category_id: e.id)
# Subcategory.create!(name: 'Portatil', category_id: e.id)
# Subcategory.create!(name: 'Camara Digital', category_id: e.id)
# Subcategory.create!(name: 'Reproductor de Musica', category_id: e.id)

# juego = Subcategory.create!(name: 'Consola de Juego', category_id: o.id)
# Subcategory.create!(name: 'Juego Portable', category_id: o.id)

# Subcategory.create!(name: 'Ropa de Hombre', category_id: v.id)
# Subcategory.create!(name: 'Ropa de Ninos', category_id: v.id)
# Subcategory.create!(name: 'Ropa de Mujer', category_id: v.id)
# Subcategory.create!(name: 'Ropa de Ninas', category_id: v.id)

# ps4 = Product.create!(name: 'Playstation 4', description: 'Consola de video juegos de ultima generacion', subcategory_id: juego.id)

ps4 = Product.first

time = Time.now + 20.seconds
Auction.delete_all
20.times do
  Auction.create!(product_id: ps4.id, price: 1, started_at: time)    
  time = time + 1.minute
end
