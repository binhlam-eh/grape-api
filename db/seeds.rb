15.times do
  Book.create!(
    isbn: Faker::Number.number(digits: 4),
    title: Faker::Superhero.power,
    stock: Faker::Number.between(from: 2, to: 19)
  )
end

book_ids = Book.ids

95.times do
  Flow.create!(
    book_id: book_ids.sample,
    newStock: Faker::Number.between(from: 2, to: 15),
    previousStock: Faker::Number.between(from: 2, to: 15)
  )
end
