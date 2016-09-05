defmodule TriviaApp do

  def main(_) do
    start_quiz
  end

  @questions  [
                %{ question: "Samite is a type of what: \na) Fabric \nb) Stone \nc) Dog \nd) Cake ", answer: "a" }, 
                %{ question:  "Vermillion is a shade of which colour: \na) Green \nb) Blue \nc) Red \nd) Yellow ", answer: "c" },
                %{ question: "An anemometer is a gauge used for recording the speed of what: \na) Light \nb) Spacecraft \nc) Wind \nd) Athletes ", answer: "c"},
                %{ question: "English novelist William Godwin fathered which novelist daughter: \na) George Eliot \nb) Mary Shelley \nc) Emily Brontë \nd) Jane Austen ", answer: "b"},
                %{ question: "Scurvy is a deficiency in what: \na) Vitamin A \nb) Vitamin B \nc) Vitamin C \nd) Vitamin D ", answer: "c"},
                %{ question: "What does an ornithologist study? \na) Diseases \nb) Ancient Pottery \nc) Birds \nd) Teeth ", answer: "c"},
                %{ question: "What is the scientific name for red blood cells? \na) Erythrocytes \nb) Leukocytes \nc) Thrombocytes \nd) Keratinocytes ", answer: "a"}, 
                %{ question: "What are the names of Mars’ two satellites? \na) Pallas and Vesta \nb) Phobos and Deimos \nc) Ganymede and Callisto \nd) Triton and Nereid ", answer: "b"},
                %{ question: "What is the atomic number for Lithium? \na) 7 \nb) 18 \nc) 3 \nd) 24 ", answer: "c"},
                %{ question: "Asteroids that orbit the sun without crossing Earth’s orbit is are called: \na) Amor \nb) Aten \nc) Apollo \nd) Icarus ", answer: "a"} 
              ]

  def start_quiz do
    introduce_quiz
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

  defp introduce_quiz do
    IO.puts("Welcome to the quiz! Here are your Questions: ")
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
