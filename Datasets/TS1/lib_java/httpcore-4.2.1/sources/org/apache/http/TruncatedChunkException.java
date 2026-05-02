package org.apache.http;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/TruncatedChunkException.class */
public class TruncatedChunkException extends MalformedChunkCodingException {
    private static final long serialVersionUID = -23506263930279460L;

    public TruncatedChunkException(String message) {
        super(message);
    }
}
