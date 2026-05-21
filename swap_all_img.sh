if [ -n "$3" ]; then
  echo "recursively sweep: ./$1/*"
  echo "find : #$2"
  echo "rep  : #$3"
  echo ""
  echo " ------ ARE YOU SURE?? ------"
  echo "  Type IDefinitelyAmSure to confirm."
  read maybeconfirm
  if [ "$maybeconfirm" != "IDefinitelyAmSure" ]; then
    echo "exiting because you didnt type it right"
    echo ""
    exit
  fi
else
  echo "you need 3 args man"
  echo "1: your file path relative to this current dir"
  echo "2: find colour in hex rgb format (e.g. 000000)"
  echo "3: rep  colour in hex rgb format (e.g. ffffff)"
  echo "^ above would replace all black with white"
  exit
fi
for f in $(find "./$1/." -name '*.png');
  do echo "Converting $f";
  mogrify -format png -fill "#$3" -opaque "#$2" "$f";
done;

echo ""