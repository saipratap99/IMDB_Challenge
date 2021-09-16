require "application_system_test_case"

class MovieCrewsTest < ApplicationSystemTestCase
  setup do
    @movie_crew = movie_crews(:one)
  end

  test "visiting the index" do
    visit movie_crews_url
    assert_selector "h1", text: "Movie Crews"
  end

  test "creating a Movie crew" do
    visit movie_crews_url
    click_on "New Movie Crew"

    fill_in "Cast crew detail", with: @movie_crew.cast_crew_detail_id
    fill_in "Department", with: @movie_crew.department_id
    fill_in "Movie", with: @movie_crew.movie_id
    click_on "Create Movie crew"

    assert_text "Movie crew was successfully created"
    click_on "Back"
  end

  test "updating a Movie crew" do
    visit movie_crews_url
    click_on "Edit", match: :first

    fill_in "Cast crew detail", with: @movie_crew.cast_crew_detail_id
    fill_in "Department", with: @movie_crew.department_id
    fill_in "Movie", with: @movie_crew.movie_id
    click_on "Update Movie crew"

    assert_text "Movie crew was successfully updated"
    click_on "Back"
  end

  test "destroying a Movie crew" do
    visit movie_crews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movie crew was successfully destroyed"
  end
end
