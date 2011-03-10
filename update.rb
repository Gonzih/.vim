#!/usr/bin/env ruby

def update
  system "cd #{File.dirname __FILE__} && git pull origin master"
  dir = Dir.new File.join(File.dirname(__FILE__), 'bundle')
  threads = []
  dir.each do |subdir|
    if subdir != '.' && subdir != '..'
      puts "Fetching #{subdir} in parallel mode"
      threads << Thread.new do
        `cd #{dir.path}/#{subdir} && git pull origin master`
      end
      puts "=" * 50
    end
  end
  threads.each { |t| t.join }
  system "cd #{File.dirname __FILE__} && git submodule init && git submodule update"
end

update
