FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:name) {|n| "user#{n}" }
    password "secretpassword"
    password_confirmation { password }
    confirmation_sent_at { Time.now }
    after(:create) { |user| user.confirm! }
  end
end
