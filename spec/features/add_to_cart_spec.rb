require 'rails_helper'

RSpec.feature "able to click 'Add to Cart' buttons for one of the products and update cart", type: :feature, js: true do


  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "Click 'add to cart' and update cart" do

    visit root_path

    first("article.product").find("button.btn-primary").trigger("click")

    expect(page).to have_text 'My Cart', count: 1

  end
end