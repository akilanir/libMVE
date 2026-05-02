package org.apache.commons.io.filefilter;

import java.util.List;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/filefilter/ConditionalFileFilter.class */
public interface ConditionalFileFilter {
    void addFileFilter(IOFileFilter iOFileFilter);

    List getFileFilters();

    boolean removeFileFilter(IOFileFilter iOFileFilter);

    void setFileFilters(List list);
}
