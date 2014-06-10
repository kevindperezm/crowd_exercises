describe FileOutput do
  let(:file_output) { FileOutput.new('spec/test.out') }

  it 'responds to #write' do
    expect(file_output).to respond_to :write
  end

  context '#write' do
    let(:test_case_data) { [4300, 2600, 1400] }
    let(:test_case_file_content) { "3\n1\n2\n3\n" }

    before { file_output.missile_data = test_case_data }

    it 'creates a new file' do
      file_output.write(test_case_data)
      expect(File.exists?('spec/test.out')).to be_true
    end

    it 'writes valid data into a new file' do
      file_output.write(test_case_data)
      expect(File.read('spec/test.out')).to eql test_case_file_content
    end
  end
end 
