package com.koushikdutta.ion;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.koushikdutta.async.callback.CompletedCallback;
import com.koushikdutta.async.future.Future;
import com.koushikdutta.async.future.SimpleFuture;
import com.koushikdutta.async.parser.AsyncParser;
import com.koushikdutta.async.parser.DocumentParser;
import com.koushikdutta.async.parser.StringParser;
import com.koushikdutta.async.stream.FileDataSink;
import com.koushikdutta.async.util.FileCache;
import com.koushikdutta.ion.gson.GsonArrayParser;
import com.koushikdutta.ion.gson.GsonObjectParser;
import com.koushikdutta.ion.gson.GsonSerializer;
import java.io.File;
import org.w3c.dom.Document;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/FileCacheStore.class */
public class FileCacheStore {
    Ion ion;
    FileCache cache;
    String rawKey;

    FileCacheStore(Ion ion, FileCache cache, String rawKey) {
        this.ion = ion;
        this.cache = cache;
        this.rawKey = rawKey;
    }

    private <T> Future<T> put(final T value, final AsyncParser<T> parser) {
        final SimpleFuture<T> ret = new SimpleFuture<>();
        Ion.getIoExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.FileCacheStore.1
            @Override // java.lang.Runnable
            public void run() {
                final String key = FileCacheStore.this.computeKey();
                final File file = FileCacheStore.this.cache.getTempFile();
                final FileDataSink sink = new FileDataSink(FileCacheStore.this.ion.getServer(), file);
                parser.write(sink, value, new CompletedCallback() { // from class: com.koushikdutta.ion.FileCacheStore.1.1
                    public void onCompleted(Exception ex) {
                        sink.end();
                        if (ex != null) {
                            file.delete();
                            ret.setComplete(ex);
                        } else {
                            FileCacheStore.this.cache.commitTempFiles(key, new File[]{file});
                            ret.setComplete(value);
                        }
                    }
                });
            }
        });
        return ret;
    }

    public Future<String> putString(String value) {
        return put((FileCacheStore) value, (AsyncParser<FileCacheStore>) new StringParser());
    }

    public Future<JsonObject> putJsonObject(JsonObject value) {
        return put((FileCacheStore) value, (AsyncParser<FileCacheStore>) new GsonObjectParser());
    }

    public Future<Document> putDocument(Document value) {
        return put((FileCacheStore) value, (AsyncParser<FileCacheStore>) new DocumentParser());
    }

    public Future<JsonArray> putJsonArray(JsonArray value) {
        return put((FileCacheStore) value, (AsyncParser<FileCacheStore>) new GsonArrayParser());
    }

    public <T> Future<T> put(T value, Class<T> clazz) {
        return put((FileCacheStore) value, (AsyncParser<FileCacheStore>) new GsonSerializer(this.ion.configure().getGson(), clazz));
    }

    public <T> Future<T> put(T value, TypeToken<T> token) {
        return put((FileCacheStore) value, (AsyncParser<FileCacheStore>) new GsonSerializer(this.ion.configure().getGson(), token));
    }

    private <T> Future<T> as(final AsyncParser<T> parser) {
        final SimpleFuture<T> ret = new SimpleFuture<>();
        Ion.getIoExecutorService().execute(new Runnable() { // from class: com.koushikdutta.ion.FileCacheStore.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    String key = FileCacheStore.this.computeKey();
                    File file = FileCacheStore.this.cache.getFile(key);
                    if (!file.exists()) {
                        ret.setComplete((Object) null);
                    } else {
                        FileCacheStore.this.ion.build(FileCacheStore.this.ion.getContext()).load(file).as(parser).setCallback(ret.getCompletionCallback());
                    }
                } catch (Exception e) {
                    ret.setComplete(e);
                }
            }
        });
        return ret;
    }

    private <T> T get(AsyncParser<T> asyncParser) {
        try {
            return (T) this.ion.build(this.ion.getContext()).load(this.cache.getFile(computeKey())).as(asyncParser).get();
        } catch (Exception e) {
            return null;
        }
    }

    public String getString() {
        return (String) get((AsyncParser) new StringParser());
    }

    public Future<String> asString() {
        return as((AsyncParser) new StringParser());
    }

    public Future<JsonObject> asJsonObject() {
        return as(new GsonObjectParser());
    }

    public JsonObject getJsonObject() {
        return (JsonObject) get(new GsonObjectParser());
    }

    public Future<JsonArray> asJsonArray() {
        return as(new GsonArrayParser());
    }

    public JsonArray getJsonArray() {
        return (JsonArray) get(new GsonArrayParser());
    }

    public Future<Document> asDocument() {
        return as((AsyncParser) new DocumentParser());
    }

    public Document getDocument() {
        return (Document) get((AsyncParser) new DocumentParser());
    }

    public <T> Future<T> as(Class<T> clazz) {
        return as(new GsonSerializer(this.ion.configure().getGson(), clazz));
    }

    public <T> T get(Class<T> cls) {
        return (T) get(new GsonSerializer(this.ion.configure().getGson(), cls));
    }

    public <T> Future<T> as(TypeToken<T> token) {
        return as(new GsonSerializer(this.ion.configure().getGson(), token));
    }

    public <T> T get(TypeToken<T> typeToken) {
        return (T) get(new GsonSerializer(this.ion.configure().getGson(), typeToken));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String computeKey() {
        return this.rawKey.replace(":", "_");
    }

    public void remove() {
        String key = computeKey();
        this.cache.remove(key);
    }
}
