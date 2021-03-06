$:.unshift(File.expand_path('../lib', __FILE__))

require 'cmess'

begin
  require 'hen'

  Hen.lay! {{
    :gem => {
      :name         => %q{cmess},
      :version      => CMess::VERSION,
      :summary      => %Q{
        Assist with handling messed up encodings (Currently includes the
        following tools: #{Dir['bin/*'].map { |e| File.basename(e) }.sort.join(', ')})
      },
      :author       => %q{Jens Wille},
      :email        => %q{jens.wille@gmail.com},
      :homepage     => :blackwinter,
      :extra_files  => FileList['data/**/*'].to_a,
      :dependencies => [['ruby-nuggets', '>= 0.3.3'], 'htmlentities']
    }
  }}
rescue LoadError => err
  warn "Please install the `hen' gem. (#{err})"
end

namespace :guess_encoding do

  desc "Compare actual encoding and automatic guess of example files"
  task :check_examples do
    E = CMess::GuessEncoding::Encoding

    Dir[File.join(File.dirname(__FILE__), 'example', 'guess_encoding', '??.*.txt')].sort.each { |example|
      language, encoding = File.basename(example, '.txt').split('.')
      encoding.upcase!

      result = CMess::GuessEncoding::Automatic.guess(File.open(example))

      puts '%s %s/%-11s => %s' % [case result
        when E::UNKNOWN then '?'
        when E::ASCII   then '#'
        when encoding   then '+'
        else                 '-'
      end, language, encoding, result]
    }
  end

end
