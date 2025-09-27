echo '# Repo Tree' > README.md
echo '```'\n >> README.md #used to make dirtree readable in MD
tree --gitignore . >> README.md
echo \n >> README.ms
echo '```' >> README.md 
cat description.md >> README.md