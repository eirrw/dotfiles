# from https://stackoverflow.com/a/59532292/6605858
function default
  for val in $argv
    if test "$val" != ""
      echo $val
      break
    end
  end
end
