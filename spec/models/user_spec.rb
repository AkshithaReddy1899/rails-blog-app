require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(Name: "Tom", Photo: 'user.png', Bio: 'Teacher from Mexico', PostsCounter: 1) }

  before { subject.save }

  context 'User validation test' do
    it 'ensures Name presence' do
      subject.Name = ''
      expect(subject).to_not be_valid
    end

    it 'ensures PostsCounter greater than equal to 0' do
      expect(subject.PostsCounter).to be >= 0
    end
  end
end
