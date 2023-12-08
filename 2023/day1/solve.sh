trunc=$(grep -Eo '[0-9].*[0-9]*' input | grep -Eo '[0-9]*.*[0-9]')
sum=0
for i in $trunc; do
	tens=$(echo $i | grep -Eo '^[0-9]')
	ones=$(echo $i | grep -Eo '[0-9]$')
	num=$(echo $tens$ones)
	echo $num
	sum=$(($sum + $num))
done
echo $sum
