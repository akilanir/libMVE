package org.apache.http.io;

import java.io.IOException;
import org.apache.http.HttpException;
import org.apache.http.HttpMessage;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/io/HttpMessageParser.class */
public interface HttpMessageParser<T extends HttpMessage> {
    T parse() throws IOException, HttpException;
}
