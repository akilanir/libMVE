package org.jivesoftware.smack.packet;

import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/packet/Packet.class */
public abstract class Packet {
    public static final String ID_NOT_AVAILABLE = "ID_NOT_AVAILABLE";
    private String xmlns = DEFAULT_XML_NS;
    private String packetID = null;
    private String to = null;
    private String from = null;
    private final List<PacketExtension> packetExtensions = new CopyOnWriteArrayList();
    private final Map<String, Object> properties = new HashMap();
    private XMPPError error = null;
    protected static final String DEFAULT_LANGUAGE = Locale.getDefault().getLanguage().toLowerCase();
    private static String DEFAULT_XML_NS = null;
    private static String prefix = StringUtils.randomString(5) + "-";
    private static long id = 0;

    public abstract String toXML();

    public static synchronized String nextID() {
        StringBuilder append = new StringBuilder().append(prefix);
        long j = id;
        id = j + 1;
        return append.append(Long.toString(j)).toString();
    }

    public static void setDefaultXmlns(String defaultXmlns) {
        DEFAULT_XML_NS = defaultXmlns;
    }

    public String getPacketID() {
        if (ID_NOT_AVAILABLE.equals(this.packetID)) {
            return null;
        }
        if (this.packetID == null) {
            this.packetID = nextID();
        }
        return this.packetID;
    }

    public void setPacketID(String packetID) {
        this.packetID = packetID;
    }

    public String getTo() {
        return this.to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFrom() {
        return this.from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public XMPPError getError() {
        return this.error;
    }

    public void setError(XMPPError error) {
        this.error = error;
    }

    public synchronized Collection<PacketExtension> getExtensions() {
        if (this.packetExtensions == null) {
            return Collections.emptyList();
        }
        return Collections.unmodifiableList(new ArrayList(this.packetExtensions));
    }

    public PacketExtension getExtension(String namespace) {
        return getExtension(null, namespace);
    }

    public PacketExtension getExtension(String elementName, String namespace) {
        if (namespace == null) {
            return null;
        }
        for (PacketExtension ext : this.packetExtensions) {
            if (elementName == null || elementName.equals(ext.getElementName())) {
                if (namespace.equals(ext.getNamespace())) {
                    return ext;
                }
            }
        }
        return null;
    }

    public void addExtension(PacketExtension extension) {
        this.packetExtensions.add(extension);
    }

    public void removeExtension(PacketExtension extension) {
        this.packetExtensions.remove(extension);
    }

    public synchronized Object getProperty(String name) {
        if (this.properties == null) {
            return null;
        }
        return this.properties.get(name);
    }

    public synchronized void setProperty(String name, Object value) {
        if (!(value instanceof Serializable)) {
            throw new IllegalArgumentException("Value must be serialiazble");
        }
        this.properties.put(name, value);
    }

    public synchronized void deleteProperty(String name) {
        if (this.properties == null) {
            return;
        }
        this.properties.remove(name);
    }

    public synchronized Collection<String> getPropertyNames() {
        if (this.properties == null) {
            return Collections.emptySet();
        }
        return Collections.unmodifiableSet(new HashSet(this.properties.keySet()));
    }

    protected synchronized String getExtensionsXML() {
        StringBuilder buf = new StringBuilder();
        for (PacketExtension extension : getExtensions()) {
            buf.append(extension.toXML());
        }
        if (this.properties != null && !this.properties.isEmpty()) {
            buf.append("<properties xmlns=\"http://www.jivesoftware.com/xmlns/xmpp/properties\">");
            for (String name : getPropertyNames()) {
                Object value = getProperty(name);
                buf.append("<property>");
                buf.append("<name>").append(StringUtils.escapeForXML(name)).append("</name>");
                buf.append("<value type=\"");
                if (value instanceof Integer) {
                    buf.append("integer\">").append(value).append("</value>");
                } else if (value instanceof Long) {
                    buf.append("long\">").append(value).append("</value>");
                } else if (value instanceof Float) {
                    buf.append("float\">").append(value).append("</value>");
                } else if (value instanceof Double) {
                    buf.append("double\">").append(value).append("</value>");
                } else if (value instanceof Boolean) {
                    buf.append("boolean\">").append(value).append("</value>");
                } else if (value instanceof String) {
                    buf.append("string\">");
                    buf.append(StringUtils.escapeForXML((String) value));
                    buf.append("</value>");
                } else {
                    ByteArrayOutputStream byteStream = null;
                    ObjectOutputStream out = null;
                    try {
                        try {
                            byteStream = new ByteArrayOutputStream();
                            out = new ObjectOutputStream(byteStream);
                            out.writeObject(value);
                            buf.append("java-object\">");
                            String encodedVal = StringUtils.encodeBase64(byteStream.toByteArray());
                            buf.append(encodedVal).append("</value>");
                            if (out != null) {
                                try {
                                    out.close();
                                } catch (Exception e) {
                                }
                            }
                            if (byteStream != null) {
                                try {
                                    byteStream.close();
                                } catch (Exception e2) {
                                }
                            }
                        } catch (Exception e3) {
                            e3.printStackTrace();
                            if (out != null) {
                                try {
                                    out.close();
                                } catch (Exception e4) {
                                }
                            }
                            if (byteStream != null) {
                                try {
                                    byteStream.close();
                                } catch (Exception e5) {
                                }
                            }
                        }
                    } catch (Throwable th) {
                        if (out != null) {
                            try {
                                out.close();
                            } catch (Exception e6) {
                            }
                        }
                        if (byteStream != null) {
                            try {
                                byteStream.close();
                            } catch (Exception e7) {
                            }
                        }
                        throw th;
                    }
                }
                buf.append("</property>");
            }
            buf.append("</properties>");
        }
        return buf.toString();
    }

    public String getXmlns() {
        return this.xmlns;
    }

    public static String getDefaultLanguage() {
        return DEFAULT_LANGUAGE;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Packet packet = (Packet) o;
        if (this.error != null) {
            if (!this.error.equals(packet.error)) {
                return false;
            }
        } else if (packet.error != null) {
            return false;
        }
        if (this.from != null) {
            if (!this.from.equals(packet.from)) {
                return false;
            }
        } else if (packet.from != null) {
            return false;
        }
        if (!this.packetExtensions.equals(packet.packetExtensions)) {
            return false;
        }
        if (this.packetID != null) {
            if (!this.packetID.equals(packet.packetID)) {
                return false;
            }
        } else if (packet.packetID != null) {
            return false;
        }
        if (this.properties != null) {
            if (!this.properties.equals(packet.properties)) {
                return false;
            }
        } else if (packet.properties != null) {
            return false;
        }
        if (this.to != null) {
            if (!this.to.equals(packet.to)) {
                return false;
            }
        } else if (packet.to != null) {
            return false;
        }
        return this.xmlns == null ? packet.xmlns == null : this.xmlns.equals(packet.xmlns);
    }

    public int hashCode() {
        int result = this.xmlns != null ? this.xmlns.hashCode() : 0;
        return (31 * ((31 * ((31 * ((31 * ((31 * ((31 * result) + (this.packetID != null ? this.packetID.hashCode() : 0))) + (this.to != null ? this.to.hashCode() : 0))) + (this.from != null ? this.from.hashCode() : 0))) + this.packetExtensions.hashCode())) + this.properties.hashCode())) + (this.error != null ? this.error.hashCode() : 0);
    }
}
