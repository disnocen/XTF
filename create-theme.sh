#!/bin/sh

# to work as expected needs the hexa command

infile=$1
outfile=$2

grep -e ^! -e ^'.color[0-9]' -e ^'*.color[0-9]' $infile| # select lines starting with either * or ! 
    sed -e s/"*color"// -e s/"*.color"//| # remove the *color portion, leaving number
    sed -e s/":.*\#"/:/| # remove spaces till # included 
    sed /"1[0-9].*:"/s/"^1\([0-9]\)"/".\/hexa \1"/e| # transforms nums in hexadecimal, GNU extension
    tr -d ":"| #  remove :
    sed '/\!/!s/^/echo -ne '\''\\e]P/'| #  add color excape sequence
    sed s/$/\'/| # add final '
    sed s/^\!/#/ > $outfile # replace comment sign and write to file


