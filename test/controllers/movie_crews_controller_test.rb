require 'test_helper'

class MovieCrewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_crew = movie_crews(:one)
  end

  test "should get index" do
    get movie_crews_url
    assert_response :success
  end

  test "should get new" do
    get new_movie_crew_url
    assert_response :success
  end

  test "should create movie_crew" do
    assert_difference('MovieCrew.count') do
      post movie_crews_url, params: { movie_crew: { cast_crew_detail_id: @movie_crew.cast_crew_detail_id, department_id: @movie_crew.department_id, movie_id: @movie_crew.movie_id } }
    end

    assert_redirected_to movie_crew_url(MovieCrew.last)
  end

  test "should show movie_crew" do
    get movie_crew_url(@movie_crew)
    assert_response :success
  end

  test "should get edit" do
    get edit_movie_crew_url(@movie_crew)
    assert_response :success
  end

  test "should update movie_crew" do
    patch movie_crew_url(@movie_crew), params: { movie_crew: { cast_crew_detail_id: @movie_crew.cast_crew_detail_id, department_id: @movie_crew.department_id, movie_id: @movie_crew.movie_id } }
    assert_redirected_to movie_crew_url(@movie_crew)
  end

  test "should destroy movie_crew" do
    assert_difference('MovieCrew.count', -1) do
      delete movie_crew_url(@movie_crew)
    end

    assert_redirected_to movie_crews_url
  end
end
