require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.new }

  subject { EventPolicy }

  permissions :edit? do
    it { is_expected.to permit(user, Event) }
    it { is_expected.not_to permit(nil, Event) }
  end

  permissions :update? do
    it { is_expected.to permit(user, Event) }
    it { is_expected.not_to permit(nil, Event) }
  end

  permissions :destroy? do
    it { is_expected.to permit(user, Event) }
    it { is_expected.not_to permit(nil, Event) }
  end

  permissions :show? do
    it { is_expected.to permit(user, Event) }
    it { is_expected.to permit(nil, Event) }
  end
end
