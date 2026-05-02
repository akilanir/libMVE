package org.jivesoftware.smack;

import java.util.Collection;
import org.jivesoftware.smack.packet.Presence;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/RosterListener.class */
public interface RosterListener {
    void entriesAdded(Collection<String> collection);

    void entriesUpdated(Collection<String> collection);

    void entriesDeleted(Collection<String> collection);

    void presenceChanged(Presence presence);
}
