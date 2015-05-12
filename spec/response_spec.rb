require 'spec_helper'

describe (Response) do

  it('is attached to a singular question') do
    test_question = Question.create(content: "What is your favorite color?", survey_id: nil)
    test_response = Response.create(response: "Blue", question_id: test_question.id)
    expect(test_response.question).to(eq(test_question))
  end
end
