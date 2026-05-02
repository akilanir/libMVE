package org.jivesoftware.smack.packet;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Authentication.class */
public class Authentication extends IQ {
    private String username = null;
    private String password = null;
    private String digest = null;
    private String resource = null;

    public Authentication() {
        setType(IQ.Type.SET);
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDigest() {
        return this.digest;
    }

    public void setDigest(String connectionID, String password) {
        this.digest = StringUtils.hash(connectionID + password);
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getResource() {
        return this.resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder buf = new StringBuilder();
        buf.append("<query xmlns=\"jabber:iq:auth\">");
        if (this.username != null) {
            if (this.username.equals(XmlPullParser.NO_NAMESPACE)) {
                buf.append("<username/>");
            } else {
                buf.append("<username>").append(this.username).append("</username>");
            }
        }
        if (this.digest != null) {
            if (this.digest.equals(XmlPullParser.NO_NAMESPACE)) {
                buf.append("<digest/>");
            } else {
                buf.append("<digest>").append(this.digest).append("</digest>");
            }
        }
        if (this.password != null && this.digest == null) {
            if (this.password.equals(XmlPullParser.NO_NAMESPACE)) {
                buf.append("<password/>");
            } else {
                buf.append("<password>").append(StringUtils.escapeForXML(this.password)).append("</password>");
            }
        }
        if (this.resource != null) {
            if (this.resource.equals(XmlPullParser.NO_NAMESPACE)) {
                buf.append("<resource/>");
            } else {
                buf.append("<resource>").append(this.resource).append("</resource>");
            }
        }
        buf.append("</query>");
        return buf.toString();
    }
}
