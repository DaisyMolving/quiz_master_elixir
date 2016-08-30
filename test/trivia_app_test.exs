defmodule TriviaAppTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TriviaApp

  test "requests a user input for a question" do
    assert capture_io(fn ->
      TriviaApp.request_answer("What's this?")
    end) == "What's this?"
  end

  test "checks user input against answer" do
    assert capture_io(fn ->
      TriviaApp.validate_answer("a", "b")
    end) =~ "incorrect"
  end

end
