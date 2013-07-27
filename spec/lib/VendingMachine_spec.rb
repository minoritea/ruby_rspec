# -*- encoding: utf-8 -*-
require 'spec_helper'

describe VendingMachine do
  let(:vm){ VendingMachine.new }

  it do
    vm.add_10
    vm.total.should eq 10
  end
end