FactoryBot.define do
  factory :health_marker do
    name_en { "MyString" }
    name_ru { "MyString" }
    unit { "MyString" }
    healthy_value { 1.5 }
    healthy_value_source_name { "MyString" }
    healthy_value_source_url { "MyString" }
  end
end
