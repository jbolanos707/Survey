require('spec_helper')

describe('Question') do

  it('belongs to a survey') do
    test_survey = Survey.create(name: "School")
    test_question = Question.create(content: "Do you like school?", survey_id: test_survey.id)
    expect(test_question.survey).to(eq(test_survey))
  end

  it('can have many responses') do
    test_question = Question.create(content: "Do you like school?", survey_id: nil)
    test_response = Response.create(response: "I did when I was in kindergarten.", question_id: test_question.id)
    test_response2 = Response.create(response: "YES!!! It's so much better than a real job.", question_id: test_question.id)
    expect(test_question.responses).to(eq([test_response, test_response2]))
  end
end
