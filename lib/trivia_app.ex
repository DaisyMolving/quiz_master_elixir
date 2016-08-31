defmodule TriviaApp do

  @questions  [
                %{ question: "Samite is a type of what: a) Fabric? b) Stone? c) Dog? d) Cake?", answer: "a" }, 
                %{ question:  "Vermillion is a shade of which colour: Green; Blue; Red; or Yellow?", answer: "c" }
              ]

  def start_quiz do
    ask_question(@questions)
  end

  def ask_question([current_question | _]) do
    initial_score = 0
    validate_input(request_answer(current_question[:question]), current_question[:answer], initial_score)
  end

  def request_answer(question) do
    IO.gets(question)
  end

  def validate_input(user_input, correct_answer, score) do
    cond do
      String.equivalent?(user_input, correct_answer) ->
        IO.puts("correct")
        print_score(score + 1)
      :else ->
        print_incorrect_message
    end
  end

  defp print_score(score) do
    IO.puts("Your current score is #{score}")
  end
  
  defp print_incorrect_message do
    IO.puts "incorrect"
  end
end
