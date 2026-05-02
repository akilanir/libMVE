package org.androidannotations.api.rest;

import org.springframework.core.NestedRuntimeException;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/rest/RestErrorHandler.class */
public interface RestErrorHandler {
    void onRestClientExceptionThrown(NestedRuntimeException nestedRuntimeException);
}
