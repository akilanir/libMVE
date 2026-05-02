package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/LazyWriteableDBDecoder.class */
public class LazyWriteableDBDecoder extends LazyDBDecoder {
    public static DBDecoderFactory FACTORY = new LazyDBDecoderFactory();

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/LazyWriteableDBDecoder$LazyDBDecoderFactory.class */
    static class LazyDBDecoderFactory implements DBDecoderFactory {
        LazyDBDecoderFactory() {
        }

        @Override // com.mongodb.DBDecoderFactory
        public DBDecoder create() {
            return new LazyWriteableDBDecoder();
        }
    }

    @Override // com.mongodb.LazyDBDecoder, com.mongodb.DBDecoder
    public DBCallback getDBCallback(DBCollection collection) {
        return new LazyWriteableDBCallback(collection);
    }
}
