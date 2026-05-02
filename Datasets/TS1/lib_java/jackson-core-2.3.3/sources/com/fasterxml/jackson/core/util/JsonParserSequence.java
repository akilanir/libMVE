package com.fasterxml.jackson.core.util;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/util/JsonParserSequence.class */
public class JsonParserSequence extends JsonParserDelegate {
    protected final JsonParser[] _parsers;
    protected int _nextParser;

    protected JsonParserSequence(JsonParser[] jsonParserArr) {
        super(jsonParserArr[0]);
        this._parsers = jsonParserArr;
        this._nextParser = 1;
    }

    public static JsonParserSequence createFlattened(JsonParser jsonParser, JsonParser jsonParser2) {
        if (!(jsonParser instanceof JsonParserSequence) && !(jsonParser2 instanceof JsonParserSequence)) {
            return new JsonParserSequence(new JsonParser[]{jsonParser, jsonParser2});
        }
        ArrayList arrayList = new ArrayList();
        if (jsonParser instanceof JsonParserSequence) {
            ((JsonParserSequence) jsonParser).addFlattenedActiveParsers(arrayList);
        } else {
            arrayList.add(jsonParser);
        }
        if (jsonParser2 instanceof JsonParserSequence) {
            ((JsonParserSequence) jsonParser2).addFlattenedActiveParsers(arrayList);
        } else {
            arrayList.add(jsonParser2);
        }
        return new JsonParserSequence((JsonParser[]) arrayList.toArray(new JsonParser[arrayList.size()]));
    }

    protected void addFlattenedActiveParsers(List<JsonParser> list) {
        int length = this._parsers.length;
        for (int i = this._nextParser - 1; i < length; i++) {
            JsonParser jsonParser = this._parsers[i];
            if (jsonParser instanceof JsonParserSequence) {
                ((JsonParserSequence) jsonParser).addFlattenedActiveParsers(list);
            } else {
                list.add(jsonParser);
            }
        }
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        do {
            this.delegate.close();
        } while (switchToNext());
    }

    @Override // com.fasterxml.jackson.core.util.JsonParserDelegate, com.fasterxml.jackson.core.JsonParser
    public JsonToken nextToken() throws IOException, JsonParseException {
        JsonToken nextToken = this.delegate.nextToken();
        if (nextToken != null) {
            return nextToken;
        }
        while (switchToNext()) {
            JsonToken nextToken2 = this.delegate.nextToken();
            if (nextToken2 != null) {
                return nextToken2;
            }
        }
        return null;
    }

    public int containedParsersCount() {
        return this._parsers.length;
    }

    protected boolean switchToNext() {
        if (this._nextParser >= this._parsers.length) {
            return false;
        }
        JsonParser[] jsonParserArr = this._parsers;
        int i = this._nextParser;
        this._nextParser = i + 1;
        this.delegate = jsonParserArr[i];
        return true;
    }
}
