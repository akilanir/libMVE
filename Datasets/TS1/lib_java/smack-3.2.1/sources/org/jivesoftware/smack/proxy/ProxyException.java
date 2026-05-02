package org.jivesoftware.smack.proxy;

import java.io.IOException;
import org.jivesoftware.smack.proxy.ProxyInfo;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/proxy/ProxyException.class */
public class ProxyException extends IOException {
    public ProxyException(ProxyInfo.ProxyType type, String ex, Throwable cause) {
        super("Proxy Exception " + type.toString() + " : " + ex + ", " + cause);
    }

    public ProxyException(ProxyInfo.ProxyType type, String ex) {
        super("Proxy Exception " + type.toString() + " : " + ex);
    }

    public ProxyException(ProxyInfo.ProxyType type) {
        super("Proxy Exception " + type.toString() + " : Unknown Error");
    }
}
