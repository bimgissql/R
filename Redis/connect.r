# Require rredis package
library("rredis")

# Connect to Redis server
redisConnect(host="127.0.0.1", port=6379)

# Set key/value
redisSet("x1",123)

# Get x
redisGet("x1")

# Set y to value of x 
y <- redisGet("x1")

# Show y
print(y)

# Pass any command to Redis
redisCmd('set','x2','456')
redisCmd('get','x2')

# Close connection to Redis
redisClose()


