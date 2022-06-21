#!/bin/sh

export PATH=$HOME/miniforge3/bin:$PATH
export LANG=C

cd `dirname $0`
CDIR=`pwd`

mkdir -p result

proc()
{
    SCRIPT=$1
    N=$2
    LOG=result/result_$SCRIPT.txt

    /bin/echo -n "$SCRIPT: `date` -> " >> $LOG
    python $SCRIPT.py --trial $N

    echo "`date +%H:%M:%S`" >> $LOG
    python $SCRIPT.py --trial 0 >> $LOG

    echo "" >> $LOG
}

proc mnist_mlp 100
proc mnist_lstm 100
proc mnist_cnn 100

# end
