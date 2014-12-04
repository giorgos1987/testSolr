#!/bin/sh

# FABRIZIO CELLI

# all XML files
LIST=`find . -name "*.xml"`

# all encodings
ISO1="ISO-8859-1"
ISO1_2="iso-8859-1"
ISO2="ISO-8859-2"
ISO2_2="iso-8859-2"
WIN51="windows-1251"
WIN51_2="Windows-1251"
GB="GB2312"
WIN56="windows-1256"
WIN56_2="Windows-1256"
EUC="EUC-KR"
UTF8="utf-8"
UTF8_2="UTF-8"
WIN50="windows-1250"
WIN50_2="Windows-1250"
ISO11="ISO-8859-11"
ISO11_2="iso-8859-11"
ISO9="ISO-8859-9" 
ISO9_2="iso-8859-9" 

# scan files
for file in $LIST; do
    x=`cat $file`
    # select encoding
    if grep $ISO11 $file; then
        encoding="ISO-8859-11"
	else if grep $ISO11_2 $file ; then
        encoding="iso-8859-11"
    else 
      if grep $ISO1 $file; then
        encoding="ISO-8859-1"
    else if grep $ISO1_2 $file; then
        encoding="iso-8859-1"
    else if grep $ISO2 $file; then
            encoding="ISO-8859-2"
	 else if grep $ISO2_2 $file; then
                encoding="iso-8859-2"
        else if grep $WIN51 $file; then
                encoding="windows-1251"
	     else if grep $WIN51_2 $file; then
                    encoding="Windows-1251"
            else if grep $GB $file; then
                    encoding="GB2312"
                else if grep $WIN56 $file; then
                        encoding="windows-1256"
		      else if grep $WIN56_2 $file; then
                            encoding="Windows-1256"
                    else if grep $EUC $file; then
                            encoding="EUC-KR"
                        else if grep $WIN50 $file; then
                                encoding="windows-1250"
				else if grep $WIN50_2 $file; then
                           		encoding="Windows-1250"
                            else if grep $ISO9 $file; then
                                        encoding="ISO-8859-9"
					 else if grep $ISO9_2 $file; then
                           		 	encoding="iso-8859-9"
                                    else
    	                                    encoding="NULL"
                                         fi
					 fi
					 fi
                                fi
				    fi
                            fi
                        fi
			   fi
                    fi
                fi
		  fi
            fi
	     fi
        fi
	 fi
    fi

    #apply conversion
    if [ $encoding != "NULL" ] ; then
        iconv -c -f $encoding -t utf-8 $file -o $file."utf8"
        if [ "$?" -ne 0 ]; then 
            echo ### comando fallito $file
        else
            mv $file."utf8" $file
	     sed "s/$encoding/utf-8/g" $file > tmp
	     mv tmp $file
        fi
    else
        if [[ $x == *$UTF8* ]] || [[ $x == *$UTF8_2* ]]; then 
            echo    UTF-8 $file
        else
            echo ### no encoding $file
        fi
    fi
done

