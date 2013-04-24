require 'spec_helper'
require 'cmess/guess_encoding'

describe CMess::GuessEncoding::Automatic do

  subject { CMess::GuessEncoding::Automatic }

  files = Dir[File.join(SPEC_ROOT, 'fixtures', '*.*.*.txt' )]
  files.sort.each do |file|
    language, encoding, expected_encoding = File.basename(file, '.txt').split('.')

    it "can guess the encoding of #{file} is #{expected_encoding}" do
      subject.guess(File.open(file)).should == expected_encoding
    end
  end




end
