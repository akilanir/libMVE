package org.jivesoftware.smack.util;

import java.util.Hashtable;
import java.util.Map;
import javax.naming.NamingEnumeration;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/DNSUtil.class */
public class DNSUtil {
    private static Map cache = new Cache(100, 600000);
    private static DirContext context;

    static {
        try {
            Hashtable env = new Hashtable();
            env.put("java.naming.factory.initial", "com.sun.jndi.dns.DnsContextFactory");
            context = new InitialDirContext(env);
        } catch (Exception e) {
        }
    }

    public static HostAddress resolveXMPPDomain(String domain) {
        HostAddress address;
        if (context == null) {
            return new HostAddress(domain, 5222);
        }
        String key = "c" + domain;
        if (cache.containsKey(key) && (address = (HostAddress) cache.get(key)) != null) {
            return address;
        }
        String bestHost = domain;
        int bestPort = 5222;
        int bestPriority = 0;
        int bestWeight = 0;
        try {
            Attributes dnsLookup = context.getAttributes("_xmpp-client._tcp." + domain, new String[]{"SRV"});
            Attribute srvAttribute = dnsLookup.get("SRV");
            NamingEnumeration srvRecords = srvAttribute.getAll();
            while (srvRecords.hasMore()) {
                String srvRecord = (String) srvRecords.next();
                String[] srvRecordEntries = srvRecord.split(" ");
                int priority = Integer.parseInt(srvRecordEntries[srvRecordEntries.length - 4]);
                int port = Integer.parseInt(srvRecordEntries[srvRecordEntries.length - 2]);
                int weight = Integer.parseInt(srvRecordEntries[srvRecordEntries.length - 3]);
                String host = srvRecordEntries[srvRecordEntries.length - 1];
                int weight2 = (int) (weight * Math.random() * weight);
                if (bestPriority == 0 || priority < bestPriority) {
                    bestPriority = priority;
                    bestWeight = weight2;
                    bestHost = host;
                    bestPort = port;
                } else if (priority == bestPriority && weight2 > bestWeight) {
                    bestWeight = weight2;
                    bestHost = host;
                    bestPort = port;
                }
            }
        } catch (Exception e) {
        }
        if (bestHost.endsWith(".")) {
            bestHost = bestHost.substring(0, bestHost.length() - 1);
        }
        HostAddress address2 = new HostAddress(bestHost, bestPort);
        cache.put(key, address2);
        return address2;
    }

    public static HostAddress resolveXMPPServerDomain(String domain) {
        HostAddress address;
        if (context == null) {
            return new HostAddress(domain, 5269);
        }
        String key = "s" + domain;
        if (cache.containsKey(key) && (address = (HostAddress) cache.get(key)) != null) {
            return address;
        }
        String host = domain;
        int port = 5269;
        try {
            Attributes dnsLookup = context.getAttributes("_xmpp-server._tcp." + domain, new String[]{"SRV"});
            String srvRecord = (String) dnsLookup.get("SRV").get();
            String[] srvRecordEntries = srvRecord.split(" ");
            port = Integer.parseInt(srvRecordEntries[srvRecordEntries.length - 2]);
            host = srvRecordEntries[srvRecordEntries.length - 1];
        } catch (Exception e) {
            try {
                Attributes dnsLookup2 = context.getAttributes("_jabber._tcp." + domain, new String[]{"SRV"});
                String srvRecord2 = (String) dnsLookup2.get("SRV").get();
                String[] srvRecordEntries2 = srvRecord2.split(" ");
                port = Integer.parseInt(srvRecordEntries2[srvRecordEntries2.length - 2]);
                host = srvRecordEntries2[srvRecordEntries2.length - 1];
            } catch (Exception e2) {
            }
        }
        if (host.endsWith(".")) {
            host = host.substring(0, host.length() - 1);
        }
        HostAddress address2 = new HostAddress(host, port);
        cache.put(key, address2);
        return address2;
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/DNSUtil$HostAddress.class */
    public static class HostAddress {
        private String host;
        private int port;

        private HostAddress(String host, int port) {
            this.host = host;
            this.port = port;
        }

        public String getHost() {
            return this.host;
        }

        public int getPort() {
            return this.port;
        }

        public String toString() {
            return this.host + ":" + this.port;
        }

        public boolean equals(Object o) {
            if (this == o) {
                return true;
            }
            if (!(o instanceof HostAddress)) {
                return false;
            }
            HostAddress address = (HostAddress) o;
            return this.host.equals(address.host) && this.port == address.port;
        }
    }
}
