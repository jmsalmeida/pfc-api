# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'cpf_cnpj'

party_places_seed = [
  {
    main_contact: "Gabriel Araújo",
    name: "Cantinho da cerveja",
    cellphone: "(14) 93956-5298",
    address: {
      street: "Avenida Rio Branco",
      district: "Centro",
      city: "São Paulo",
      place_number: "100",
      postal_code: "20040002"
    }
  },

  {
    main_contact: "Maria Cecília",
    name: "Bosque",
    cellphone: "(19) 93938-1372",
    address: {
      street: "Rua Arlindo Nogueira",
      district: "Centro",
      city: "São Paulo",
      place_number: "101",
      postal_code: "64000290"
    }
  },

  {
    main_contact: "Rafaela da Cunha",
    name: "Cálice Efervescente",
    cellphone: "(12) 93232-7320",
    address: {
      street: "Avenida Afonso Pena",
      district: "Boa Viagem",
      city: "São Paulo",
      place_number: "102",
      postal_code: "30130005"
    }
  },

  {
    main_contact: "Luana Nascimento",
    name: "Claro como cristal",
    cellphone: "(16) 93243-7120",
    address: {
      street: "Rua Serra de Bragança",
      district: "Vila Gomes Cardim",
      city: "São Paulo",
      place_number: "103",
      postal_code: "03318000"
    }
  },

  {
    main_contact: "Esther Castro",
    name: "Joias líquidas",
    cellphone: "(16) 92856-8080",
    address: {
      street: "Travessa da CDL",
      district: "Centro",
      city: "São Paulo",
      place_number: "104",
      postal_code: "76900032"
    }
  },

  {
    main_contact: "Carolina Nunes",
    name: "Hora extra",
    cellphone: "(16) 93161-6757",
    address: {
      street: "Rua Carlos Augusto Cornelsen",
      district: "Bom Retiro",
      city: "São Paulo",
      place_number: "105",
      postal_code: "80520560"
    }
  },

  {
    main_contact: "Isadora das Neves",
    name: "Tudo menos água",
    cellphone: "(19) 92832-7193",
    address: {
      street: "Rodovia Raposo Tavares",
      district: "Lageadinho",
      city: "São Paulo",
      place_number: "106",
      postal_code: "06709015"
    }
  },

  {
    main_contact: "Emanuel Cavalcanti",
    name: "Insônia",
    cellphone: "(16) 92159-8631",
    address: {
      street: "Rua Maria Luísa do Val Penteado",
      district: "Cidade São Mateus",
      city: "São Paulo",
      place_number: "107",
      postal_code: "03962040"
    }
  },

  {
    main_contact: "Bruno Farias",
    name: "Revolução do chopp",
    cellphone: "(12) 93648-7658",
    address: {
      street: "Bahia",
      district: "Industrial",
      city: "São Paulo",
      place_number: "108",
      postal_code: "76842-098"
    }
  },

  {
    main_contact: "Rodrigo Souza",
    name: "Bar dos Deuses",
    cellphone: "(18) 93994-4781",
    address: {
      street: "Belo Horizonte",
      district: "Centro",
      city: "São Paulo",
      place_number: "109",
      postal_code: "69156-375"
    }
  },

  {
    main_contact: "Renan Melo",
    name: "Bar dos amigos",
    cellphone: "(13) 92864-8713",
    address: {
      street: "Piauí",
      district: "Vila Nova",
      city: "Boa Vista",
      place_number: "111",
      postal_code: "58926-583"
    }
  },

  {
    main_contact: "Ana Clara da Luz",
    name: "Bacon & Cerveja",
    cellphone: "(13) 93417-4814",
    address: {
      street: "Vitória",
      district: "São Francisco",
      city: "Nova Friburgo",
      place_number: "100",
      postal_code: "36676-492"
    }
  },

  {
    main_contact: "Breno Sales",
    name: "Acima das nuvens",
    cellphone: "(11) 93887-2434",
    address: {
      street: "Minas Gerais",
      district: "Boa Vista",
      city: "Parauapebas",
      place_number: "112",
      postal_code: "47344-185"
    }
  },

  {
    main_contact: "Isabelly Caldeira",
    name: "Conselhos em forma de chopp",
    cellphone: "(13) 92714-4508",
    address: {
      street: "Quinze",
      district: "São Francisco",
      city: "Patos",
      place_number: "113",
      postal_code: "78654-380"
    }
  },

  {
    main_contact: "Melissa Araújo",
    name: "Bar e Churrascaria de Bebidas",
    cellphone: "(13) 93018-1502",
    address: {
      street: "Pernambuco",
      district: "Boa Vista",
      city: "Iguatu",
      place_number: "114",
      postal_code: "64289-462"
    }
  },

  {
    main_contact: "Danilo Caldeira",
    name: "Copo sujo",
    cellphone: "(16) 93222-8379",
    address: {
      street: "Belo Horizonte",
      district: "São Cristóvão",
      city: "São José de Ribamar",
      place_number: "115",
      postal_code: "68916-020"
    }
  },

  {
    main_contact: "Ana Lívia Gomes",
    name: "País das maravilhas",
    cellphone: "(16) 93963-2998",
    address: {
      street: "Mato Grosso",
      district: "São Cristóvão",
      city: "Campina Grande",
      place_number: "116",
      postal_code: "25332-296"
    }
  },

  {
    main_contact: "Mariane Nunes",
    name: "Boemia",
    cellphone: "(16) 92181-7301",
    address: {
      street: "Industrial",
      district: "Amazonas",
      city: "Cabo de Santo Agostinho",
      place_number: "117",
      postal_code: "64308-670"
    }
  },

  {
    main_contact: "Theo Costa",
    name: "Amor e beijos",
    cellphone: "(14) 92297-7813",
    address: {
      street: "Paraná",
      district: "Santo Antônio",
      city: "Palmas",
      place_number: "118",
      postal_code: "59744-212"
    }
  },

  {
    main_contact: "Reginaldo Almeida",
    name: "Cervejaria do Urso",
    cellphone: "(14) 92297-7813",
    address: {
      street: "Rua Jamaica Uruguaiana",
      district: "Jardim Babilonia",
      city: "Suzano",
      place_number: "420",
      postal_code: "59744-212"
    }
  },
]

features = {
  drink_type_list: ['cervejas', 'vinhos', 'drinks', 'destilados'],
  food_type_list: ['porções', 'petiscos', 'lanches', 'almoço/jantar'],
  party_type_list: ['bar', 'restaurante', 'balada', 'tabacaria/lounge'],
  music_style_list: ['setanejo', 'forró', 'samba/pagode', 'funk', 'rap', 'mpb', 'rock', 'axé', 'eletrônica'],
}

def select_random_features(features)
  filtered_features = features.select do |type|
    random_number = SecureRandom.random_number(features.length)
    random_number.even?
  end

  if filtered_features.length < 1
    [features.first, features.last]
  else
    filtered_features
  end
end

party_places_seed.each do |place|
  ActiveRecord::Base::transaction do
    puts "#" * 30
    user = User.create!({
      email: "bar_#{SecureRandom.random_number(9999)}@colaaqui.com",
      password: "1234",
      user_type: "party_place"
    })
    puts "Create user #{user.email}"

    party_place = PartyPlace.create!({
      main_contact: place[:main_contact],
      name: place[:name],
      cnpj: CNPJ.generate,
      cellphone: place[:cellphone],
      user: user,
    })
    puts "Create party place #{party_place.id} for user #{user.email}"

    address = Address.create!({
      street: place[:address][:street],
      district: place[:address][:district],
      city: place[:address][:city],
      place_number: place[:address][:place_number],
      postal_code: place[:address][:postal_code],
      party_place: party_place
    })
    puts "Create Address for party place #{party_place.id}"

    party_feature = PartyFeature.create!({
      smoke_place: true,
      available_tables: true,
      party_place: party_place
    })
    puts "Create party features for party place #{party_place.id}"

    party_feature.completed = true
    party_feature.food_type_list.add(select_random_features features[:food_type_list])
    party_feature.drink_type_list.add(select_random_features features[:drink_type_list])
    party_feature.party_type_list.add(select_random_features features[:party_type_list])
    party_feature.music_style_list.add(select_random_features features[:music_style_list])
    party_feature.save!
    puts "Update party features"

    party_place.save!

    party_place.user.email_activate
    puts "Activate user"
    puts "#" * 30
  end
end