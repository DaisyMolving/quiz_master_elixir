defmodule TriviaApp do

  def request_answer(question) do
    IO.gets(question)
  end

  def validate_answer(user_input, correct_answer) do
    cond do
      user_input == correct_answer ->
        "add 1 to score, ask next question"
      :else ->
        IO.puts "incorrect"
    end
  end
end
