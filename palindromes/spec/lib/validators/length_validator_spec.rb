# encoding: utf-8
require 'spec_helper'

describe LengthValidator do
  context '#validate?' do
    it('should return true if string size >= 1') do
      expect(subject.validate?('gaga')).to eql true
    end
    it('should return false if string size < 1') do
      expect(subject.validate?('')).to eql false
    end
  end
end
