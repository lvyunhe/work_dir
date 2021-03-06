HADOOP="/usr/local/webserver/hadoop/bin/hadoop";
${HADOOP} jar /usr/local/webserver/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.6.0.jar \
	-archives /home/rank/lvyunhe/hadoop/work/work.zip'#work' \
	-mapper "sh -x work/count_map.sh" \
	-reducer "sh -x work/count_reduce.sh" \
	-input "/home/rank/lvyunhe/hadoop/count_test/title_seg0/part-*" \
	-output "/home/rank/lvyunhe/hadoop/count_test/count_test" \
	-partitioner "org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner" \
	-jobconf stream.map.output.field.separator="	" \
	-jobconf stream.num.map.output.key.fields="1" \
	-jobconf map.output.key.field.separator="	" \
	-jobconf num.key.fields.for.partition="1" \
	-jobconf mapred.reduce.tasks="997" \
	-jobconf mapred.compress.map.output="false" \
	-jobconf mapred.output.compress="false" \
	-jobconf mapred.job.priority="NORMAL" \
	-jobconf mapred.job.queue.name="rank" \
	-jobconf stream.memory.limit="1024" \
	-jobconf mapred.map.capacity.per.tasktracker="7" \
	-jobconf mapred.reduce.capacity.per.tasktracker="7" \
	-jobconf mapred.job.name="count_test2@lvyunhe" 1>count_datatest2.msg 2>count_datatest2.err
