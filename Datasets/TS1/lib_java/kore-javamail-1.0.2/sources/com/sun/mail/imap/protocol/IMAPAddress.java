package com.sun.mail.imap.protocol;

import com.sun.mail.iap.ParsingException;
import com.sun.mail.iap.Response;
import java.util.ArrayList;
import java.util.List;
import korex.mail.internet.AddressException;
import korex.mail.internet.InternetAddress;

/* compiled from: ENVELOPE.java */
/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/protocol/IMAPAddress.class */
class IMAPAddress extends InternetAddress {
    private boolean group;
    private InternetAddress[] grouplist;
    private String groupname;
    private static final long serialVersionUID = -3835822029483122232L;

    IMAPAddress(Response r) throws ParsingException {
        this.group = false;
        r.skipSpaces();
        if (r.readByte() != 40) {
            throw new ParsingException("ADDRESS parse error");
        }
        this.encodedPersonal = r.readString();
        r.readString();
        String mb = r.readString();
        String host = r.readString();
        r.skipSpaces();
        if (r.readByte() != 41) {
            throw new ParsingException("ADDRESS parse error");
        }
        if (host == null) {
            this.group = true;
            this.groupname = mb;
            if (this.groupname == null) {
                return;
            }
            StringBuffer sb = new StringBuffer();
            sb.append(this.groupname).append(':');
            List<InternetAddress> v = new ArrayList<>();
            while (r.peekByte() != 41) {
                IMAPAddress a = new IMAPAddress(r);
                if (a.isEndOfGroup()) {
                    break;
                }
                if (v.size() != 0) {
                    sb.append(',');
                }
                sb.append(a.toString());
                v.add(a);
            }
            sb.append(';');
            this.address = sb.toString();
            this.grouplist = (InternetAddress[]) v.toArray(new IMAPAddress[v.size()]);
            return;
        }
        if (mb == null || mb.length() == 0) {
            this.address = host;
        } else if (host.length() == 0) {
            this.address = mb;
        } else {
            this.address = mb + "@" + host;
        }
    }

    boolean isEndOfGroup() {
        return this.group && this.groupname == null;
    }

    @Override // korex.mail.internet.InternetAddress
    public boolean isGroup() {
        return this.group;
    }

    @Override // korex.mail.internet.InternetAddress
    public InternetAddress[] getGroup(boolean strict) throws AddressException {
        if (this.grouplist == null) {
            return null;
        }
        return (InternetAddress[]) this.grouplist.clone();
    }
}
