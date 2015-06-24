require 'spec_helper'

describe Jdbc::Vertica do
  it 'has a version number' do
    expect(Jdbc::Vertica::VERSION).not_to be nil
  end

  it do
    expect { Jdbc::Vertica.load_driver }.not_to raise_error
  end
end
