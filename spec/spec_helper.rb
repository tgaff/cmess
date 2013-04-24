
$:.unshift(File.dirname(__FILE__) + '/lib/cmess')
$:.unshift(File.dirname(__FILE__) + '/lib')

unless defined?(SPEC_ROOT)
    SPEC_ROOT = File.join(File.dirname(__FILE__))
end
