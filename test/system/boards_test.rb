require "application_system_test_case"


class BoardsTest < ApplicationSystemTestCase
  test "create a new board  - success" do
    visit root_path

    assert_selector "h2", text: "Create a new Board"
    assert_selector "form[action='#{create_board_path}'][method='post']"

    fill_in "email", with: "user@example.com"
    fill_in "rows", with: "10"
    fill_in "cols", with: "10"
    fill_in "mines", with: "15"

    click_button "Generate Board"
    page.has_content?('Success')
  end

  test "viewing a board" do
    board = boards(:one)
  
    visit board_path(board)
  
    assert_text board.email
    assert_text board.rows
    assert_text board.cols
    assert_text board.mines.count
  end

  test "create a new board - failure" do
    visit root_path
  
    assert_selector "h2", text: "Create a new Board"
    assert_selector "form[action='#{create_board_path}'][method='post']"
  
    click_button "Generate Board"
  
    page.has_xpath?("//input[@required='required']")
  end

end
