#!/bin/bash

Home=.
libDir=${Home}/lib
CP=${Home}/src/fromros
CYGWIN_SEP=";"
UNIX_SEP=":"

# Choose separator as appropriate for shell system (Cygwin, otherwise UNIX)
SEP=":"
if [[ $OSTYPE == "cygwin" ]] ; then
    SEP=";"
fi

for i in ${libDir}/*.jar ; do
    CP="${CP}${SEP}$i"
done

echo $CP

java -Xms100M -Xmx500M -classpath $CP $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12}
