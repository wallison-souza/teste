namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do
    puts "Gerando dados Contacts"
    10.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        kind: Kind.all.sample,
        rmk: Faker::Lorem.paragraph
      )
    end
    puts "Dados Contacts gerados"

    puts "Gerando dados Address"
    Contact.all.each do |contact|
      Address.create!(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        contact: contact
      )

    end
    puts "Gerando dados Phones"
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
          contact: contact,
          phone: Faker::PhoneNumber.phone_number
        )
      end
    end
    puts "Dados Phones gerados"

  end

end
