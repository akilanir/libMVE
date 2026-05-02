package com.mongodb;

import java.io.IOException;
import java.io.InputStream;
import org.bson.BasicBSONDecoder;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DefaultDBDecoder.class */
public class DefaultDBDecoder extends BasicBSONDecoder implements DBDecoder {
    public static DBDecoderFactory FACTORY = new DefaultFactory();

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DefaultDBDecoder$DefaultFactory.class */
    static class DefaultFactory implements DBDecoderFactory {
        DefaultFactory() {
        }

        @Override // com.mongodb.DBDecoderFactory
        public DBDecoder create() {
            return new DefaultDBDecoder();
        }

        public String toString() {
            return "DefaultDBDecoder.DefaultFactory";
        }
    }

    @Override // com.mongodb.DBDecoder
    public DBCallback getDBCallback(DBCollection collection) {
        return new DefaultDBCallback(collection);
    }

    @Override // com.mongodb.DBDecoder
    public DBObject decode(byte[] b, DBCollection collection) {
        DBCallback cbk = getDBCallback(collection);
        cbk.reset();
        decode(b, cbk);
        return (DBObject) cbk.get();
    }

    @Override // com.mongodb.DBDecoder
    public DBObject decode(InputStream in, DBCollection collection) throws IOException {
        DBCallback cbk = getDBCallback(collection);
        cbk.reset();
        decode(in, cbk);
        return (DBObject) cbk.get();
    }

    public String toString() {
        return "DefaultDBDecoder";
    }
}
