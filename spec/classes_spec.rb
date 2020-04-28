# spec/classes_spec.#!/usr/bin/env ruby -wKU
require './classes.rb'

describe Criticblunder do
  let(:crbl) { Criticblunder.new }
  describe '#cr_bl_assign' do
    it 'message' do
      expect(crbl.cr_bl_assign(4, '3to4', 'cr')).to eql("The new critic range for D4 goes from 3 to 4")
    end
  end
end
