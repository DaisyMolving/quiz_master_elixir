defmodule TriviaApp do

  def start_quiz do
    initial_score = 0
    validate_input(request_answer("What is your name?"), "Daisy", initial_score)
  end

  def request_answer(question) do
    IO.gets(question)
  end

  def validate_input(user_input, correct_answer, score) do
    cond do
      String.equivalent?(user_input, correct_answer) ->
        current_score = increase_score(score)
        request_answer("next question, your current score is #{current_score}")
      :else ->
        print_incorrect_message
    end
  end

  defp increase_score(score) do
    score + 1
  end

  defp print_incorrect_message do
    IO.puts "incorrect"
  end
end
