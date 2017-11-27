function mkwww -d "Create a new web project"
	set www_root /www/sites

	if [ (count $argv) -gt 1 ]
		set project_name $argv[1]
		set project_type $argv[2]

		# creates the directory for the new project
		mkdir /www/sites/$project_name

		# git clones the template
		git clone git@github.com:crshd/mkwww_$project_type.git /www/sites/$project_name
		cd /www/sites/$project_name

		# set this bitch up
		make install NAME=$project_name

		# resets git
		rm -rf .git
		git init
		git remote add origin git@github.com:crshd/$project_name.git
	else
		echo "No (not enough) arguments given"
	end
end
