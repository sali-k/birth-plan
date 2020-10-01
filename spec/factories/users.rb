require 'faker'

FactoryBot.define do
  factory :user do
    name     { '太郎' }
    email    { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 8)
    password { password}
    password_confirmation {password}
    # password              { 'a12345678' }
    # password_confirmation { password }
    introduction          { 'はじめまして' }
    relationship          { '夫' }
  end
end
