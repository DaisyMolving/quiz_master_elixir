defmodule TriviaAppTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TriviaApp

  test "asks a question" do
    assert capture_io(fn ->
      TriviaApp.request_answer("What's this?")
    end) == "What's this?"
  end


end
