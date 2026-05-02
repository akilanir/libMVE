package org.apache.commons.net;

import java.util.EventListener;

/* loaded from: commons-net-3.3.jar:org/apache/commons/net/ProtocolCommandListener.class */
public interface ProtocolCommandListener extends EventListener {
    void protocolCommandSent(ProtocolCommandEvent protocolCommandEvent);

    void protocolReplyReceived(ProtocolCommandEvent protocolCommandEvent);
}
