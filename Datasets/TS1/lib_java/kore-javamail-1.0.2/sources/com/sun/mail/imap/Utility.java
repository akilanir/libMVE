package com.sun.mail.imap;

import com.sun.mail.imap.protocol.MessageSet;
import com.sun.mail.imap.protocol.UIDSet;
import java.util.Vector;
import korex.mail.Message;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/Utility.class */
public final class Utility {

    /* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/imap/Utility$Condition.class */
    public interface Condition {
        boolean test(IMAPMessage iMAPMessage);
    }

    private Utility() {
    }

    public static MessageSet[] toMessageSet(Message[] msgs, Condition cond) {
        Vector v = new Vector(1);
        int i = 0;
        while (i < msgs.length) {
            IMAPMessage msg = (IMAPMessage) msgs[i];
            if (!msg.isExpunged()) {
                int current = msg.getSequenceNumber();
                if (cond == null || cond.test(msg)) {
                    MessageSet set = new MessageSet();
                    set.start = current;
                    while (true) {
                        i++;
                        if (i >= msgs.length) {
                            break;
                        }
                        IMAPMessage msg2 = (IMAPMessage) msgs[i];
                        if (!msg2.isExpunged()) {
                            int next = msg2.getSequenceNumber();
                            if (cond == null || cond.test(msg2)) {
                                if (next == current + 1) {
                                    current = next;
                                } else {
                                    i--;
                                    break;
                                }
                            }
                        }
                    }
                    set.end = current;
                    v.addElement(set);
                }
            }
            i++;
        }
        if (v.isEmpty()) {
            return null;
        }
        MessageSet[] sets = new MessageSet[v.size()];
        v.copyInto(sets);
        return sets;
    }

    public static UIDSet[] toUIDSet(Message[] msgs) {
        Vector v = new Vector(1);
        int i = 0;
        while (i < msgs.length) {
            IMAPMessage msg = (IMAPMessage) msgs[i];
            if (!msg.isExpunged()) {
                long current = msg.getUID();
                UIDSet set = new UIDSet();
                set.start = current;
                while (true) {
                    i++;
                    if (i >= msgs.length) {
                        break;
                    }
                    IMAPMessage msg2 = (IMAPMessage) msgs[i];
                    if (!msg2.isExpunged()) {
                        long next = msg2.getUID();
                        if (next == current + 1) {
                            current = next;
                        } else {
                            i--;
                            break;
                        }
                    }
                }
                set.end = current;
                v.addElement(set);
            }
            i++;
        }
        if (v.isEmpty()) {
            return null;
        }
        UIDSet[] sets = new UIDSet[v.size()];
        v.copyInto(sets);
        return sets;
    }

    public static UIDSet[] getResyncUIDSet(ResyncData rd) {
        return rd.getUIDSet();
    }
}
