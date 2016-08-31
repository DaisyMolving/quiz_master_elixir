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
      TriviaApp.validate_input("a", "b", 0)
    end) =~ "incorrect"
  end

  test "validates user input by checking it against answer and increases score if correct" do
    assert capture_io(fn ->
      TriviaApp.validate_input("b", "b", 0)
    end) =~ "next question, your current score is 1"
  end
  
end
