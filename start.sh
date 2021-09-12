if [[ -n $RCLONE_CONFIG ]]; then
 echo "rclone config detected"
 echo -e "$RCLONE_CONFIG" > /app/rclone.conf
fi
python3 -m tgtlg

if [[ -n $TOKEN_PICKLE_URL ]]; then
	wget -q $TOKEN_PICKLE_URL -O /usr/src/app/token.pickle
fi

if [[ -n $ACCOUNTS_ZIP_URL ]]; then
	wget -q $ACCOUNTS_ZIP_URL -O /usr/src/app/accounts.zip
	unzip accounts.zip -d /usr/src/app/accounts
	rm accounts.zip
fi

./aria.sh; python3 -m tgtlg
