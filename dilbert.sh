while true # eternal loop
do
python3 dilbert.py 
feh -F dilbert_comic &  # show image in full screen mode
sleep 10
kill $!
done
