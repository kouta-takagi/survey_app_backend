# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

3.times do |i|
  @survey = Survey.create(title: "title#{i+1}", description: "description#{i+1}")
  3.times do |i2|
    @question = @survey.questions.create(content: "content#{i2+1}")
    3.times do |i3|
      @question.answers.create(response: "response#{i3+1}")
    end
  end
end
