require "application_system_test_case"

class MovieCastsTest < ApplicationSystemTestCase
  setup do
    @movie_cast = movie_casts(:one)
  end

  test "visiting the index" do
    visit movie_casts_url
    assert_selector "h1", text: "Movie Casts"
  end

  test "creating a Movie cast" do
    visit movie_casts_url
    click_on "New Movie Cast"

    fill_in "Cast crew detail", with: @movie_cast.cast_crew_detail_id
    fill_in "Movie", with: @movie_cast.movie_id
    fill_in "Role name", with: @movie_cast.role_name
    click_on "Create Movie cast"

    assert_text "Movie cast was successfully created"
    click_on "Back"
  end

  test "updating a Movie cast" do
    visit movie_casts_url
    click_on "Edit", match: :first

    fill_in "Cast crew detail", with: @movie_cast.cast_crew_detail_id
    fill_in "Movie", with: @movie_cast.movie_id
    fill_in "Role name", with: @movie_cast.role_name
    click_on "Update Movie cast"

    assert_text "Movie cast was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie cast" do
    visit movie_casts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie cast was successfully destroyed"
  end
end
