# terraform-aws-elasticache-redis

Terraform module for AWS Elasticache Redis cluster mode enabled/disabled setup.

## Why?

There are [many](https://github.com/search?q=aws+elasticache) AWS Elasticache Redis Terraform modules. Why do you need
another one?

I was working with customers to do Chaos testing for their AWS Elasticache Redis setups which involved asking the question -
**What do you lose when you lose an AZ in an AWS Elasticache Redis setup?**

The answer varies depending on your AWS Elasticache Redis setup. You can either lose a primary node, a replica node or
one primary and multiple replica nodes in one or multiple shards. Testing this meant creating infra which simulated all
these setups.

This was not possible by existing Terraform modules because their aim is to give you their version of a best pracitice
Redis cluster setup - which in most cases is - AWS Elasticache Redis with cluster mode enabled.

This module aims to bridge that gap by allowing the user to create both cluster mode enabled and cluster mode disabled setup
with an ability to house primary/replica nodes in same/different AZs for cluster mode disabled setups. As of this writing,
for cluster mode enabled, you **cannot** choose which AZ your primary/replica nodes go in - that is decided by AWS at runtime.

This module does not claim to be **the** best way to create AWS Elasticache Redis infra. Rather, it tries to help you get away with the
minimal infra you need to try out different AWS Elasticache Redis setups.

### Different types of AWS Elasticache Redis setups

You can configure AWS Elasticache Redis clusters in one of the following ways.

1. [Cluster mode enabled](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Clusters.Create.CON.RedisCluster.html)
2. [Cluster mode disabled](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/Replication.CreatingReplGroup.NoExistingCluster.Classic.html)

### Different types of Availability zone attacks you can run on AWS Elasticache Redis setups

1. Cluster mode disabled with primary node in target AZ.
2. Cluster mode disabled with replica node in target AZ.
3. Cluster mode disabled with primary and replica nodes in target AZ.
4. Cluster mode enabled with primary **and/or** replica nodes in target AZ.

### Talk is cheap - show me the code

Check [examples/complete](./examples/complete) which creates all of the above setups.

### Terminologies

The following terminologies are used on AWS Elasticache UI:

- Node: A single Redis instance
- Primary node: Writer node
- Replica node: Reader node
- Shard: A logical term which is used to described partitioned data slot. A shard can contain one or more nodes.
- Cluster: A logical grouping of shards. A cluster may contain one or more shards. A single shard cluster means that the AWS Elasticache Redis setup was created with cluster mode disabled.

### How to release newer versions of this module

This module uses a simple [Rakefile](./Rakefile) and a [VERSION](./VERSION)
file for following [semantic versioning](https://semver.org/).

1. To release a patch version of this module:

    ```sh
    rake release
    ```

    OR

    ```sh
    rake release:patch
    ```

2. To release a minor version of this module:

    ```sh
    rake release:minor
    ```

3. To release a major version of this module:

    ```sh
    rake release:major
    ```
