plasma_save() {
    pushd "$HOME/konsave" || return
    trash "$1.knsv"
    konsave -s "$1" -f;
    if [ "$?" -ne 0 ]; then
        echo "Cannot save profile: ${1}"
        popd || return
        return 
    fi
    konsave -e "$1";
    if [ "$?" -ne 0 ] ; then
        echo "Cannot export profile: ${1}"
        popd || return
        return
    fi
    popd || return
}
