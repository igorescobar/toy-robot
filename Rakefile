require 'rubygems'

begin
  require 'bundler'
rescue LoadError => e
  warn e.message
  warn 'Run `gem install bundler` to install Bundler.'
  exit e.status_code
end

begin
  Bundler.setup(:development)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems.'
  exit e.status_code
end

require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new

task test: :spec
task default: :spec

require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end
