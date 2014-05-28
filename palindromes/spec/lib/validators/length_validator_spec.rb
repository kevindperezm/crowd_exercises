# encoding: utf-8
require 'spec_helper'

describe LengthValidator do
  context '#validate' do
    it('should return true if string size >= 2') do
      expect(subject.validate('gaga')).to be_true
    end
    it('should return false if string size < 2') do
      expect(subject.validate('g')).to be_false
    end
  end
end
