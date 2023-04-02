function glog
  # %w(0,4,4): no line-wrap, indent first line 4 chars, subsequent lines also 4 lines
  git log --date=format:"%A %B %d %Y at %H:%M" --pretty=format:"%C(yellow)%H%Creset%x09%C(bold green)%D%Creset%n%<|(40)%C(white)%ad%x09%an%Creset%n%n    %C(bold)%s%Creset%n%w(0,4,4)%n%-b%n" $argv
end
