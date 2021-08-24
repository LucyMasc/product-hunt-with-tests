require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase


  test "visit index" do
    visit root_url

    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "let a signed in user create a product" do
    login_as users(:lucy)
    visit root_url
    # save_and_open_screenshot
    click_on "New Product"

    fill_in "Name", with: "Test"
    fill_in "Tagline", with: "Best test in your life"

    click_on "Create Product"
    # save_and_open_screenshot
    assert_equal root_path, page.current_path
    assert_text "Best test in your life"
  end

  test "let a signed in user update product" do
    login_as users(:lucy)
    product = products(:skello)
    visit product_url(product)

    # assert_text "Skello"

    click_on "Update product"

    fill_in "Name", with: "Testing the update"
    fill_in "Tagline", with: "Taking advantage and testing the tagline alsoP"
    click_on "Update Product"

    assert_equal root_path, page.current_path
    assert_text "Taking advantage and testing the tagline alsoP"
  end

  test "destroy product" do
    login_as users(:lucy)
    product_count = Product.count
    product = products(:skello)
    # visit root_path
    # save_and_open_screenshot
    visit product_url(product)
    save_and_open_screenshot

    click_on "Destroy Product"
    # save_and_open_screenshot

    assert_equal root_path, page.current_path
    assert_equal (product_count - 1), Product.count
    assert_text "Product sucessfully destroyed"
    save_and_open_screenshot

  end

end
