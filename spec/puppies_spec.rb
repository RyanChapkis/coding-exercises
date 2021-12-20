require_relative '../code/puppies'
require 'rspec'

describe Puppies do
  describe '.parse' do
    subject { Puppies.parse }

    it { is_expected.to eq %w[paws/dogs/8311 paws/dogs/8318 paws/dogs/8316 paws/dogs/8317 paws/dogs/8322 paws/dogs/8337 paws/dogs/8339
                              paws/dogs/8341] }
  end
end
