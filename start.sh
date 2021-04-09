#!/bin/bash
/usr/bin/v2ray -config /etc/v2ray/config.json
echo "--- v2ray&nginx started ---"
tail -f /dev/null