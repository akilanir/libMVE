package org.jivesoftware.smack.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Bind.class */
public class Bind extends IQ {
    private String resource = null;
    private String jid = null;

    public Bind() {
        setType(IQ.Type.SET);
    }

    public String getResource() {
        return this.resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public String getJid() {
        return this.jid;
    }

    public void setJid(String jid) {
        this.jid = jid;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder buf = new StringBuilder();
        buf.append("<bind xmlns=\"urn:ietf:params:xml:ns:xmpp-bind\">");
        if (this.resource != null) {
            buf.append("<resource>").append(this.resource).append("</resource>");
        }
        if (this.jid != null) {
            buf.append("<jid>").append(this.jid).append("</jid>");
        }
        buf.append("</bind>");
        return buf.toString();
    }
}
