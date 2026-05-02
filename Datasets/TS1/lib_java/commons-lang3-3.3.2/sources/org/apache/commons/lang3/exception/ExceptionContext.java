package org.apache.commons.lang3.exception;

import java.util.List;
import java.util.Set;
import org.apache.commons.lang3.tuple.Pair;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/exception/ExceptionContext.class */
public interface ExceptionContext {
    ExceptionContext addContextValue(String str, Object obj);

    ExceptionContext setContextValue(String str, Object obj);

    List<Object> getContextValues(String str);

    Object getFirstContextValue(String str);

    Set<String> getContextLabels();

    List<Pair<String, Object>> getContextEntries();

    String getFormattedExceptionMessage(String str);
}
