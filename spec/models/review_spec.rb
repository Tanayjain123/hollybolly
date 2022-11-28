require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
RSpec.describe Review, type: :model do
  context 'associations' do
    it { should belong_to(:users).class_name('User') }
  end
end
