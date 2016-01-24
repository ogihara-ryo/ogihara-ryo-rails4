require 'rails_helper'

describe 'layouts/application.html.slim' do
  it 'head 要素部分テンプレートがレンダリングされること' do
    view.lookup_context.prefixes = 'application'
    render
    expect(rendered).to render_template('_head')
  end
end
