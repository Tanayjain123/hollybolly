require 'rails_helper'

RSpec.describe User, type: :model do
  context '#say_hello' do
    it 'should say Hello World when we call the say_hello method' do
      hw = User.new
      message = hw.say_hello
      expect(message).to eq "Hello World!"
    end
  end
end
