package com.squareup.okhttp.internal;

import java.net.InetAddress;
import java.net.UnknownHostException;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/internal/Network.class */
public interface Network {
    public static final Network DEFAULT = new Network() { // from class: com.squareup.okhttp.internal.Network.1
        @Override // com.squareup.okhttp.internal.Network
        public InetAddress[] resolveInetAddresses(String host) throws UnknownHostException {
            if (host == null) {
                throw new UnknownHostException("host == null");
            }
            return InetAddress.getAllByName(host);
        }
    };

    InetAddress[] resolveInetAddresses(String str) throws UnknownHostException;
}
