### How would you write a shell script and ensure that only one instance of the script may run for every user?


LOCKFILE=/tmp/lock-`desislava`
if [ -e ${LOCKFILE} ] && kill -0 `cat ${LOCKFILE}`; then
    echo "Already running!"
    exit 1
fi
trap "rm -f ${LOCKFILE}; exit" INT TERM EXIT
echo $$ > ${LOCKFILE}