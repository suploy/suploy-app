FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:name) {|n| "user#{n}" }
    password "secretpassword"
    confirmation_sent_at = Time.now
    after(:create) { |user| user.confirm! }
  end

  factory :app do
    sequence(:name) {|n| "myapp#{n}" }
    after(:create) { |app| app.confirm! }
  end
end
