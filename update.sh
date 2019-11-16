cp ~/.bash_profile .
cp ~/.bashrc .
cp ~/.vimrc .
cp ~/.gitconfig .

#Do Git Commit
git st
git add .
git cm -m "$1"
