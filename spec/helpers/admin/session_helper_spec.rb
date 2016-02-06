require 'rails_helper'

RSpec.describe Admin::SessionHelper do
  describe '#sign_in' do
    before do
      session[:signed_in] = nil
      sign_in
    end

    it { expect(session[:signed_in]).to be_truthy }
  end

  describe '#signed_in?' do
    subject { signed_in? }

    context 'サインイン中の場合' do
      before { sign_in }
      it { is_expected.to be_truthy }
    end

    context 'サインイン中でない場合' do
      before { session[:signed_in] = nil }
      it { is_expected.to be_falsey }
    end
  end

  describe '#sign_out' do
    before do
      sign_in
      sign_out
    end

    it { expect(session[:signed_in]).to be_nil }
  end
end
