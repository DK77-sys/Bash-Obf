#! /bin/bash
loader='#! /bin/bash
tail -n+"$((LINENO + 2))" "$BASH_SOURCE" | gzip -c -d | source /dev/stdin;
status="$?"; return "$status" 2> /dev/null || exit "$status"
'
for original; do
        obfuscated="$original-obfuscated.sh"
        printf %s "$loader" > "$obfuscated"
        gzip -c "$original" >> "$obfuscated"
        chmod u+x "$obfuscated"
done
