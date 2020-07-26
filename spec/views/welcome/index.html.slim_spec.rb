require 'rails_helper'

RSpec.describe "welcome/index.html.slim", type: :view do
  before(:each) do
    @movies = WillPaginate::Collection.new(4,10,0)
    31.times do
      @movies << create(:movie)
    end
    assign(:movies, @movies)
  end

  it "display title" do
    render
    expect(rendered).to match /Views/
  end
end
