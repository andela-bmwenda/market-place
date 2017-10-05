require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value('email@example.com').for(:email) }
  it { is_expected.to_not allow_value('invalid email').for(:email) }
  it { is_expected.to validate_presence_of(:password_digest) }
end
