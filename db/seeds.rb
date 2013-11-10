def title
  ((0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a).sample(10).join
end

publishers = Publisher.create([{name: 'ascii'}, {name: 'oreilly'}, {name: 'pragprog'}, {name: 'tatsujin'}])
authors = Author.create([{name: 'bob'}, {name: 'alice'}, {name: 'joh'}, {name: 'sam'}])

20.times do |i|
  Book.create(title: title, price: rand(10000), publisher: publishers.sample, authors: [authors.sample])
end

