package org.apache.http.io;

import org.apache.http.HttpMessage;
import org.apache.http.config.MessageConstraints;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/io/HttpMessageParserFactory.class */
public interface HttpMessageParserFactory<T extends HttpMessage> {
    HttpMessageParser<T> create(SessionInputBuffer sessionInputBuffer, MessageConstraints messageConstraints);
}
