require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require('./lib/survey')
require('./lib/question')
require('./lib/response')
require('pg')
require('pry')

get ('/') do
  @surveys = Survey.all()
  erb(:index)
end

get ('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

post ('/surveys') do
  name = params.fetch("name")
  Survey.create(name: name)
  @surveys = Survey.all()
  erb(:surveys)
end

get ('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  erb(:survey)
end

post ('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  survey_id = params.fetch("survey_id").to_i
  question = params.fetch("question")
  new_question = @survey.questions.create(content: question, survey_id: survey_id)
  redirect('/surveys/'.concat(survey_id.to_s))
end

delete ('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i)
  @survey.destroy()
  redirect('/surveys')
end

get ('/questions/:id') do
  @question = Question.find(params.fetch('id'))
  survey_id = @question.survey_id
  @survey = Survey.find(params.fetch('survey_id').to_i)
  erb(:question)
end

patch ('/questions/:id') do
=begin
  id = params.fetch("survey_id").to_i
  question = Question.find(id)
  update_question = params.fetch("content")
  question.update({:content => content})
  survey = question.

  @survey = Survey.find(params.fetch('id'))
  @question = Question.find(params.fetch('id'))
  content = params.fetch("content")
  @question.update(content: content)
  erb(:question)
end
=end
end

delete ('/questions/:id') do
  @survey = Survey.find(params.fetch('survey_id'))
  @question = Question.find(params.fetch('id'))
  survey_id = @question.survey_id
  @question.destroy()
  redirect('/surveys'.concat(survey_id.to_s))
end
