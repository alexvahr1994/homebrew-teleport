function teleport_version --description 'Switch between teleport versions'
    if test "$argv" = "list"
	echo "Installed teleport versions:"
	brew list -1 | grep teleport | grep "@[0-9]" | cut -f 2- -d "@"
    else if test "$argv[1]" = "set"
	brew list -1 | grep teleport | xargs -n1 brew unlink 2>/dev/null 1>&2
	brew link --force teleport@$argv[2] 2>/dev/null 1>&2
	echo -n "Switched to: "
	/usr/local/bin/teleport version
    else
	echo "Usage:"
	echo "List installed versions: \"teleport_version list\""
	echo "Switch to version (e.g. 3.2): \"teleport_version set 3.2\""
    end
end
