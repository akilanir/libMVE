package org.jivesoftware.smack.packet;

import java.util.Map;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Registration.class */
public class Registration extends IQ {
    private String instructions = null;
    private Map<String, String> attributes = null;

    public String getInstructions() {
        return this.instructions;
    }

    public void setInstructions(String instructions) {
        this.instructions = instructions;
    }

    public Map<String, String> getAttributes() {
        return this.attributes;
    }

    public void setAttributes(Map<String, String> attributes) {
        this.attributes = attributes;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder buf = new StringBuilder();
        buf.append("<query xmlns=\"jabber:iq:register\">");
        if (this.instructions != null) {
            buf.append("<instructions>").append(this.instructions).append("</instructions>");
        }
        if (this.attributes != null && this.attributes.size() > 0) {
            for (String name : this.attributes.keySet()) {
                String value = this.attributes.get(name);
                buf.append("<").append(name).append(">");
                buf.append(value);
                buf.append("</").append(name).append(">");
            }
        }
        buf.append(getExtensionsXML());
        buf.append("</query>");
        return buf.toString();
    }
}
