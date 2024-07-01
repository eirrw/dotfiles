set -l cur_dir (dirname (status -f))

for f in $fish_complete_path
    string match -q "$cur_dir" "$f"
    and continue

    test -e "$f/ls.fish"
    and source "$f/ls.fish"
    and break
end

if command -q eza
    complete -c ls -e
    complete -c ls -w eza
end
