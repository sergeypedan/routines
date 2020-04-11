FactoryBot.define do
  factory :drug_substance do
    drug { nil }
    substance { nil }
    dose { "9.99" }
    unit { "MyString" }
  end
end
