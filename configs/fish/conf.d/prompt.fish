function fish_title
	if test $_ = "fish"
		if test (pwd) = "$HOME"
			echo "~"
		else
			pwd
		end
	else
		echo $_
	end
end

function fish_prompt
	set -l status_copy $status
	set -l pwd_info (pwd_info "/")
	set -l dir
	set -l base
	set -l color (set_color white)
	set -l color2 (set_color normal)
	set -l color3 (set_color $fish_color_command)
	set -l color_error (set_color $fish_color_error)
	set -l color_normal "$color2"

	if test "$status_copy" -ne 0
		set color "$color_error"
		set color2 "$color_error"
		set color3 "$color_error"
	end

	set -l glyph "$color3 λ$color_normal"

	# Check if root
	if test 0 -eq (id -u "$USER")
		echo -sn "$color_error Λ$color_normal"
	end

	# Show user in SSH session
	if test ! -z "$SSH_CLIENT"
		set -l color "$color2"

		if test 0 -eq (id -u "$USER")
			set color "$color_error"
		end

		echo -sn "$color"(host_info "user@")"$color_normal"
	end

	if set branch_name (git_branch_name)
		set -l git_color
		set -l git_glyph "⥂ "

		if git_is_staged
			set git_color (set_color green)

			if git_is_dirty
				set git_glyph "$git_color$git_glyph$color_error$git_glyph"
				set git_color "$color_error"
			end

		else if git_is_dirty
			set git_color "$color_error"

		else if git_is_touched
			set git_color "$color_error"

		else
			set git_color "$color3"
		end

		set -l git_ahead (git_ahead " ↑" " ↓" " ↕")

		if test "$branch_name" = "master"
			set branch_name
			if git_is_stashed
				set branch_name "{}"
			end
		else
			set -l branch_icon "⌥"

			if git_is_stashed
				set -l branch_icon "↪"
			end

			set branch_name = "$git_color $color2$branch_name"
		end

		echo -sn "$branch_name$git_color$git_ahead$git_glyph"
	else
		echo -sn "$color$glyph$color_normal"
	end

	echo -sn "$color_normal "
end
