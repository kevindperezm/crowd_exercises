describe Input::File do
  let(:file_input) { Input::File.new('spec/test.in') }
  let(:fail_file_input) { Input::File.new('spec/fail-test.in') }
  let(:empty_file_input) { Input::File.new('spec/empty-file.in') }

  it 'responds to missiles' do
    expect(file_input).to respond_to :missiles
  end

  context '#new' do
    it 'raises an error if the specified file doesn\'t exists' do
      expect { Input::File.new('non-existing-file.in') }
      .to raise_error { Input::FileNotFoundError }
    end
  end

  context '#missiles' do
    let(:testing_missiles) do
      [
        Missile.new(1, 4500),
        Missile.new(2, 3600),
        Missile.new(3, 7200),
        Missile.new(4, 6789),
        Missile.new(5, 4321)
      ]
    end

    it 'returns an array with each missile altitude value' do
      expect(file_input.missiles).to eq testing_missiles
    end

    it 'raises an error when the file is impossible to parse' do
      expect { fail_file_input.missiles }
      .to raise_error { Input::ImpossibleToParse }
    end

    it 'doesn\'t raise an error when the file is empty' do
      expect { empty_file_input.missiles }
      .to_not raise_error { Input::ImpossibleToParse }
    end
  end
end
