defmodule TriviaApp do

  def main(_) do
    start_quiz
  end

  @questions  [
                %{ question: "Samite is a type of what: a) Fabric? b) Stone? c) Dog? d) Cake?", answer: "a" }, 
                %{ question:  "Vermillion is a shade of which colour: a) Green? b) Blue? c) Red? d) Yellow?", answer: "c" }
              ]

  def start_quiz do
    score = 0
    ask_question(@questions, score)
  end

  def ask_question([], _), do: perfect_score_message
  def ask_question([current_question | next_questions], score) do
    request_answer(current_question[:question])
    |> validate_input(current_question[:answer], score, next_questions)
  end

  def request_answer(question) do
    IO.gets(question)
  end

  def validate_input(user_input, correct_answer, score, next_questions) do
    cond do
      String.strip(user_input) == correct_answer ->
        correct_input_action(score, next_questions)
      :else ->
        incorrect_input_action
    end
  end

  defp correct_input_action(score, next_questions) do
    print_correct_answer_message
    print_score(score + 1)
    ask_question(next_questions, score + 1)
  end

  defp incorrect_input_action do
    print_incorrect_answer_message
    cond do
      String.strip(start_over_message) == "y" ->
        start_quiz
      :else ->
        IO.puts("Goodbye!")
    end
  end

  defp print_score(score) do
    IO.puts("Your current score is #{score}")
  end
  
  defp print_correct_answer_message do
    IO.puts("HOORAY! That answer is correct!")
  end

  defp print_incorrect_answer_message do
    IO.puts("OOPS! That answer is incorrect! ")
  end

  defp start_over_message do
    IO.gets("Would you like to start again? Type y for yes, or n for no: ")
  end

  defp perfect_score_message do
    IO.puts("Congratulations! You have finished the quiz with a perfect score!")
  end

end
