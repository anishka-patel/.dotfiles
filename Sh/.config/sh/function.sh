cp2bk() {
	cp -r "$1" "$1.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
}

sudocp2bk() {
	sudo cp -r "$1" "$1.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
}

mv2bk() {
	mv "$1" "$1.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
}

sudomv2bk() {
	sudo mv "$1" "$1.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
}

bked() {
	cp "$1" "$1.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
	if [ "$?" -ne 0 ]; then
		echo "Cannot make backup copy"
		return
	fi
	nvim "$1"
}

sudobked() {
	sudo cp "$1" "$1.$(date +'%Y-%m-%d_%H:%M:%S_%Z').bak"
	if [ "$?" -ne 0 ]; then
		echo "Cannot make backup copy"
		return
	fi
	sudoedit "$1"
}
