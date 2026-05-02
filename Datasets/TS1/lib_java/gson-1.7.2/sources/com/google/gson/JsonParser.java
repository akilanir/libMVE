package com.google.gson;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.MalformedJsonException;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

/* loaded from: gson-1.7.2.jar:com/google/gson/JsonParser.class */
public final class JsonParser {
    public JsonElement parse(String json) throws JsonSyntaxException {
        return parse(new StringReader(json));
    }

    public JsonElement parse(Reader json) throws JsonIOException, JsonSyntaxException {
        try {
            JsonReader jsonReader = new JsonReader(json);
            JsonElement element = parse(jsonReader);
            if (!element.isJsonNull() && jsonReader.peek() != JsonToken.END_DOCUMENT) {
                throw new JsonSyntaxException("Did not consume the entire document.");
            }
            return element;
        } catch (MalformedJsonException e) {
            throw new JsonSyntaxException(e);
        } catch (IOException e2) {
            throw new JsonIOException(e2);
        } catch (NumberFormatException e3) {
            throw new JsonSyntaxException(e3);
        }
    }

    public JsonElement parse(JsonReader json) throws JsonIOException, JsonSyntaxException {
        boolean lenient = json.isLenient();
        json.setLenient(true);
        try {
            try {
                try {
                    try {
                        JsonElement parse = Streams.parse(json);
                        json.setLenient(lenient);
                        return parse;
                    } catch (JsonParseException e) {
                        if (e.getCause() instanceof EOFException) {
                            JsonNull createJsonNull = JsonNull.createJsonNull();
                            json.setLenient(lenient);
                            return createJsonNull;
                        }
                        throw e;
                    }
                } catch (OutOfMemoryError e2) {
                    throw new JsonParseException("Failed parsing JSON source: " + json + " to Json", e2);
                }
            } catch (StackOverflowError e3) {
                throw new JsonParseException("Failed parsing JSON source: " + json + " to Json", e3);
            }
        } catch (Throwable th) {
            json.setLenient(lenient);
            throw th;
        }
    }
}
