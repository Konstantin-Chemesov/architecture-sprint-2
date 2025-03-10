docker compose exec -T configSrv mongosh --port 27017 --quiet <<EOF
rs.initiate(
  {
    _id : "config_server",
       configsvr: true,
    members: [
      { _id : 0, host : "configSrv:27017" }
    ]
  }
);
exit();
EOF


docker compose exec -T shard1-replica1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    { _id : "shard1", members:
        [
            { _id : 0, host : "shard1-replica1:27018" },
            { _id : 1, host : "shard1-replica2:27028" },
            { _id : 2, host : "shard1-replica3:27038" }
        ]
    }
);
exit();
EOF


docker compose exec -T shard2-replica1 mongosh --port 27019 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2",
      members:
        [
            { _id : 0, host : "shard2-replica1:27019" },
            { _id : 1, host : "shard2-replica2:27029" },
            { _id : 2, host : "shard2-replica3:27039" }
        ]
    }
);
exit();
EOF
