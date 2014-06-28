describe Output::File do
  let(:file_output) { Output::File.new('spec/test.out') }

  it 'responds to #write' do
    expect(file_output).to respond_to :write
  end

  context '#write' do
    let(:test_case_positions) { [1, 2, 3] }
    let(:test_case_file_content) { "3\n1\n2\n3\n" }

    it 'creates a new file' do
      file_output.write(test_case_positions)
      expect(File.exist?('spec/test.out')).to eql true
    end

    it 'writes valid data into a new file' do
      file_output.write(test_case_positions)
      expect(File.read('spec/test.out')).to eql test_case_file_content
    end
  end
end
