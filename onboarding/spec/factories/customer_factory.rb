FactoryBot.define do
  factory :customer do
    name { 'John' }
    document {'1234567'}
    active  { true }
  end
end
