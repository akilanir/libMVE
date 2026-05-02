package org.jivesoftware.smack.packet;

import org.jivesoftware.smack.util.StringUtils;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/IQ.class */
public abstract class IQ extends Packet {
    private Type type = Type.GET;

    public abstract String getChildElementXML();

    public Type getType() {
        return this.type;
    }

    public void setType(Type type) {
        if (type == null) {
            this.type = Type.GET;
        } else {
            this.type = type;
        }
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public String toXML() {
        StringBuilder buf = new StringBuilder();
        buf.append("<iq ");
        if (getPacketID() != null) {
            buf.append("id=\"" + getPacketID() + "\" ");
        }
        if (getTo() != null) {
            buf.append("to=\"").append(StringUtils.escapeForXML(getTo())).append("\" ");
        }
        if (getFrom() != null) {
            buf.append("from=\"").append(StringUtils.escapeForXML(getFrom())).append("\" ");
        }
        if (this.type == null) {
            buf.append("type=\"get\">");
        } else {
            buf.append("type=\"").append(getType()).append("\">");
        }
        String queryXML = getChildElementXML();
        if (queryXML != null) {
            buf.append(queryXML);
        }
        XMPPError error = getError();
        if (error != null) {
            buf.append(error.toXML());
        }
        buf.append("</iq>");
        return buf.toString();
    }

    public static IQ createResultIQ(IQ request) {
        if (request.getType() != Type.GET && request.getType() != Type.SET) {
            throw new IllegalArgumentException("IQ must be of type 'set' or 'get'. Original IQ: " + request.toXML());
        }
        IQ result = new IQ() { // from class: org.jivesoftware.smack.packet.IQ.1
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                return null;
            }
        };
        result.setType(Type.RESULT);
        result.setPacketID(request.getPacketID());
        result.setFrom(request.getTo());
        result.setTo(request.getFrom());
        return result;
    }

    public static IQ createErrorResponse(IQ request, XMPPError error) {
        if (request.getType() != Type.GET && request.getType() != Type.SET) {
            throw new IllegalArgumentException("IQ must be of type 'set' or 'get'. Original IQ: " + request.toXML());
        }
        IQ result = new IQ() { // from class: org.jivesoftware.smack.packet.IQ.2
            @Override // org.jivesoftware.smack.packet.IQ
            public String getChildElementXML() {
                return IQ.this.getChildElementXML();
            }
        };
        result.setType(Type.ERROR);
        result.setPacketID(request.getPacketID());
        result.setFrom(request.getTo());
        result.setTo(request.getFrom());
        result.setError(error);
        return result;
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/IQ$Type.class */
    public static class Type {
        public static final Type GET = new Type("get");
        public static final Type SET = new Type("set");
        public static final Type RESULT = new Type("result");
        public static final Type ERROR = new Type("error");
        private String value;

        public static Type fromString(String type) {
            if (type == null) {
                return null;
            }
            String type2 = type.toLowerCase();
            if (GET.toString().equals(type2)) {
                return GET;
            }
            if (SET.toString().equals(type2)) {
                return SET;
            }
            if (ERROR.toString().equals(type2)) {
                return ERROR;
            }
            if (RESULT.toString().equals(type2)) {
                return RESULT;
            }
            return null;
        }

        private Type(String value) {
            this.value = value;
        }

        public String toString() {
            return this.value;
        }
    }
}
