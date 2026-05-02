package com.mongodb;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBConnector.class */
public interface DBConnector {
    void requestStart();

    void requestDone();

    void requestEnsureConnection();

    WriteResult say(DB db, OutMessage outMessage, WriteConcern writeConcern);

    WriteResult say(DB db, OutMessage outMessage, WriteConcern writeConcern, ServerAddress serverAddress);

    Response call(DB db, DBCollection dBCollection, OutMessage outMessage, ServerAddress serverAddress, DBDecoder dBDecoder);

    Response call(DB db, DBCollection dBCollection, OutMessage outMessage, ServerAddress serverAddress, int i);

    Response call(DB db, DBCollection dBCollection, OutMessage outMessage, ServerAddress serverAddress, int i, ReadPreference readPreference, DBDecoder dBDecoder);

    boolean isOpen();

    CommandResult authenticate(MongoCredential mongoCredential);
}
