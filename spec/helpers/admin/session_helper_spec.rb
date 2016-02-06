require 'rails_helper'

RSpec.describe Admin::SessionHelper do
  describe '#sign_in' do
    before do
      session[:login] = nil
      sign_in
    end

    it { expect(session[:login]).to be_truthy }
  end

  describe '#signed_in?' do
    subject { signed_in? }

    context 'サインイン中の場合' do
      before { sign_in }
      it { is_expected.to be_truthy }
    end

    context 'サインイン中でない場合' do
      before { session[:login] = nil }
      it { is_expected.to be_falsey }
    end
  end

  describe '#sign_out' do
    before do
      sign_in
      sign_out
    end

    it { expect(session[:login]).to be_nil }
  end
end
