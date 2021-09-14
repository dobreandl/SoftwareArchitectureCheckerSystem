clear

echo "cat result | wc -l"
cat result | wc -l

echo "cat out | wc -l"
cat out | wc -l

echo 'diff --new-line-format="" --unchanged-line-format="" result out | wc -l'
diff --new-line-format="" --unchanged-line-format="" result out | wc -l

echo 'diff --new-line-format="" --unchanged-line-format="" out result | wc -l'
diff --new-line-format="" --unchanged-line-format="" out result | wc -l