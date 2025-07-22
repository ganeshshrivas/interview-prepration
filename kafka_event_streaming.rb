| Feature             | **Kafka**                                                                           | **SNS (Simple Notification Service)**           | **SQS (Simple Queue Service)**                    |
| ------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------- | ------------------------------------------------- |
| **Type**            | Distributed Event Streaming Platform                                                | Pub/Sub (fan-out) Notification Service          | Message Queue (point-to-point)                    |
| **Message Model**   | **Topic-based log**, supports **multiple consumers** with their own offset tracking | Pub/Sub push (to email, SMS, HTTP, SQS, Lambda) | FIFO or Standard queue for **decoupling systems** |
| **Persistence**     | Messages persisted on disk (retention configurable)                                 | Optional (short-lived)                          | Yes (retained until processed or expired)         |
| **Reprocessing**    | ✔ Replayable messages (based on offset)                                             | ❌ No (once delivered, it's gone)                | ❌ No (unless message visibility timeout is used)  |
| **Scaling**         | High throughput (millions of messages/sec)                                          | Moderate throughput                             | Moderate throughput (scales horizontally)         |
| **Use Case**        | Real-time stream processing, event sourcing                                         | Broadcasting messages to subscribers            | Decoupling between producer and consumer          |
| **Delivery Method** | Consumers pull messages                                                             | Push (to subscribers)                           | Consumers pull messages                           |



===============================================================================================================================================

| Feature                  | **Apache Kafka**                                     | **Amazon Kinesis**                                                           |
| ------------------------ | ---------------------------------------------------- | ---------------------------------------------------------------------------- |
| **Type**                 | Distributed streaming platform                       | Managed streaming service                                                    |
| **Provider**             | Open-source (Apache) or Confluent-managed            | AWS-managed                                                                  |
| **Message Retention**    | Configurable (hours to forever)                      | Up to 7 days (default), extended via Kinesis Data Streams Extended Retention |
| **Data Replay**          | ✔ Yes (based on offset)                              | ✔ Yes (within retention window)                                              |
| **Scaling Model**        | Manual (add brokers, partitions)                     | Automatic or via shard splitting/merging                                     |
| **Delivery Guarantees**  | At least once (exactly-once possible with effort)    | At least once (no exactly-once out of box)                                   |
| **Latency**              | Low (< 10 ms)                                        | Slightly higher (\~70-200 ms)                                                |
| **Throughput**           | Very high (millions of messages/sec)                 | High (scales with shards)                                                    |
| **Operational Overhead** | High (unless using Confluent Cloud)                  | Low (fully managed by AWS)                                                   |
| **Storage Backend**      | Disk-based on brokers                                | Managed by AWS                                                               |
| **Integration**          | Native with Kafka ecosystem (Kafka Connect, Streams) | Tight with AWS services (Lambda, S3, Redshift, etc.)                         |
