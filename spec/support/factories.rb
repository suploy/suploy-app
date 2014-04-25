FactoryGirl.define do
  factory :user, aliases: [:owner] do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:name) {|n| "user#{n}" }
    password "secretpassword"
    confirmation_sent_at = Time.now
    after(:create) { |user| user.confirm! }
  end

  factory :role do
    name "User"
    internal_name "user"
  end

  factory :app do
    sequence(:name) {|n| "myapp#{n}" }
    user FactoryGirl.create(:user)
  end
end
