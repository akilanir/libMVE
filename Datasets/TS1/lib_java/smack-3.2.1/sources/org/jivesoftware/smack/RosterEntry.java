package org.jivesoftware.smack;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.RosterPacket;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/RosterEntry.class */
public class RosterEntry {
    private String user;
    private String name;
    private RosterPacket.ItemType type;
    private RosterPacket.ItemStatus status;
    private final Roster roster;
    private final Connection connection;

    RosterEntry(String user, String name, RosterPacket.ItemType type, RosterPacket.ItemStatus status, Roster roster, Connection connection) {
        this.user = user;
        this.name = name;
        this.type = type;
        this.status = status;
        this.roster = roster;
        this.connection = connection;
    }

    public String getUser() {
        return this.user;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        if (name != null && name.equals(this.name)) {
            return;
        }
        this.name = name;
        RosterPacket packet = new RosterPacket();
        packet.setType(IQ.Type.SET);
        packet.addRosterItem(toRosterItem(this));
        this.connection.sendPacket(packet);
    }

    void updateState(String name, RosterPacket.ItemType type, RosterPacket.ItemStatus status) {
        this.name = name;
        this.type = type;
        this.status = status;
    }

    public Collection<RosterGroup> getGroups() {
        List<RosterGroup> results = new ArrayList<>();
        for (RosterGroup group : this.roster.getGroups()) {
            if (group.contains(this)) {
                results.add(group);
            }
        }
        return Collections.unmodifiableCollection(results);
    }

    public RosterPacket.ItemType getType() {
        return this.type;
    }

    public RosterPacket.ItemStatus getStatus() {
        return this.status;
    }

    public String toString() {
        StringBuilder buf = new StringBuilder();
        if (this.name != null) {
            buf.append(this.name).append(": ");
        }
        buf.append(this.user);
        Collection<RosterGroup> groups = getGroups();
        if (!groups.isEmpty()) {
            buf.append(" [");
            Iterator<RosterGroup> iter = groups.iterator();
            RosterGroup group = iter.next();
            buf.append(group.getName());
            while (iter.hasNext()) {
                buf.append(", ");
                RosterGroup group2 = iter.next();
                buf.append(group2.getName());
            }
            buf.append("]");
        }
        return buf.toString();
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object != null && (object instanceof RosterEntry)) {
            return this.user.equals(((RosterEntry) object).getUser());
        }
        return false;
    }

    public boolean equalsDeep(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        RosterEntry other = (RosterEntry) obj;
        if (this.name == null) {
            if (other.name != null) {
                return false;
            }
        } else if (!this.name.equals(other.name)) {
            return false;
        }
        if (this.status == null) {
            if (other.status != null) {
                return false;
            }
        } else if (!this.status.equals(other.status)) {
            return false;
        }
        if (this.type == null) {
            if (other.type != null) {
                return false;
            }
        } else if (!this.type.equals(other.type)) {
            return false;
        }
        if (this.user == null) {
            if (other.user != null) {
                return false;
            }
            return true;
        }
        if (!this.user.equals(other.user)) {
            return false;
        }
        return true;
    }

    static RosterPacket.Item toRosterItem(RosterEntry entry) {
        RosterPacket.Item item = new RosterPacket.Item(entry.getUser(), entry.getName());
        item.setItemType(entry.getType());
        item.setItemStatus(entry.getStatus());
        for (RosterGroup group : entry.getGroups()) {
            item.addGroupName(group.getName());
        }
        return item;
    }
}
