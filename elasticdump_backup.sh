# apt-get install nodejs && ln -s /usr/bin/nodejs /usr/bin/node && npm install elasticdump -g
es_date=`date +%Y-%m-%d-%H-%M-%S`
mkdir -p "/root/backup/"$es_date

for index_name in index1 index2 index3
do
	#index_name="received_email"
	es_src="http://172.31.15.125:9200/"$index_name
	es_backup_mapping="/root/backup/"$es_date"/"$index_name"_mapping.json"
	es_backup_data="/root/backup/"$es_date"/"$index_name"_data.json"
	es_backup_analyzer="/root/backup/"$es_date"/"$index_name"_analyzer.json"

	elasticdump \
          --input=$es_src \
          --output=$es_backup_analyzer \
          --type=analyzer

	elasticdump \
	  --input=$es_src \
	  --output=$es_backup_mapping \
	  --type=mapping

	elasticdump \
	  --input=$es_src \
	  --output=$es_backup_data \
	  --type=data
done
# How to restore
# elasticdump --input=./received_email_analyzer.json --output=http://es-host:9200/received_email --type=analyzer
# elasticdump --input=./received_email_mapping.json --output=http://es-host:9200/received_email --type=mapping
# elasticdump --input=./received_email_data.json --output=http://es-host:9200/received_email --type=data
 
