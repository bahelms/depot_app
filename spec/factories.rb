FactoryGirl.define do
  factory :product do
    title        'Foobar in Action'
    description  'Watch Foobar at work!'
    price         24.99
    image_url    'foobar.png'
  end

  factory :cart do
  end

  factory :line_item do
    price 15.99
    quantity 2
  end
end
