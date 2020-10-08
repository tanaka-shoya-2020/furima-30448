FactoryBot.define do
  factory :user do
    name                    {Faker::Name.name}
    email                   {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password {password}
    password_confirmation   {password}
    family_name             {Gimei.last.kanji}
    first_name              {Gimei.first.kanji}
    family_name_kana        {Gimei.last.katakana}
    first_name_kana         {Gimei.first.katakana}
    birthday                {Faker::Date.birthday(min_age:5 ,max_age:90)}
  end
end