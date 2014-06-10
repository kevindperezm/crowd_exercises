describe FileOutput do
  let(:file_output) { FileOutput.new('spec/test.out') }

  it 'responds to #write' do
    expect(file_output).to respond_to :write
  end

  context '#write' do
    let(:test_case_data) { [3, 4, 5] }
    let(:test_case_file_content) { "3\n3\n4\n5\n" }

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
