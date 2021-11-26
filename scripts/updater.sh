CURRENT_HEAD=$(git rev-parse HEAD)

git fetch
git reset --hard origin/main

NEW_HEAD=$(git rev-parse HEAD)

if [ "${NEW_HEAD}" != "${CURRENT_HEAD}" ]
then
  ./configure
  make
fi