package org.apache.commons.net.io;

import java.util.EventListener;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/io/CopyStreamListener.class */
public interface CopyStreamListener extends EventListener {
    void bytesTransferred(CopyStreamEvent copyStreamEvent);

    void bytesTransferred(long j, int i, long j2);
}
