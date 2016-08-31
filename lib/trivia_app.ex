defmodule TriviaApp do

  def request_answer(question) do
    IO.gets(question)
  end

  def validate_input(user_input, correct_answer) do
    cond do
      String.equivalent?(user_input, correct_answer) ->
        request_answer("next question")
      :else ->
        print_incorrect_message
    end
  end

  def increase_score(current_score) do
    current_score + 1
  end

  defp print_incorrect_message do
    IO.puts "incorrect"
  end
end
