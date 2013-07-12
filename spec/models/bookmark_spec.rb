require 'spec_helper'

describe Bookmark do
  it { should validate_presence_of(:card_id) }
end
