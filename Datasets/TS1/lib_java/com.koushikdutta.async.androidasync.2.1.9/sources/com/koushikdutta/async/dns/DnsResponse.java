package com.koushikdutta.async.dns;

import com.koushikdutta.async.BuildConfig;
import com.koushikdutta.async.ByteBufferList;
import com.koushikdutta.async.http.Multimap;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/dns/DnsResponse.class */
public class DnsResponse {
    public ArrayList<InetAddress> addresses = new ArrayList<>();
    public ArrayList<String> names = new ArrayList<>();
    public Multimap txt = new Multimap();
    public InetSocketAddress source;

    private static String parseName(ByteBufferList bb, ByteBuffer backReference) {
        bb.order(ByteOrder.BIG_ENDIAN);
        String str = BuildConfig.FLAVOR;
        while (true) {
            String ret = str;
            int len = bb.get() & 255;
            if (0 != len) {
                if ((len & 192) == 192) {
                    int offset = ((len & 63) << 8) | (bb.get() & 255);
                    if (ret.length() > 0) {
                        ret = ret + ".";
                    }
                    ByteBufferList sub = new ByteBufferList();
                    ByteBuffer duplicate = backReference.duplicate();
                    duplicate.get(new byte[offset]);
                    sub.add(duplicate);
                    return ret + parseName(sub, backReference);
                }
                byte[] bytes = new byte[len];
                bb.get(bytes);
                if (ret.length() > 0) {
                    ret = ret + ".";
                }
                str = ret + new String(bytes);
            } else {
                return ret;
            }
        }
    }

    public static DnsResponse parse(ByteBufferList bb) {
        ByteBuffer b = bb.getAll();
        bb.add(b.duplicate());
        bb.order(ByteOrder.BIG_ENDIAN);
        bb.getShort();
        bb.getShort();
        int questions = bb.getShort();
        int answers = bb.getShort();
        int authorities = bb.getShort();
        int additionals = bb.getShort();
        for (int i = 0; i < questions; i++) {
            parseName(bb, b);
            bb.getShort();
            bb.getShort();
        }
        DnsResponse response = new DnsResponse();
        for (int i2 = 0; i2 < answers; i2++) {
            parseName(bb, b);
            int type = bb.getShort();
            bb.getShort();
            bb.getInt();
            int length = bb.getShort();
            if (type == 1) {
                try {
                    byte[] data = new byte[length];
                    bb.get(data);
                    response.addresses.add(InetAddress.getByAddress(data));
                } catch (Exception e) {
                }
            } else if (type == 12) {
                response.names.add(parseName(bb, b));
            } else if (type == 16) {
                ByteBufferList txt = new ByteBufferList();
                bb.get(txt, length);
                response.parseTxt(txt);
            } else {
                bb.get(new byte[length]);
            }
        }
        for (int i3 = 0; i3 < authorities; i3++) {
            parseName(bb, b);
            bb.getShort();
            bb.getShort();
            bb.getInt();
            try {
                bb.get(new byte[bb.getShort()]);
            } catch (Exception e2) {
            }
        }
        for (int i4 = 0; i4 < additionals; i4++) {
            parseName(bb, b);
            int type2 = bb.getShort();
            bb.getShort();
            bb.getInt();
            int length2 = bb.getShort();
            if (type2 == 16) {
                try {
                    ByteBufferList txt2 = new ByteBufferList();
                    bb.get(txt2, length2);
                    response.parseTxt(txt2);
                } catch (Exception e3) {
                }
            } else {
                bb.get(new byte[length2]);
            }
        }
        return response;
    }

    void parseTxt(ByteBufferList bb) {
        while (bb.hasRemaining()) {
            int length = bb.get() & 255;
            byte[] bytes = new byte[length];
            bb.get(bytes);
            String string = new String(bytes);
            String[] pair = string.split("=");
            this.txt.add(pair[0], pair[1]);
        }
    }

    public String toString() {
        String ret = "addresses:\n";
        Iterator i$ = this.addresses.iterator();
        while (i$.hasNext()) {
            InetAddress address = i$.next();
            ret = ret + address.toString() + "\n";
        }
        String ret2 = ret + "names:\n";
        Iterator i$2 = this.names.iterator();
        while (i$2.hasNext()) {
            String name = i$2.next();
            ret2 = ret2 + name + "\n";
        }
        return ret2;
    }
}
