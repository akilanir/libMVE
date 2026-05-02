package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.IOException;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/TokenBufferDeserializer.class */
public class TokenBufferDeserializer extends StdScalarDeserializer<TokenBuffer> {
    private static final long serialVersionUID = 1;

    public TokenBufferDeserializer() {
        super((Class<?>) TokenBuffer.class);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public TokenBuffer deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        return createBufferInstance(jp).deserialize(jp, ctxt);
    }

    protected TokenBuffer createBufferInstance(JsonParser jp) {
        return new TokenBuffer(jp);
    }
}
