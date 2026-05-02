package org.msgpack.util.json;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.msgpack.MessagePack;
import org.msgpack.type.Value;
import org.msgpack.type.ValueFactory;
import org.msgpack.unpacker.Converter;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/json/JSONUnpacker.class */
public class JSONUnpacker extends Converter {
    protected Reader in;
    private JSONParser parser;

    public JSONUnpacker(InputStream in) {
        this(new MessagePack(), in);
    }

    public JSONUnpacker(MessagePack msgpack, InputStream in) {
        this(msgpack, new InputStreamReader(in));
    }

    public JSONUnpacker(MessagePack msgpack, InputStream in, Charset cs) {
        this(msgpack, new InputStreamReader(in, cs));
    }

    JSONUnpacker(MessagePack msgpack, Reader in) {
        super(msgpack, null);
        this.in = in;
        this.parser = new JSONParser();
    }

    @Override // org.msgpack.unpacker.Converter
    protected Value nextValue() throws IOException {
        try {
            Object obj = this.parser.parse(this.in);
            return objectToValue(obj);
        } catch (ParseException e) {
            throw new IOException((Throwable) e);
        } catch (IOException e2) {
            throw new IOException(e2);
        }
    }

    private Value objectToValue(Object obj) {
        if (obj instanceof String) {
            return ValueFactory.createRawValue((String) obj);
        }
        if (obj instanceof Integer) {
            return ValueFactory.createIntegerValue(((Integer) obj).intValue());
        }
        if (obj instanceof Long) {
            return ValueFactory.createIntegerValue(((Long) obj).longValue());
        }
        if (obj instanceof Map) {
            return mapToValue((Map) obj);
        }
        if (obj instanceof List) {
            return listToValue((List) obj);
        }
        if (obj instanceof Boolean) {
            return ValueFactory.createBooleanValue(((Boolean) obj).booleanValue());
        }
        if (obj instanceof Double) {
            return ValueFactory.createFloatValue(((Double) obj).doubleValue());
        }
        return ValueFactory.createNilValue();
    }

    private Value listToValue(List list) {
        Value[] array = new Value[list.size()];
        for (int i = 0; i < array.length; i++) {
            array[i] = objectToValue(list.get(i));
        }
        return ValueFactory.createArrayValue(array, true);
    }

    private Value mapToValue(Map map) {
        Value[] kvs = new Value[map.size() * 2];
        Iterator<Map.Entry> it = map.entrySet().iterator();
        for (int i = 0; i < kvs.length; i += 2) {
            Map.Entry pair = it.next();
            kvs[i] = objectToValue(pair.getKey());
            kvs[i + 1] = objectToValue(pair.getValue());
        }
        return ValueFactory.createMapValue(kvs, true);
    }

    @Override // org.msgpack.unpacker.Converter, org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public int getReadByteCount() {
        throw new UnsupportedOperationException("Not implemented yet");
    }

    @Override // org.msgpack.unpacker.AbstractUnpacker, org.msgpack.unpacker.Unpacker
    public void resetReadByteCount() {
        throw new UnsupportedOperationException("Not implemented yet");
    }

    @Override // org.msgpack.unpacker.Converter, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
        super.close();
    }
}
