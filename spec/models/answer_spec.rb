require 'rails_helper'

RSpec.describe Answer, :type => :model do
  let(:question) { Question.create!(title: "New Question title", body: "New Question body", resolved: false)}
  let(:answer) { Answer.create!(body: "New Answer body", question: question)}

  describe "attributes" do
    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
  end
end
