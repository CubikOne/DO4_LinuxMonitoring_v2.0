#!/bin/bash

function ips() {
   echo $((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))
}

codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
#200 - OK: Запрос был успешно обработан, и сервер возвращает запрошенные данные.
#201 - Created: Запрос на создание ресурса был успешно выполнен, и новый ресурс был создан.
#400 - Bad Request: Запрос содержит синтаксическую ошибку или некорректные данные, и сервер не может его обработать.
#401 - Unauthorized: Для доступа к запрашиваемому ресурсу требуется аутентификация. Клиент должен предоставить правильные учетные данные.
#403 - Forbidden: Доступ к запрашиваемому ресурсу запрещен. Сервер понимает запрос, но отказывается его выполнить из-за ограничений доступа.
#404 - Not Found: Запрашиваемый ресурс не найден на сервере.
#500 - Internal Server Error: Произошла внутренняя ошибка сервера, которая мешает ему обработать запрос.
#501 - Not Implemented: Сервер не поддерживает функциональность, необходимую для обработки запроса клиента.
#502 - Bad Gateway: Сервер, который является посредником или шлюзом между клиентом и целевым сервером, получает недействительный ответ от целевого сервера.
#503 - Service Unavailable: Сервер временно недоступен из-за перегрузки или обслуживания. Клиент может повторить запрос позднее.

methods=("GET" "POST" "PUT" "PATCH" "DELETE")

agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")

month=$((RANDOM % 7 + 1))

for i in {1..5}; do
    log_file="./access_logs/$i.log"
    touch $log_file
    records=$((RANDOM % 901 + 100))

    for (( j = 0; j <= $records; j++ )); do
        ip=$(ips)
        code=${codes[$((RANDOM % ${#codes[@]}))]}
        method=${methods[$((RANDOM % ${#methods[@]}))]}
        agent=${agents[$((RANDOM % ${#agents[@]}))]}
        url="/page$j.html"
        date_and_time=$(LC_TIME=en_US.UTF-8 date -u -d "2023-$month-$i $((RANDOM % 24)):$((RANDOM % 60)):$((RANDOM % 60))" +"%d/%b/%Y:%H:%M:%S")
        
        echo "$ip - $date_and_time \"$method $url HTTP/1.1\" $code \"$agent\"" >> $log_file
    done
    sort -k 3 -o "$log_file" "$log_file"
done 