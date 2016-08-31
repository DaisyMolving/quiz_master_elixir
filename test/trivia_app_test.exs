defmodule TriviaAppTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TriviaApp

  test "requests a user input for a question" do
    assert capture_io(fn ->
      TriviaApp.request_answer("What's this?")
    end) == "What's this?"
  end

  test "validates user input by checking it against incorrect answer" do
    assert capture_io(fn ->
      TriviaApp.validate_input("a", "b")
    end) =~ "incorrect"
  end

  test "validates user input by checking it against correct answer" do
    assert capture_io(fn ->
      TriviaApp.validate_input("b", "b")
    end) =~ "next question"
  end
  
  test "score increases by one" do
    assert TriviaApp.increase_score(3) == 4
  end
end
