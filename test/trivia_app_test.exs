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
    end) =~ "correct\nYour current score is 1"
  end
  
  test "uses :question as request_answer and :answer as correct_answer from @questions" do
    questions =  [%{ question: "Samite is a type of what: a) Fabric? b) Stone? c) Dog? d) Cake?", answer: "a" }, %{ question:  "Vermillion is a shade of which colour: Green; Blue; Red; or Yellow?", answer: "c" }]
    assert capture_io("a", fn ->
      TriviaApp.ask_question(questions)
    end) =~ "Samite"

    assert capture_io("a", fn ->
      TriviaApp.ask_question(questions)
    end) =~ "correct"
  end
end
