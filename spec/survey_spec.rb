require ('spec_helper')

describe(Survey) do

  it('has many questions') do
    survey = Survey.create(name: "School")
    question1 = Question.create(content: "Do you like school?", survey_id: survey.id)
    question2 = Question.create(content: "Do you like your teacher?", survey_id: survey.id)
    expect(survey.questions).to(eq([question1, question2]))
  end
end
