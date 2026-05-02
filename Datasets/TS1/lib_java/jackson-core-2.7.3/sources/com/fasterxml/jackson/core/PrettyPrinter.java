package com.fasterxml.jackson.core;

import java.io.IOException;

/* loaded from: jackson-core-2.7.3.jar:com/fasterxml/jackson/core/PrettyPrinter.class */
public interface PrettyPrinter {
    void writeRootValueSeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;

    void writeStartObject(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;

    void writeEndObject(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException;

    void writeObjectEntrySeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;

    void writeObjectFieldValueSeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;

    void writeStartArray(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;

    void writeEndArray(JsonGenerator jsonGenerator, int i) throws IOException, JsonGenerationException;

    void writeArrayValueSeparator(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;

    void beforeArrayValues(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;

    void beforeObjectEntries(JsonGenerator jsonGenerator) throws IOException, JsonGenerationException;
}
