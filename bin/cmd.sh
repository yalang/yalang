#!/bin/bash

PROJECT=qalblang

compile_n_run() {
    # Checking if python 3 is installed
    if command -v python3 &>/dev/null; then
        # Removing previous python converted file
        if [ -f "$1.py" ];then
            rm "$1.py"
        fi

        # Converting script to python
        python3 $HOME/$PROJECT/start.py "$1.$2"
        # Running python converted file
        if [ -f "$1.py" ];then
            python3 "$1.py"
        fi
    else
        echo "Python3 غير مثبت"
    fi
}

if [ "$#" -gt 0 ]; then
    IFS='.' read -ra names <<< "$1"

    if [ "${#names[@]}" -gt 1 ]; then
        compile_n_run "${names[0]}" "${names[1]}"
    else
        # Checking file extensions and running code
        if [ -f "$1.ي" ];then
            compile_n_run "$1" "ي"
        elif [ -f "$1.ya" ];then
            compile_n_run "$1" "ya"
        elif [ -f "$1.قلب" ];then
            compile_n_run "$1" "قلب"
        # For extension .qalb
        elif [ -f "$1.qalb" ];then
            compile_n_run "$1" "qalb"
        # For extension .ql
        elif [ -f "$1.ql" ];then
            compile_n_run "$1" "ql"
        else
            echo " ملف غير صالح $1"
        fi
    fi
else
    echo "من فضلك ادخل اسم الملف"
fi