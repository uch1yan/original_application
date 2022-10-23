FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@example.com' }
    password { 'testpass' }
    admin { false }
  end

  factory :second_user, class: User do
    name { 'test2' }
    email { 'test2@example.com' }
    password { 'test2pass' }
    admin { false }
  end

  factory :third_user, class: User do
    name { 'test3' }
    email { 'test3@example.com' }
    password { 'test3pass' }
    admin { false }
  end


  factory :admin_user, class: User do
    name { 'test_admin' }
    email { 'admin@example.com' }
    password { 'adminpass'}
    admin { true }
  end
end
