FactoryGirl.define do
  factory :admin do
    sequence(:name)       { |n| "Person #{n}" }
    sequence(:email)      { |n| "person_#{n}@example.com" }
    password              "foobar"
    password_confirmation "foobar"
    
    factory :super_admin do
      super_admin true
    end
  end
  
  factory :campana do
    content_id      1
    name            "campana_1"
    tipo            1
    client          "campana_1"
    goal            100
    status          1
  end
  
  factory :contenido do
      name          "noticia_1"
      tipo          1
      provider      "proveerdor_1"
      category_id   0
      end_date      DateTime.strptime('12-JUL-14', '%d-%b-%y')
      status        1
      campana
  end
end

#sequence(content_id)  { |n| n }
#sequence(name)        { |n| "campana_#{n}" }
#tipo            1
#client          "cliente_1"
#goal            100
#status          1