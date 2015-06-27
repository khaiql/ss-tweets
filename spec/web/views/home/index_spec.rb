require 'spec_helper'
require_relative '../../../../apps/web/views/home/index'

describe Web::Views::Home::Index do
  let(:user) { UserRepository.create(User.new(email: 'khai.le@live.com', password: '123', name: 'Khai'))}
  let(:exposures) { Hash[current_user: user] }
  let(:template)  { Lotus::View::Template.new('apps/web/templates/home/index.html.erb') }
  let(:view)      { Web::Views::Home::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  context 'user signed in' do
    before do

    end
    it 'exposes #current_user' do
      expect(view.current_user).to eq exposures.fetch(:current_user)
    end
  end
end
