package org.apache.http;

import java.io.IOException;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/ContentTooLongException.class */
public class ContentTooLongException extends IOException {
    private static final long serialVersionUID = -924287689552495383L;

    public ContentTooLongException(String message) {
        super(message);
    }
}
