# -*- encoding: utf-8 -*-
require 'spec_helper'

describe VendingMachine do
  let(:vm){ VendingMachine.new }
  #let(:yen10) {Money.new 10}
  context '初期状態のテスト' do
    it '何も投入しなければ合計0件' do
      vm.total.should eq 0
    end
    it '何も投入しなければつり銭ボックスは' do
      vm.change.should eq 0
    end
  end
  
  context 'コインを投入したときの合計値についてのテスト' do
    it '10円入れたら合計10円' do
      vm.add 10
      vm.total.should eq 10
    end
    it '50円入れたら合計50円' do
      vm.add 50
      vm.total.should eq 50
    end
    it '100円入れたら合計100円' do
      vm.add 100
      vm.total.should eq 100
    end
    it '500円入れたら合計500円' do
      vm.add 500
      vm.total.should eq 500
    end
    it '1000円入れたら合計1000円' do
      vm.add 1000
      vm.total.should eq 1000
    end
  end
  
  context '複数回入れた時は合計金額がその合計になる' do
    it '10円と50円ならば合計60円' do
      vm.add 10
      vm.add 50
      vm.total.should eq 60
    end
    it '100円と500円と1000円ならば合計1600円' do
      vm.add 100
      vm.add 500
      vm.add 1000
      vm.total.should eq 1600
    end
  end
  
  context '釣り銭は合計金額を返して、内部合計金額を0にする' do
    it '100円投入して、100円帰ってきて、内部の合計は0になる' do
      vm.add 100
      vm.payback.should eq 100
      vm.total.should eq 0
      vm.change.should eq 100
    end
  end
  
  context '想定していないお金が投入された時' do
    it '1円を入れると、1円返ってきて、合計が0円のまま' do
      vm.add 1
      vm.total.should eq 0
      vm.change.should eq 1
    end
    it '5円を入れると、5円返ってきて、合計が0円のまま' do
      vm.add 5
      vm.total.should eq 0
      vm.change.should eq 5
    end
    it '5000円を入れると、5000円返ってきて、合計が0円のまま' do
      vm.add 5000
      vm.total.should eq 0
      vm.change.should eq 5000
    end
  end
  
  describe 'ジュース情報の取得' do
    context '初期状態の時' do
      it '120円のコーラが5本ある' do
        vm.stock.should eq coke: {price: 120, amount: 5}
      end
    end
  end
end
