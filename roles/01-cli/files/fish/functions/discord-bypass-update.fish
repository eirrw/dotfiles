function discord-bypass-update
    set FILEPATH /usr/lib64/discord/resources/build_info.json
    set TMPFILE (mktemp)
    set AWKCMD 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}'
    
    set OLDVERSION (jq -r .version $FILEPATH)
    set NEWVERSION (echo $OLDVERSION | awk -F. -v OFS=. $AWKCMD)

    echo "Updating discord version $OLDVERSION to $NEWVERSION"

    jq ".version = \"$NEWVERSION\"" $FILEPATH > $TMPFILE
    sudo cp $TMPFILE $FILEPATH
    rm $TMPFILE
end
