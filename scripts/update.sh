cp ~/.bash_profile ..
cp ~/.bashrc ..
cp ~/.vimrc ..
cp ~/.gitconfig ..

#Do Git Commit
if [ $# -eq 0 ]; then
	git st
	echo "No message given, not commiting"
else
	git st
	git add .
	git cm -m "$1"
fi
