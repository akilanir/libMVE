package org.apache.http.entity;

import org.apache.http.HttpException;
import org.apache.http.HttpMessage;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/entity/ContentLengthStrategy.class */
public interface ContentLengthStrategy {
    public static final int IDENTITY = -1;
    public static final int CHUNKED = -2;

    long determineLength(HttpMessage httpMessage) throws HttpException;
}
