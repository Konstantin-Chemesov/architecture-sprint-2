docker compose exec -T mongodb1 mongosh --port 27017 --quiet <<EOF

sh.enableSharding("somedb");
use somedb
for(var i = 0; i < 1500; i++) db.helloDoc.insert({age:i, name:"ly"+i})
db.helloDoc.countDocuments()
exit();
EOF