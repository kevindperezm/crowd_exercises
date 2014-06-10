describe FileInput do
  let(:file_input) { FileInput.new('spec/test.in') }

  it 'responds to missiles' do
    expect(file_input).to respond_to :missiles
  end

  context '#new' do
    it 'raises an error if the specified file doesn\'t exists' do
      expect { FileInput.new('non-existing-file.in') }
      .to raise_error { FileNotFoundError }
    end
  end

  context '#missiles' do
    let(:testing_missiles) { [4500, 3600, 7200, 6789, 4321] }

    it 'returns an array with each missile high value' do
      expect(file_input.missiles).to eql testing_missiles
    end
  end
end
