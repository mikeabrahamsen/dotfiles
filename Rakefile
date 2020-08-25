require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  switch_to_zsh
  replace_all = false
  create_tmp_dir
  create_screenshot_dir
  files = Dir['*'] - %w[Rakefile images config i3 etc requirements.txt]
  # had to ignore the config folder and add in each file seperately
  # as there may already be something in the config folder
  files << "config/htop"
  files << "config/i3/config"
  files << "config/i3/i3blocks.conf"
  files << "config/ranger/rifle.conf"
  files << "config/ranger/rc.conf"
  files << "config/ranger/scope.sh"
  files << "config/redshift-scheduler/rules.conf"
  files << "config/nvim"
  files << "config/spotify/Users/mikeabrahamsen-user/prefs"
  files << "config/brave-flags.conf"
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end
def create_tmp_dir()
    if File.exist?(File.join(ENV['HOME'], "tmp"))
        puts "tmp directory found"
    else
        puts "creating tmp directory"
        system %Q{mkdir "$HOME/tmp"}
    end
end
def create_screenshot_dir()
    if File.exist?(File.join(ENV['HOME'], "screenshots"))
        puts "screenshot directory found"
    else
        puts "creating screenshot directory"
        system %Q{mkdir "$HOME/screenshots"}
    end
end
def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s /bin/zsh}
    when 'q'
      exit
    else
      puts "skipping zsh"
    end
  end
end
