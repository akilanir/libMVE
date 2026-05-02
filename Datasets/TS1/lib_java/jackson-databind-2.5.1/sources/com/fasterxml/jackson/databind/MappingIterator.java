package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.core.FormatSchema;
import com.fasterxml.jackson.core.JsonLocation;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/MappingIterator.class */
public class MappingIterator<T> implements Iterator<T>, Closeable {
    protected static final MappingIterator<?> EMPTY_ITERATOR = new MappingIterator<>(null, null, null, null, false, null);
    protected final JavaType _type;
    protected final DeserializationContext _context;
    protected final JsonDeserializer<T> _deserializer;
    protected JsonParser _parser;
    protected final boolean _closeParser;
    protected boolean _hasNextChecked;
    protected final T _updatedValue;

    @Deprecated
    protected MappingIterator(JavaType type, JsonParser jp, DeserializationContext ctxt, JsonDeserializer<?> deser) {
        this(type, jp, ctxt, deser, true, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected MappingIterator(JavaType type, JsonParser jp, DeserializationContext ctxt, JsonDeserializer<?> jsonDeserializer, boolean managedParser, Object obj) {
        this._type = type;
        this._parser = jp;
        this._context = ctxt;
        this._deserializer = jsonDeserializer;
        this._closeParser = managedParser;
        if (obj == 0) {
            this._updatedValue = null;
        } else {
            this._updatedValue = obj;
        }
        if (managedParser && jp != null && jp.getCurrentToken() == JsonToken.START_ARRAY) {
            jp.clearCurrentToken();
        }
    }

    protected static <T> MappingIterator<T> emptyIterator() {
        return (MappingIterator<T>) EMPTY_ITERATOR;
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        try {
            return hasNextValue();
        } catch (JsonMappingException e) {
            return ((Boolean) _handleMappingException(e)).booleanValue();
        } catch (IOException e2) {
            return ((Boolean) _handleIOException(e2)).booleanValue();
        }
    }

    @Override // java.util.Iterator
    public T next() {
        try {
            return nextValue();
        } catch (JsonMappingException e) {
            throw new RuntimeJsonMappingException(e.getMessage(), e);
        } catch (IOException e2) {
            throw new RuntimeException(e2.getMessage(), e2);
        }
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this._parser != null) {
            this._parser.close();
        }
    }

    public boolean hasNextValue() throws IOException {
        if (this._parser == null) {
            return false;
        }
        if (!this._hasNextChecked) {
            JsonToken t = this._parser.getCurrentToken();
            this._hasNextChecked = true;
            if (t == null) {
                JsonToken t2 = this._parser.nextToken();
                if (t2 == null || t2 == JsonToken.END_ARRAY) {
                    JsonParser jp = this._parser;
                    this._parser = null;
                    if (this._closeParser) {
                        jp.close();
                        return false;
                    }
                    return false;
                }
                return true;
            }
            return true;
        }
        return true;
    }

    public T nextValue() throws IOException {
        T t;
        if (!this._hasNextChecked && !hasNextValue()) {
            return (T) _throwNoSuchElement();
        }
        if (this._parser == null) {
            return (T) _throwNoSuchElement();
        }
        this._hasNextChecked = false;
        if (this._updatedValue == null) {
            t = this._deserializer.deserialize(this._parser, this._context);
        } else {
            this._deserializer.deserialize(this._parser, this._context, this._updatedValue);
            t = this._updatedValue;
        }
        this._parser.clearCurrentToken();
        return t;
    }

    public List<T> readAll() throws IOException {
        return readAll((MappingIterator<T>) new ArrayList());
    }

    public <L extends List<? super T>> L readAll(L resultList) throws IOException {
        while (hasNextValue()) {
            resultList.add(nextValue());
        }
        return resultList;
    }

    public <C extends Collection<? super T>> C readAll(C results) throws IOException {
        while (hasNextValue()) {
            results.add(nextValue());
        }
        return results;
    }

    public JsonParser getParser() {
        return this._parser;
    }

    public FormatSchema getParserSchema() {
        return this._parser.getSchema();
    }

    public JsonLocation getCurrentLocation() {
        return this._parser.getCurrentLocation();
    }

    protected <R> R _throwNoSuchElement() {
        throw new NoSuchElementException();
    }

    protected <R> R _handleMappingException(JsonMappingException e) {
        throw new RuntimeJsonMappingException(e.getMessage(), e);
    }

    protected <R> R _handleIOException(IOException e) {
        throw new RuntimeException(e.getMessage(), e);
    }
}
