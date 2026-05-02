package org.jivesoftware.smack.filter;

import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/filter/FromMatchesFilter.class */
public class FromMatchesFilter implements PacketFilter {
    private String address;
    private boolean matchBareJID;

    public FromMatchesFilter(String address) {
        this.matchBareJID = false;
        if (address == null) {
            throw new IllegalArgumentException("Parameter cannot be null.");
        }
        this.address = address.toLowerCase();
        this.matchBareJID = XmlPullParser.NO_NAMESPACE.equals(StringUtils.parseResource(address));
    }

    @Override // org.jivesoftware.smack.filter.PacketFilter
    public boolean accept(Packet packet) {
        if (packet.getFrom() == null) {
            return false;
        }
        if (this.matchBareJID) {
            return packet.getFrom().toLowerCase().startsWith(this.address);
        }
        return this.address.equals(packet.getFrom().toLowerCase());
    }

    public String toString() {
        return "FromMatchesFilter: " + this.address;
    }
}
