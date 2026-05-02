package org.apache.http;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/HttpEntityEnclosingRequest.class */
public interface HttpEntityEnclosingRequest extends HttpRequest {
    boolean expectContinue();

    void setEntity(HttpEntity httpEntity);

    HttpEntity getEntity();
}
