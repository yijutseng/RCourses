library(sparklyr)

conf <- spark_config()
conf$spark.executor.memory <- "2GB"
conf$spark.memory.fraction <- 0.9

sc <- spark_connect(master="spark://ip-172-31-53-198.ec2.internal:7077", 
                    version = "2.1.0",
                    config = conf,
                    spark_home = "/home/ubuntu/spark-2.1.0-bin-hadoop2.7/")




