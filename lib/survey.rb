class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:titleize_name)

private

  define_method(:titleize_name) do
    self.name = (name().titleize())
  end
end
