package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBPortFactory.class */
class DBPortFactory implements ConnectionFactory {
    private final MongoOptions options;

    DBPortFactory(MongoOptions options) {
        this.options = options;
    }

    @Override // com.mongodb.ConnectionFactory
    public Connection create(ServerAddress serverAddress, PooledConnectionProvider provider, int generation) {
        return new DBPort(serverAddress, provider, this.options, generation);
    }
}
