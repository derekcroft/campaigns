require 'spec_helper'

describe AccessToken do
  describe "#refresh!" do
    at = AccessToken.refresh!('lts', 'test')
  end
end
