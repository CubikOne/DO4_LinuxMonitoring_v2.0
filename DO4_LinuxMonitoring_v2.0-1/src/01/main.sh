source output.sh

rm -rf "$dir/report.log" 
touch "$dir/report.log"

for ((i = 0; i < ${folders_num}; i++)); do
create_folders $i
done