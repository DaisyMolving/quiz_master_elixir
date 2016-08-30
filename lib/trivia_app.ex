defmodule TriviaApp do

  def request_answer(question) do
    IO.gets(question)
  end

  def validate_input(user_input, correct_answer) do
    cond do
      String.equivalent?(user_input, correct_answer) ->
        "add 1 to score, ask next question"
      :else ->
        print_incorrect_message
    end
  end

  def print_incorrect_message do
    IO.puts "incorrect"
  end
end
