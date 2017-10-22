#!/bin/bash


printf "\n"

echo "    Welcome to Student Search ....!!!!"

printf "\n"


image() {

        read -p "Enter corresponding roll number to view image:" r
        find . -name "$r.jpg" -exec feh {} \;
        printf "\n"
        keyword "$1"
        printf "\n"
        echo "   To close image , enter - q"
}



deptlist() {

            printf "\n"

            echo "        Type in corresponding department code "
            echo "             Department                       |  code" 
            echo "       Aerospace Engineering                  -  ae"
            echo "       Biological Sciences and Bioengineering -  bsbe"
            echo "       Civil Engineering                      -  ce"
            echo "       Chemical Engineering                   -  che"
            echo "       Chemistry B.S.                         -  chy"
            echo "       Computer Science and Engineering       -  cse"
            echo "       Earth Science B.S.                     -  es"
            echo "       Economics B.S.                         -  eco"
            echo "       Electrical Engineering                 -  ee"
            echo "       Mechanical Engineering                 -  me"
            echo "       Material Science and Engineering       -  mse "
            echo "       Mathematics B.S.                       -  mth"
            echo "       Physics B.S.                           -  phy"
            echo "       Master Of Design                       -  md"
            echo "       Management and Indusrial Engineering   -  mba"
            echo "       Nuclear Engineering and Technology     -  net"
            echo "       Photonics Science and Engineering      -  pse"

            printf "\n"

            read -p "Enter Department Code : " d

            dept "$1" "$d"

}



ylist() {
         printf "\n"

            echo "                    Type in year code "
            echo "             Year          |  code" 
            echo "             Y16 (UG)         -  16"
            echo "             Y15 (UG)         -  15"
            echo "             Y14 (UG)         -  14"
            echo "             Y14 (UG)         -  13"
            echo "             Y16 (PG)         -  16p"
            echo "             Y15 (PG)         -  15p"
            printf "\n"

read -p "Enter Year Code : " y

year "$1" "$y"

}       




plist() {

            printf "\n"

            echo "        Type in corresponding program code "
            echo "             Program          |  code" 
            echo "             BTech            -  bt"
            echo "             BS               -  bs"
            echo "             MTech            -  mt"
            echo "             PhD              -  phd"
            echo "             MS-Research      -  ms"
            echo "             MDes             -  md"
            echo "             MBA              -  mba"
            printf "\n"

read -p "Enter Program Code : " p

program "$1" "$p"

}







keyword() {

          echo "      Type in the desired keyword "
          echo "       Search Option  |  Keyword" 
          echo "         Roll Number  -  rn"
          echo "         Name         -  n"
          echo "         Gender       -  g"
          echo "         Batch        -  y"
          echo "         Program      -  p"
          echo "         Department   -  d"
          echo "         Hostel       -  h"
 
          printf "\n"

          echo " To view image of a student , type in - i"
     
          printf "\n"
                
          echo " To exit student search , type in - bye "
          
          printf "\n"

          key_input "$1"

}






roll() {

       printf "\n" 

       if [ -z "$1" ]
          then
             grep -P -q -r -h -A 11 --include="*\.txt" "Roll No: $2" 
             if [ $? = 0 ]
                then
                   var=$(grep -P -r -h -A 11 --include="*\.txt" "Roll No: $2")
                   echo "$var"
                   printf "\n"
                   echo "   To close image , enter - q"
                   find . -name "$2.jpg" -exec feh {} \; 
             else
                echo "***No result found***"
                printf "\n"
                ./ss.sh
            fi
       else
          echo "$1" | grep -P -q -A 11 "Roll No: $2"
          if [ $? = 0 ]
             then
               var=$(echo "$1" | grep -P -A 11 "Roll No: $2")
               echo "$var"
               printf "\n"
               echo "   To close image , enter - q"
               find . -name "$2.jpg" -exec feh {} \; 
          else
             echo "***Please enter a valid Roll Number***"
             printf "\n"
             read -p "Enter Roll Number :" rn
             roll "$1" "$rn"
          fi
      fi

}

export -f roll






name() {
       
       printf "\n"
      
       if [ -z "$1" ]
          then
              grep -P -q -r -h -i -A 10 -B 1 --include="*\.txt" "Name:.*$2.*"
              if [ $? = 0 ]
                  then
                      var=$(grep -P -r -h -i -A 10 -B 1 --include="*\.txt" "Name:.*$2.*")
                      echo "$var"
                      printf "\n"
                      echo "    To add a filter to your results,"
                      keyword "$var"
              else
                 printf "\n"
                 echo "***No result found***"
                 printf "\n"
                 read -p "Enter Name :" name
                 name "" "$name"
              fi
       else
           echo "$1" | grep -P -q -i -A 10 -B 1 "Name:.*$2.*"  
           if [ $? = 0 ]
               then
                   var=$(echo "$1" | grep -P -i -A 10 -B 1 "Name:.*$2.*")
                   echo "$var"
                   printf "\n"
                   echo "    To add a filter to your results,"
                   keyword "$var"
               else
                   printf "\n"
                   echo "***No result found**"
                   printf "\n"
                   ./ss.sh 
               fi
       fi

}





gender() {
 
         printf "\n"
         
         if [ -z "$1" ]
          then
            if [ "$2" = m ] || [ "$2" = M ]
              then
                var=$(grep -P -r -h -A 9 -B 2 --include="*\.txt" "Gender: M")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results,"
                keyword "$var"
           elif [ "$2" = f ] || [ "$2" = F ]
                then
                    var=$(grep -P -r -h -A 9 -B 2 --include="*\.txt" "Gender: F")
                    echo "$var"
                    printf "\n"
                    echo "    To add a filter to your results,"
                    keyword "$var"
           else
               echo "***Please enter a valid gender code***"
               printf "\n"
               read -p "Enter Gender ( M/F ) :" g
                gender "" "$g"
           fi
       else
           echo "$1" | grep -P -q -i -A 9 -B 2 "Gender: $2"
           if [ $? = 0 ]
               then
                   if [ "$2" = m ] || [ "$2" = M ]
                      then
                          var=$(echo "$1" | grep -P -A 9 -B 2 "Gender: M")
                          echo "$var"
                          printf "\n"
                          echo "    To add a filter to your results,"
                          keyword "$var"
                   elif [ "$2" = f ] || [ "$2" = F ]
                        then
                            var=$(echo "$1" | grep -P -A 9 -B 2 "Gender: F")
                            echo "$var"
                            printf "\n"
                            echo "    To add a filter to your results,"
                            keyword "$var"
                  else
                       echo "***Please enter a valid gender code***"
                       printf "\n"
                       read -p "Enter Gender ( M/F ) :" g
                       gender "$1" "$g"
                  fi
           else
              printf "\n"
                   printf "\n"
                   echo "***No result found**"
                   printf "\n"
                   
           fi
         fi 

}











year() {

       printf "\n"

       if [ -z "$1" ]
          then
            if [ "$2" = 13 ] || [ "$2" = 14 ] || [ "$2" = 15 ] || [ "$2" = 16 ]
              then
                var=$(grep -P -r -h -A 11 --include="*\.txt" "Roll No: $2\d{3,}")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results,"
                keyword "$var" 
           elif [ "$2" = 16p ]
              then
                var=$(grep -P -r -h -A 11 --include="*\.txt" "Roll No: 16\d{5,}")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results,"
                keyword "$var"
           elif [ "$2" = 15p ]
              then
                var=$(grep -P -r -h -A 11 --include="*\.txt" "Roll No: 15\d{5,}")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results,"
                keyword "$var"
           else
              echo "***Please enter a valid batch year***"
              printf "\n"
              ylist ""
          fi
       else
          if [ "$2" = 13 ] || [ "$2" = 14 ] || [ "$2" = 15 ] || [ "$2" = 16 ]
              then
                 echo "$1" | grep -q -P ":.$2\d{3,4}"
                 if [ $? = 0 ]
                 then
                    var=$(echo "$1" | grep -P -A 11 "Roll No: $2\d{3,4}")
                    echo "$var"
                    printf "\n"
                    echo "    To add a filter to your results,"
                    keyword "$var"
                else
                   printf "\n"
                   echo "***No Result Found***"
                   printf "\n"
                   ./ss.sh
                fi
          elif [ "$2" = 16p ]
            then
                 echo "$1" | grep -q -P "Roll No: 16\d{5,}"
                 if [ $? = 0 ]
                 then
                    var=$(echo "$1" | grep -P -A 11 "Roll No: 16\d{5,}")
                    echo "$var"
                    printf "\n"
                    echo "    To add a filter to your results,"
                    keyword "$var"
                else
                   printf "\n"
                   echo "***No Result Found***"
                   printf "\n"
                   ./ss.sh
                fi
          elif [ "$2" = 15p ]
            then
                 echo "$1" | grep -q -P "Roll No: 15\d{5,}"
                 if [ $? = 0 ]
                 then
                    var=$(echo "$1" | grep -P -A 11 "Roll No: 15\d{5,}")
                    echo "$var"
                    printf "\n"
                    echo "    To add a filter to your results,"
                    keyword "$var"
                else
                   printf "\n"
                   echo "***No Result Found***"
                   printf "\n"
                   ./ss.sh
                fi

          else
              echo "***Please enter a valid batch year***"
              printf "\n"
              ylist ""
          fi
      fi

}
 






program() {
           printf "\n"
 
       if [ -z "$1" ]
          then
             if [[ "$2" =~ [bB][tT] ]]
                then
                    var=$(grep -P -r -h -i -A 8 -B 3 --include="*\.txt" "BTech")
                    echo "$var"
                    printf "\n"
                    echo "   To add a filter to your results, enter desired keyword"
                    keyword "$var" 
             elif [[ "$2" =~ [bB][sS] ]]
                then
                    var=$(grep -P -r -h -i -A 8 -B 3 --include="*\.txt" "Program: BS")
                    echo "$var"
                    printf "\n"
                    echo "   To add a filter to your results, enter desired keyword"
                    keyword "$var"
             elif [[ "$2" =~ [mM][tT] ]]
                then
                    var=$(grep -P -r -h -i -A 8 -B 3 --include="*\.txt" "Program: MTech")
                    echo "$var"
                    printf "\n"
                    echo "   To add a filter to your results, enter desired keyword"
                    keyword "$var"
             elif [[ "$2" =~ [pP][hH][dD] ]]
                then
                    var=$(grep -P -r -h -i -A 8 -B 3 --include="*\.txt" "Program: PhD")
                    echo "$var"
                    printf "\n"
                    echo "   To add a filter to your results, enter desired keyword"
                    keyword "$var"
             elif [[ "$2" =~ [mM][sS] ]]
                then
                    var=$(grep -P -r -h -i -A 8 -B 3 --include="*\.txt" "Program: MS")
                    echo "$var"
                    printf "\n"
                    echo "   To add a filter to your results, enter desired keyword"
                    keyword "$var"
             elif [[ "$2" =~ [mM][dD] ]]
                then
                    var=$(grep -P -r -h -i -A 8 -B 3 --include="*\.txt" "Program: MD")
                    echo "$var"
                    printf "\n"
                    echo "   To add a filter to your results, enter desired keyword"
                    keyword "$var"
             elif [[ "$2" =~ [mM][bB][aA] ]]
                then
                    var=$(grep -P -r -h -i -A 8 -B 3 --include="*\.txt" "Program: Mana")
                    echo "$var"
                    printf "\n"
                    echo "   To add a filter to your results, enter desired keyword"
                    keyword "$var"
             else
                printf "\n"
                echo "***Please enter a valid program code***"
                printf "\n"
                plist ""  
             fi
       else
            if [[ "$2" =~ [bB][tT] ]]
                then
                    echo "$1" | grep -P -q -i -A 8 -B 3 "BTech"
                    if [ $? = 0 ]
                       then
                          var=$(echo "$1" | grep -P -i -A 8 -B 3 "BTech")
                          echo "$var"
                          printf "\n"
                          echo "   To add a filter to your results, enter desired keyword"
                          keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh   
                    fi
             elif [[ "$2" =~ [bB][sS] ]]
                 then
                    echo "$1" | grep -P -q -i -A 8 -B 3 "Program: BS"
                    if [ $? = 0 ]
                       then
                          var=$(echo "$1" | grep -P -i -A 8 -B 3 "Program: BS") 
                          echo "$var"
                          printf "\n"
                          echo "   To add a filter to your results, enter desired keyword"
                          keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh     
                    fi
             elif [[ "$2" =~ [mM][tT] ]]
                 then
                    echo "$1" | grep -P -q -i -A 8 -B 3 "MTech"
                    if [ $? = 0 ]
                       then
                          var=$(echo "$1" | grep -P -i -A 8 -B 3 "MTech")
                          echo "$var"
                          printf "\n"
                          echo "   To add a filter to your results, enter desired keyword"
                          keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [[ "$2" =~ [pP][hH][dD] ]]
                 then
                    echo "$1" | grep -P -q -i -A 8 -B 3 "Program: PhD"
                    if [ $? = 0 ]
                       then
                          var=$(echo "$1" | grep -P -i -A 8 -B 3 "Program: PhD")
                          echo "$var"
                          printf "\n"
                          echo "   To add a filter to your results, enter desired keyword"
                          keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [[ "$2" =~ [mM][sS] ]]
                 then
                    echo "$1" | grep -P -q -i -A 8 -B 3 "Program: MS"
                    if [ $? = 0 ]
                       then
                          var=$(echo "$1" | grep -P -i -A 8 -B 3 "Program: MS")
                          echo "$var"
                          printf "\n"
                          echo "   To add a filter to your results, enter desired keyword"
                          keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [[ "$2" =~ [mM][dD] ]]
                 then
                    echo "$1" | grep -P -q -i -A 8 -B 3 "Program: MD"
                    if [ $? = 0 ]
                       then
                          var=$(echo "$1" | grep -P -i -A 8 -B 3 "Program: MD")
                          echo "$var"
                          printf "\n"
                          echo "   To add a filter to your results, enter desired keyword"
                          keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [[ "$2" =~ [mM][bB][aA] ]]
                 then
                    echo "$1" | grep -P -q -i -A 8 -B 3 "Program: Mana"
                    if [ $? = 0 ]
                       then
                          var=$(echo "$1" | grep -P -i -A 8 -B 3 "Program: Mana")
                          echo "$var"
                          printf "\n"
                          echo "   To add a filter to your results, enter desired keyword"
                          keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             else
                  printf "\n"
                  echo "***Please enter a valid program code***"
                  printf "\n"
                  plist "$1"
             fi
      fi
} 

dept() {
       printf "\n"
       
       if [ -z "$1" ]
          then 
            if [ "$2" = ae ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "AEROSPACE")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = bsbe ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "Department: BIO")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"      
            elif [ "$2" = ce ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "CIVIL")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = che ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "CHEMICAL")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = chm ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "CHEMISTRY")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = cse ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "COMPUTER")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = eco ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "ECONOMICS")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = ee ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "ELECTRICAL")
                   echo "$var"
                   printf "\n"                   
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = me ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "MECHANICAL")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = mse ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "MATERIAL")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = mth ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "Department: MATH")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = phy ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "PHYSICS")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = es ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "EARTH")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = md ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "Department: DESIGN")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = mba ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "Department: .*management")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = net ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "NUCLEAR")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            elif [ "$2" = pse ]
                then
                   var=$(grep -P -r -h -i -A 7 -B 4 --include="*\.txt" "PHOTONICS")
                   echo "$var"
                   printf "\n"
                   echo "   To add a filter to your results, enter desired keyword"
                   keyword "$var"
            else
              echo "***Please enter a valid department code***"
              printf "\n"
              deptlist ""
           fi

        else

             if [ "$2" = ae ]
                then

                     echo "$1" | grep -q -P -i "AEROSPACE"
                
                     if [ $? = 0 ]  
                        then

                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "AEROSPACE")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                     fi
  
             elif [ "$2" = bsbe ]
                then
                   
                     echo "$1" | grep -q -P "Department: BIO"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "Department: BIO")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                     fi

             elif [ "$2" = ce ]
                then
                     
                     echo "$1" | grep -q -P -i "CIVIL"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "CIVIL")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi

             elif [ "$2" = che ]
                 then
  
                    echo "$1" | grep -q -P -i "CHEMICAL"

                    if [ $? = 0 ]
                       then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "CHEMICAL")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi

             elif [ "$2" = chy ]
                  then
                     
                     echo "$1" | grep -q -P -i "CHEMISTRY"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "CHEMISTRY")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                     fi

             elif [ "$2" = cse ]
                  then

                     echo "$1" | grep -q -P -i "COMPUTER"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "COMPUTER")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results,"
                           keyword "$var"
                    else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
              elif [ "$2" = eco ]
                   then

                      echo "$1" | grep -q -P -i "ECONOMICS"

                      if [ $? = 0 ]
                         then
                            var=$(echo "$1" | grep -P -i -A 7 -B 4 "ECONOMICS")
                            echo "$var"
                            printf "\n"
                            echo "   To add a filter to your results, enter desired keyword"
                            keyword "$var"
                      else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh                      
                      fi
              elif [ "$2" = ee ]
                   then 
           
                       echo "$1" | grep -q -P -i "ELECTRICAL"

                       if [ $? = 0 ]
                          then
                             var=$(echo "$1" | grep -P -i -A 7 -B 4 "ELECTRICAL")
                             echo "$var"
                             printf "\n"
                             echo "   To add a filter to your results, enter desired keyword"
                             keyword "$var"
                       else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                       fi

              elif [ "$2" = me ]
                   then 

                       echo "$1" | grep -q -P -i "MECHANICAL"

                       if [ $? = 0 ]
                          then
                             var=$(echo "$1" | grep -P -i -A 7 -B 4 "MECHANICAL")
                             echo "$var"
                             printf "\n"
                             echo "   To add a filter to your results, enter desired keyword"
                             keyword "$var"
                       else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                       fi

              elif [ "$2" = mse ]
                   then 
                       echo "$1" | grep -q -P -i "MATERIAL"

                       if [ $? = 0 ]
                          then
                             var=$(echo "$1" | grep -P -i -A 7 -B 4 "MATERIAL")
                             echo "$var"
                             printf "\n"
                             echo "   To add a filter to your results, enter desired keyword"
                             keyword "$var"
                       else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                       fi

             elif [ "$2" = mth ]
                  then 
                     
                     echo "$1" | grep -q -i -P "Department: MATH"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "Department: MATH")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                     fi

             elif [ "$2" = phy ]
                  then 
         
                     echo "$1" | grep -q -i -P "PHYSICS"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "PHYSICS")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [ "$2" = es ]
                  then

                     echo "$1" | grep -q -i -P "EARTH"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "EARTH")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [ "$2" = md ]
                  then

                     echo "$1" | grep -q -i -P "program :Design"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "program :Design")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [ "$2" = mba ]
                  then

                     echo "$1" | grep -q -i -P "program : .*management"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "program : .*management")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [ "$2" = net ]
                  then

                     echo "$1" | grep -q -i -P "NUCLEAR"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "NUCLEAR")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             elif [ "$2" = pse ]
                  then

                     echo "$1" | grep -q -i -P "PHOTONICS"

                     if [ $? = 0 ]
                        then
                           var=$(echo "$1" | grep -P -i -A 7 -B 4 "PHOTONICS")
                           echo "$var"
                           printf "\n"
                           echo "   To add a filter to your results, enter desired keyword"
                           keyword "$var"
                     else
                        printf "\n"
                        echo "***No Results Found***"
                        printf "\n"
                        ./ss.sh
                    fi
             else
                  echo "***Please enter a vaild department code**"
                  printf "\n"
                  deptlist "$1"
            fi 
       fi    
}






hostel() {
         printf "\n"
    
         if [ -z "$1" ]
          then
            if [ "$2" = 1 ] || [ "$2" = 2 ] || [ "$2" = 3 ] || [ "$2" = 4 ] || [ "$2" = 5 ] || [ "$2" = 6 ] || [ "$2" = 7 ] || [ "$2" = 8 ] || [ "$2" = 9 ] || [ "$2" = 12 ]
              then
                var=$(grep -P -r -h -i -A 6 -B 5 --include="*\.txt" "HALL$2[^2]")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results, enter desired keyword"
                keyword "$var"
           elif [ "$2" = 11 ] || [[ "$2" =~ [xX][iI] ]]
              then
                var=$(grep -P -r -h -i -A 6 -B 5 --include="*\.txt" "HALLXI")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results, enter desired keyword"
                keyword "$var"
           elif [ "$2" = 10 ] || [[ "$2" =~ [xX] ]] 
              then
                var=$(grep -P -r -h -i -A 6 -B 5 --include="*\.txt" "HALLX[^I]")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results, enter desired keyword"
                keyword "$var"
           elif [[ "$2" =~ [gG][hH] ]]
              then
                var=$(grep -P -r -h -i -A 6 -B 5 --include="*\.txt" "Hostel .* GH[^T]")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results, enter desired keyword"
                keyword "$var"
           elif [[ "$2" =~ [gG][hH][tT] ]]
              then
                var=$(grep -P -r -h -i -A 6 -B 5 --include="*\.txt" "Hostel .* GHT")
                echo "$var"
                printf "\n"
                echo "    To add a filter to your results, enter desired keyword"
                keyword "$var"

           else
              echo "***Please enter a valid hostel number***"
              printf "\n"
              read -p "Enter Hostel Number (eg- 2,3,4 etc):" h
              hostel "" "$h"
          fi
       else
          if [ "$2" = 1 ] || [ "$2" = 2 ] || [ "$2" = 3 ] || [ "$2" = 4 ] || [ "$2" = 5 ] || [ "$2" = 6 ] || [ "$2" = 7 ] || [ "$2" = 8 ] || [ "$2" = 9 ] || [ "$2" = 12 ]
             then
                 echo "$1" | grep -q -P -i "HALL$2[^2]"
                 if [ $? = 0 ]
                    then
                       var=$(echo "$1" | grep -P -A 6 -B 5 "HALL$2[^2]")
                       echo "$var"
                       printf "\n"
                       echo "    To add a filter to your results, enter desired keyword"
                       keyword "$var"
                 else
                     printf "\n"
                     echo "***No Results Found***"
                     printf "\n"              
                     ./ss.sh
                 fi
          elif [ "$2" = 10 ] || [[ "$2" =~ [xX] ]]
               then
                   echo "$1" | grep -P -q -A 6 -B 5 "HALLX[^I]"
                   if [ $? = 0 ]
                      then
                         var=$(echo "$1" | grep -P -A 6 -B 5 "HALLX[^I]")
                         echo "$var"
                         printf "\n"
                         echo "    To add a filter to your results, enter desired keyword"
                         keyword "$var"
                  else
                      printf "\n"
                      echo "***No Results Found***"
                      printf "\n"
                      ./ss.sh
                  fi
          elif [ "$2" = 11 ] || [[ "$2" =~ [xX][iI] ]]
               then
                   echo "$1" | grep -P -A 6 -B 5 "HALLXI"
                   if [ $? = 0 ]
                      then
                         var=$(echo "$1" | grep -P -A 6 -B 5 "HALLXI")
                         echo "$var"
                         printf "\n"
                      echo "    To add a filter to your results, enter desired keyword"
                      keyword "$var"
                   else
                      printf "\n"
                      echo "***No Results Found***"
                      printf "\n"
                      ./ss.sh
                   fi
          elif [[ "$2" =~ [gG][hH] ]]
               then
                   echo "$1" | grep -P -i -q -A 6 -B 5 "Hostel .* GH[^T]"
                   if [ $? = 0 ]
                      then
                         var=$(echo "$1" | grep -P -A 6 -B 5 "Hostel .* GH[^T]")
                         echo "$var"
                         printf "\n"
                         echo "    To add a filter to your results, enter desired keyword"
                         keyword "$var"
                  else
                      printf "\n"
                      echo "***No Results Found***"
                      printf "\n"
                      ./ss.sh
                  fi
          elif [[ "$2" =~ [gG][hH][tT] ]]
               then
                   echo "$1" | grep -P -i -q -A 6 -B 5 "Hostel .* GHT"
                   if [ $? = 0 ]
                      then
                         var=$(echo "$1" | grep -P -A 6 -B 5 "Hostel .* GHT")
                         echo "$var"
                         printf "\n"
                         echo "    To add a filter to your results, enter desired keyword"
                         keyword "$var"
                  else
                      printf "\n"
                      echo "***No Results Found***"
                      printf "\n"
                      ./ss.sh
                  fi

          else
              printf "\n"
              echo "***No Results Found***"
              printf "\n"              
              ./ss.sh
          fi
      fi
   


}









key_input() {

            read -p "Enter your keyword :" key
            if [ "$key" = rn ] 
               then
                  read -p "Enter Roll Number :" rn
                  roll "$1" "$rn"
            elif [ "$key" = n ]
               then
                  read -p "Enter Name :" name
                  name "$1" "$name" 
            elif [ "$key" = g ]
               then
                  read -p "Enter Gender ( M/F ) :" g
                  gender "$1" "$g"
            elif [ "$key" = y ]
               then
                  ylist "$1"
            elif [ "$key" = p ]
               then
                  plist "$1"
            elif [ "$key" = d ]
               then
                  deptlist "$1"
            elif [ "$key" = h ]
               then
                  read -p "Enter Hostel info (eg- 2,3,4,gh etc):" h
                  hostel "$1" "$h"
            elif [ "$key" = i ]
               then
                  image "$1"
            elif [ "$key" = bye ]
               then
                  exit
            else
               printf "\n"
               echo "   ***Please enter a valid Keyword***"
               printf "\n"
               keyword "$1"
            fi

}






keyword ""
