# Require rredis package
library("rredis")

# Connect to Redis server
redisConnect(host="127.0.0.1", port=6379)

# Run dbsize command on Redis
x <- redisCmd('dbsize')

# Print result
print(x)

# Close connection to Redis
redisClose()

