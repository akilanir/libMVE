package org.apache.http;

import java.io.IOException;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/MalformedChunkCodingException.class */
public class MalformedChunkCodingException extends IOException {
    private static final long serialVersionUID = 2158560246948994524L;

    public MalformedChunkCodingException() {
    }

    public MalformedChunkCodingException(String message) {
        super(message);
    }
}
