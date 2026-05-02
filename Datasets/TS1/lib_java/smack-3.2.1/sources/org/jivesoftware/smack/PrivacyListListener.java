package org.jivesoftware.smack;

import java.util.List;
import org.jivesoftware.smack.packet.PrivacyItem;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/PrivacyListListener.class */
public interface PrivacyListListener {
    void setPrivacyList(String str, List<PrivacyItem> list);

    void updatedPrivacyList(String str);
}
