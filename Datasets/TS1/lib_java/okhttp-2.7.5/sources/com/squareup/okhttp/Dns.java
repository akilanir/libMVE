package com.squareup.okhttp;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;
import java.util.List;

/* loaded from: okhttp-2.7.5.jar:com/squareup/okhttp/Dns.class */
public interface Dns {
    public static final Dns SYSTEM = new Dns() { // from class: com.squareup.okhttp.Dns.1
        @Override // com.squareup.okhttp.Dns
        public List<InetAddress> lookup(String hostname) throws UnknownHostException {
            if (hostname == null) {
                throw new UnknownHostException("hostname == null");
            }
            return Arrays.asList(InetAddress.getAllByName(hostname));
        }
    };

    List<InetAddress> lookup(String str) throws UnknownHostException;
}
