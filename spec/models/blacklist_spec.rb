require 'rails_helper'

RSpec.describe Blacklist, type: :model do
  it { should belong_to(:student) }
  it { should belong_to(:enemy) }
end
