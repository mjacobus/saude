# frozen_string_literal: true

require "rails_helper"

RSpec.describe DoctoraliaClient do
  it "soma direitinho" do
    service = DoctoraliaClient.new(client: :x)

    resultado = service.soma(1, 5)

    expect(resultado).to eq(6)
  end
end
