#!/bin/bash

        BOOK="phonebook.txt"
        
        #Enter and Validate Name:
	    nameRegex="\b[A-Za-z0-9][A-Za-z0-9]+\b"
	    # name="name1234567890"
        while [[ true ]]; do
            read -p "Please Enter A valid name without repeat exicted name or using sympols in start: " name
            if [[ $name =~ $nameRegex ]];
                then
                    flag=$(cat $BOOK | grep -w $name)
                    if [[ ! $flag ]];
                        then 
                            break
                        else echo "Already Existed!.."
                    fi
            fi
	    done

        #Enter and Validate E-mail:
	    emailRegex="\b[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"
        # email="example0123456789@example.com"
        while [[ true ]]; do
            read -p "Please Enter A valid email (example@example.com): " email
            if [[ $email =~ $emailRegex ]];
                then
                    flag=$(cat $BOOK | grep $email)
                    if [[ ! $flag ]];
                        then 
                            break
                        else echo "Already Existed!.."
                    fi
            fi
	    done

        #Enter and Validate Phone No.:
	    phoneRegex="\b01[0|1|2|5][0-9]{8}\b"
	    # phone="01012345678"
        while [[ true ]]; do
            read -p "Please Enter A valid Phone num of 11 Digits start with valid start key: " phone
            if [[ $phone =~ $phoneRegex ]];
                then
                    flag=$(cat $BOOK | grep $phone)
                    if [[ ! $flag ]];
                        then 
                            break
                        else echo "Already Existed!.."
                    fi
            fi
	    done

        # Echo the new contact and review before adding:
        echo "Are You Sure?!"
        echo -e "
        Name: $name   
        E-mail: $email   
        Phone No.: $phone \n"
        echo -e "
        Enter for confirmation:
        1 for OK. 
        2 for NO. "
        read answer

        if [ "$answer" -eq 1 ]
        then
            # Write the values to the address book
            echo "Name: $name ### Phone No: $phone ### E-mail: $email" >> $BOOK
            echo -e "
            ===DONE==="
        else
            # Give the user a message
            echo "Name: $name ### Phone No: $phone ### E-mail: $email NOT written to $BOOK"
        fi

        exit 0