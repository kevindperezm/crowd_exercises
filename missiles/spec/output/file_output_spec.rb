describe FileOutput do
  let(:file_output) { FileOutput.new('spec/test.out') }

  it 'responds to #write' do
    expect(file_output).to respond_to :write
  end

  context '#write' do
    let(:data_array) { [4300, 2600, 1400] }
    let(:data_file_content) { "3\n4300\n2600\n1400\n" }

    it 'creates a new file' do
      file_output.write(data_array)
      expect(File.exists?('spec/test.out')).to be_true
    end

    it 'writes valid data into a new file' do
      file_output.write(data_array)
      expect(File.read('spec/test.out')).to eql data_file_content
    end
  end
end 
