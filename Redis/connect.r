# Require rredis package
library("rredis")

# Connect to Redis server
redisConnect(host="127.0.0.1", port=6379)

# Set key/value
redisSet("x",123)

# Get x
redisGet("x")

# Set y to value of x 
y <- redisGet("x")

# Show y
print(y)



