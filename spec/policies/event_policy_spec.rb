require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { FactoryBot.create(:user, email: 'bbb@bb.bb') }
  let(:event) { FactoryBot.create(:event) }

  subject { EventPolicy }

  permissions :edit? do
    it { is_expected.to permit(user, event) }
    it { is_expected.not_to permit(nil, event) }
  end

  permissions :update? do
    it { is_expected.to permit(user, event) }
    it { is_expected.not_to permit(nil, event) }
  end

  permissions :destroy? do
    it { is_expected.to permit(user, event) }
    it { is_expected.not_to permit(nil, event) }
  end

  permissions :show? do
    it { is_expected.to permit(user, event) }
    it { is_expected.to permit(nil, event) }
  end
end
