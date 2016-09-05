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
    assert capture_io("b\na", fn ->
      TriviaApp.validate_input("a", "b", 0, [%{question: "huh?", answer: "a"}])
    end) =~ "incorrect"
  end

  test "validates user input by checking it against answer and increases score if correct" do
    assert capture_io("b\na", fn ->
      TriviaApp.validate_input("b", "b", 0, [%{question: "huh?", answer: "a"}])
    end) =~ "correct!\nYour current score is 1"
  end
  
  test "uses :question as request_answer and :answer as correct_answer from @questions" do
    questions = [
                %{ question: "Is it a?", answer: "a" }, 
                %{ question: "Is it b?", answer: "b"}
                ]
    assert capture_io("a\nb", fn ->
      TriviaApp.ask_question(questions, 0)
    end) =~ "Is it a?"
  end

  test "updated score is printed when answer is correct" do
    questions = [
                %{ question: "Is it a?", answer: "a" }, 
                %{ question:  "Is it c?", answer: "c" }
                ]
    assert capture_io("a\nc", fn ->
      TriviaApp.ask_question(questions, 0)
    end) =~ "2"
  end

  test "given correct answers only, the game ends with a perfect score" do
    assert capture_io("a\nc\nc\nb\nc\nc\na\nb\nc\na", fn ->
      TriviaApp.start_quiz
    end) =~ "perfect score"
  end

  test "given incorrect answers, but also given the order to start again, quiz starts again" do
    assert capture_io("b\ny\na\nc\nc\nb\nc\nc\na\nb\nc\na", fn ->
      TriviaApp.start_quiz
    end) =~ "perfect score"
  end
end
