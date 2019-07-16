
# add to each line
printf "NO SCRIPT\n"
exit 0
find ./ -name "*html" |xargs -I XX ex -sc '1i|{{ "<!-- hugo enter:  XX -->" |safeHTML}}' -cx ${PWD}/XX


echo "content/post/first_article.md"| \
xargs -I '{}' bash -c ' _line=$(ggrep -n '+++' '{}'|cut -f1 -d':'|tail -1) ; gsed -i "${_line}a HUGO_ENTER_PLACEHOLDER" '{}' '

HUGO_ENTER_PLACEHOLDER="{{ \"<!-- hugo enter:  XX -->\" |safeHTML}}" && \
echo "content/post/first_article.md"| xargs -I '{}' gsed -i "s/HUGO_ENTER_PLACEHOLDER/${HUGO_ENTER_PLACEHOLDER}/g"  '{}'