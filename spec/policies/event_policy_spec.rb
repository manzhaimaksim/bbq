require 'rails_helper'

RSpec.describe EventPolicy do
  let(:user) { FactoryBot.create(:user) }
  let(:event) {FactoryBot.create(:event)}

  subject { EventPolicy }

  context 'user is not owner' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user, event) }
    end
  end

  context 'user is owner' do
    let(:event) { Event.create(title: 'bbb party 2', address: 'bbb address', datetime: Time.now, user: user) }
    permissions :show?, :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end

  context 'user is anonymous user' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end
  end
end
