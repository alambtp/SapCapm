git add .
echo -n "What is this change for ?"
read;
git commit -m "${REPLY}"
git push