input=$(cat input | sed 's/ //g')

max_red=12
max_green=13
max_blue=14

sum=0

for i in $input; do
	game=$(echo $i | grep -Eo 'Game[0-9]*' | grep -Eo '[0-9]*')
	reds=$(echo $i | grep -Eo '[0-9]*red' | grep -Eo '[0-9]*')
	for count in $reds; do
		[ $count -gt $max_red ] && game=0
	done

	blues=$(echo $i | grep -Eo '[0-9]*blue' | grep -Eo '[0-9]*')
	for count in $blues; do
		[ $count -gt $max_blue ] && game=0
	done

	greens=$(echo $i | grep -Eo '[0-9]*green' | grep -Eo '[0-9]*')
	for count in $greens; do
		[ $count -gt $max_green ] && game=0
	done

	sum=$(($sum + $game))
done
echo $sum
