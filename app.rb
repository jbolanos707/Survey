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

get ('/questions/:id') do
  @survey = Survey.find(params.fetch('id'))
  erb(:question)
end
