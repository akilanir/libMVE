package org.jivesoftware.smack.util;

import java.beans.PropertyDescriptor;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.packet.Authentication;
import org.jivesoftware.smack.packet.Bind;
import org.jivesoftware.smack.packet.DefaultPacketExtension;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smack.packet.Registration;
import org.jivesoftware.smack.packet.RosterPacket;
import org.jivesoftware.smack.packet.StreamError;
import org.jivesoftware.smack.packet.XMPPError;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smack.provider.ProviderManager;
import org.jivesoftware.smack.sasl.SASLMechanism;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/PacketParserUtils.class */
public class PacketParserUtils {
    private static final String PROPERTIES_NAMESPACE = "http://www.jivesoftware.com/xmlns/xmpp/properties";

    public static Packet parseMessage(XmlPullParser parser) throws Exception {
        String defaultLanguage;
        Message message = new Message();
        String id = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "id");
        message.setPacketID(id == null ? Packet.ID_NOT_AVAILABLE : id);
        message.setTo(parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, PrivacyItem.PrivacyRule.SUBSCRIPTION_TO));
        message.setFrom(parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM));
        message.setType(Message.Type.fromString(parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "type")));
        String language = getLanguageAttribute(parser);
        if (language != null && !XmlPullParser.NO_NAMESPACE.equals(language.trim())) {
            message.setLanguage(language);
            defaultLanguage = language;
        } else {
            defaultLanguage = Packet.getDefaultLanguage();
        }
        boolean done = false;
        String thread = null;
        Map<String, Object> properties = null;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                String elementName = parser.getName();
                String namespace = parser.getNamespace();
                if (elementName.equals("subject")) {
                    String xmlLang = getLanguageAttribute(parser);
                    if (xmlLang == null) {
                        xmlLang = defaultLanguage;
                    }
                    String subject = parseContent(parser);
                    if (message.getSubject(xmlLang) == null) {
                        message.addSubject(xmlLang, subject);
                    }
                } else if (elementName.equals("body")) {
                    String xmlLang2 = getLanguageAttribute(parser);
                    if (xmlLang2 == null) {
                        xmlLang2 = defaultLanguage;
                    }
                    String body = parseContent(parser);
                    if (message.getBody(xmlLang2) == null) {
                        message.addBody(xmlLang2, body);
                    }
                } else if (elementName.equals("thread")) {
                    if (thread == null) {
                        thread = parser.nextText();
                    }
                } else if (elementName.equals("error")) {
                    message.setError(parseError(parser));
                } else if (elementName.equals("properties") && namespace.equals(PROPERTIES_NAMESPACE)) {
                    properties = parseProperties(parser);
                } else {
                    message.addExtension(parsePacketExtension(elementName, namespace, parser));
                }
            } else if (eventType == 3 && parser.getName().equals("message")) {
                done = true;
            }
        }
        message.setThread(thread);
        if (properties != null) {
            for (String name : properties.keySet()) {
                message.setProperty(name, properties.get(name));
            }
        }
        return message;
    }

    private static String parseContent(XmlPullParser parser) throws XmlPullParserException, IOException {
        String content = XmlPullParser.NO_NAMESPACE;
        int parserDepth = parser.getDepth();
        while (true) {
            if (parser.next() != 3 || parser.getDepth() != parserDepth) {
                content = content + parser.getText();
            } else {
                return content;
            }
        }
    }

    public static Presence parsePresence(XmlPullParser parser) throws Exception {
        Presence.Type type = Presence.Type.available;
        String typeString = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "type");
        if (typeString != null && !typeString.equals(XmlPullParser.NO_NAMESPACE)) {
            try {
                type = Presence.Type.valueOf(typeString);
            } catch (IllegalArgumentException e) {
                System.err.println("Found invalid presence type " + typeString);
            }
        }
        Presence presence = new Presence(type);
        presence.setTo(parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, PrivacyItem.PrivacyRule.SUBSCRIPTION_TO));
        presence.setFrom(parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM));
        String id = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "id");
        presence.setPacketID(id == null ? Packet.ID_NOT_AVAILABLE : id);
        String language = getLanguageAttribute(parser);
        if (language != null && !XmlPullParser.NO_NAMESPACE.equals(language.trim())) {
            presence.setLanguage(language);
        }
        presence.setPacketID(id == null ? Packet.ID_NOT_AVAILABLE : id);
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                String elementName = parser.getName();
                String namespace = parser.getNamespace();
                if (elementName.equals("status")) {
                    presence.setStatus(parser.nextText());
                } else if (elementName.equals("priority")) {
                    try {
                        int priority = Integer.parseInt(parser.nextText());
                        presence.setPriority(priority);
                    } catch (NumberFormatException e2) {
                    } catch (IllegalArgumentException e3) {
                        presence.setPriority(0);
                    }
                } else if (elementName.equals("show")) {
                    String modeText = parser.nextText();
                    try {
                        presence.setMode(Presence.Mode.valueOf(modeText));
                    } catch (IllegalArgumentException e4) {
                        System.err.println("Found invalid presence mode " + modeText);
                    }
                } else if (elementName.equals("error")) {
                    presence.setError(parseError(parser));
                } else if (elementName.equals("properties") && namespace.equals(PROPERTIES_NAMESPACE)) {
                    Map<String, Object> properties = parseProperties(parser);
                    for (String name : properties.keySet()) {
                        presence.setProperty(name, properties.get(name));
                    }
                } else {
                    presence.addExtension(parsePacketExtension(elementName, namespace, parser));
                }
            } else if (eventType == 3 && parser.getName().equals("presence")) {
                done = true;
            }
        }
        return presence;
    }

    public static IQ parseIQ(XmlPullParser parser, Connection connection) throws Exception {
        IQ iqPacket = null;
        String id = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "id");
        String to = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, PrivacyItem.PrivacyRule.SUBSCRIPTION_TO);
        String from = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM);
        IQ.Type type = IQ.Type.fromString(parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "type"));
        XMPPError error = null;
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                String elementName = parser.getName();
                String namespace = parser.getNamespace();
                if (elementName.equals("error")) {
                    error = parseError(parser);
                } else if (elementName.equals("query") && namespace.equals("jabber:iq:auth")) {
                    iqPacket = parseAuthentication(parser);
                } else if (elementName.equals("query") && namespace.equals("jabber:iq:roster")) {
                    iqPacket = parseRoster(parser);
                } else if (elementName.equals("query") && namespace.equals("jabber:iq:register")) {
                    iqPacket = parseRegistration(parser);
                } else if (elementName.equals("bind") && namespace.equals("urn:ietf:params:xml:ns:xmpp-bind")) {
                    iqPacket = parseResourceBinding(parser);
                } else {
                    Object provider = ProviderManager.getInstance().getIQProvider(elementName, namespace);
                    if (provider != null) {
                        if (provider instanceof IQProvider) {
                            iqPacket = ((IQProvider) provider).parseIQ(parser);
                        } else if (provider instanceof Class) {
                            iqPacket = (IQ) parseWithIntrospection(elementName, (Class) provider, parser);
                        }
                    }
                }
            } else if (eventType == 3 && parser.getName().equals("iq")) {
                done = true;
            }
        }
        if (iqPacket == null) {
            if (IQ.Type.GET == type || IQ.Type.SET == type) {
                IQ iqPacket2 = new IQ() { // from class: org.jivesoftware.smack.util.PacketParserUtils.1
                    @Override // org.jivesoftware.smack.packet.IQ
                    public String getChildElementXML() {
                        return null;
                    }
                };
                iqPacket2.setPacketID(id);
                iqPacket2.setTo(from);
                iqPacket2.setFrom(to);
                iqPacket2.setType(IQ.Type.ERROR);
                iqPacket2.setError(new XMPPError(XMPPError.Condition.feature_not_implemented));
                connection.sendPacket(iqPacket2);
                return null;
            }
            iqPacket = new IQ() { // from class: org.jivesoftware.smack.util.PacketParserUtils.2
                @Override // org.jivesoftware.smack.packet.IQ
                public String getChildElementXML() {
                    return null;
                }
            };
        }
        iqPacket.setPacketID(id);
        iqPacket.setTo(to);
        iqPacket.setFrom(from);
        iqPacket.setType(type);
        iqPacket.setError(error);
        return iqPacket;
    }

    private static Authentication parseAuthentication(XmlPullParser parser) throws Exception {
        Authentication authentication = new Authentication();
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("username")) {
                    authentication.setUsername(parser.nextText());
                } else if (parser.getName().equals("password")) {
                    authentication.setPassword(parser.nextText());
                } else if (parser.getName().equals("digest")) {
                    authentication.setDigest(parser.nextText());
                } else if (parser.getName().equals("resource")) {
                    authentication.setResource(parser.nextText());
                }
            } else if (eventType == 3 && parser.getName().equals("query")) {
                done = true;
            }
        }
        return authentication;
    }

    private static RosterPacket parseRoster(XmlPullParser parser) throws Exception {
        String groupName;
        RosterPacket roster = new RosterPacket();
        boolean done = false;
        RosterPacket.Item item = null;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("item")) {
                    String jid = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "jid");
                    String name = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "name");
                    item = new RosterPacket.Item(jid, name);
                    String ask = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "ask");
                    RosterPacket.ItemStatus status = RosterPacket.ItemStatus.fromString(ask);
                    item.setItemStatus(status);
                    String subscription = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "subscription");
                    RosterPacket.ItemType type = RosterPacket.ItemType.valueOf(subscription != null ? subscription : PrivacyItem.PrivacyRule.SUBSCRIPTION_NONE);
                    item.setItemType(type);
                }
                if (parser.getName().equals("group") && item != null && (groupName = parser.nextText()) != null && groupName.trim().length() > 0) {
                    item.addGroupName(groupName);
                }
            } else if (eventType == 3) {
                if (parser.getName().equals("item")) {
                    roster.addRosterItem(item);
                }
                if (parser.getName().equals("query")) {
                    done = true;
                }
            }
        }
        return roster;
    }

    private static Registration parseRegistration(XmlPullParser parser) throws Exception {
        Registration registration = new Registration();
        Map<String, String> fields = null;
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getNamespace().equals("jabber:iq:register")) {
                    String name = parser.getName();
                    String value = XmlPullParser.NO_NAMESPACE;
                    if (fields == null) {
                        fields = new HashMap<>();
                    }
                    if (parser.next() == 4) {
                        value = parser.getText();
                    }
                    if (!name.equals("instructions")) {
                        fields.put(name, value);
                    } else {
                        registration.setInstructions(value);
                    }
                } else {
                    registration.addExtension(parsePacketExtension(parser.getName(), parser.getNamespace(), parser));
                }
            } else if (eventType == 3 && parser.getName().equals("query")) {
                done = true;
            }
        }
        registration.setAttributes(fields);
        return registration;
    }

    private static Bind parseResourceBinding(XmlPullParser parser) throws IOException, XmlPullParserException {
        Bind bind = new Bind();
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("resource")) {
                    bind.setResource(parser.nextText());
                } else if (parser.getName().equals("jid")) {
                    bind.setJid(parser.nextText());
                }
            } else if (eventType == 3 && parser.getName().equals("bind")) {
                done = true;
            }
        }
        return bind;
    }

    public static Collection<String> parseMechanisms(XmlPullParser parser) throws Exception {
        List<String> mechanisms = new ArrayList<>();
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                String elementName = parser.getName();
                if (elementName.equals("mechanism")) {
                    mechanisms.add(parser.nextText());
                }
            } else if (eventType == 3 && parser.getName().equals("mechanisms")) {
                done = true;
            }
        }
        return mechanisms;
    }

    public static Collection<String> parseCompressionMethods(XmlPullParser parser) throws IOException, XmlPullParserException {
        List<String> methods = new ArrayList<>();
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                String elementName = parser.getName();
                if (elementName.equals("method")) {
                    methods.add(parser.nextText());
                }
            } else if (eventType == 3 && parser.getName().equals("compression")) {
                done = true;
            }
        }
        return methods;
    }

    public static Map<String, Object> parseProperties(XmlPullParser parser) throws Exception {
        Map<String, Object> properties = new HashMap<>();
        while (true) {
            int eventType = parser.next();
            if (eventType == 2 && parser.getName().equals("property")) {
                boolean done = false;
                String name = null;
                String type = null;
                String valueText = null;
                Object value = null;
                while (!done) {
                    int eventType2 = parser.next();
                    if (eventType2 == 2) {
                        String elementName = parser.getName();
                        if (elementName.equals("name")) {
                            name = parser.nextText();
                        } else if (elementName.equals("value")) {
                            type = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "type");
                            valueText = parser.nextText();
                        }
                    } else if (eventType2 == 3 && parser.getName().equals("property")) {
                        if ("integer".equals(type)) {
                            value = Integer.valueOf(valueText);
                        } else if ("long".equals(type)) {
                            value = Long.valueOf(valueText);
                        } else if ("float".equals(type)) {
                            value = Float.valueOf(valueText);
                        } else if ("double".equals(type)) {
                            value = Double.valueOf(valueText);
                        } else if ("boolean".equals(type)) {
                            value = Boolean.valueOf(valueText);
                        } else if ("string".equals(type)) {
                            value = valueText;
                        } else if ("java-object".equals(type)) {
                            try {
                                byte[] bytes = StringUtils.decodeBase64(valueText);
                                ObjectInputStream in = new ObjectInputStream(new ByteArrayInputStream(bytes));
                                value = in.readObject();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        if (name != null && value != null) {
                            properties.put(name, value);
                        }
                        done = true;
                    }
                }
            } else if (eventType == 3 && parser.getName().equals("properties")) {
                return properties;
            }
        }
    }

    public static SASLMechanism.Failure parseSASLFailure(XmlPullParser parser) throws Exception {
        String condition = null;
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (!parser.getName().equals("failure")) {
                    condition = parser.getName();
                }
            } else if (eventType == 3 && parser.getName().equals("failure")) {
                done = true;
            }
        }
        return new SASLMechanism.Failure(condition);
    }

    public static StreamError parseStreamError(XmlPullParser parser) throws IOException, XmlPullParserException {
        StreamError streamError = null;
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                streamError = new StreamError(parser.getName());
            } else if (eventType == 3 && parser.getName().equals("error")) {
                done = true;
            }
        }
        return streamError;
    }

    public static XMPPError parseError(XmlPullParser parser) throws Exception {
        String errorCode = "-1";
        String type = null;
        String message = null;
        String condition = null;
        List<PacketExtension> extensions = new ArrayList<>();
        for (int i = 0; i < parser.getAttributeCount(); i++) {
            if (parser.getAttributeName(i).equals("code")) {
                errorCode = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "code");
            }
            if (parser.getAttributeName(i).equals("type")) {
                type = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "type");
            }
        }
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("text")) {
                    message = parser.nextText();
                } else {
                    String elementName = parser.getName();
                    String namespace = parser.getNamespace();
                    if ("urn:ietf:params:xml:ns:xmpp-stanzas".equals(namespace)) {
                        condition = elementName;
                    } else {
                        extensions.add(parsePacketExtension(elementName, namespace, parser));
                    }
                }
            } else if (eventType == 3 && parser.getName().equals("error")) {
                done = true;
            }
        }
        XMPPError.Type errorType = XMPPError.Type.CANCEL;
        if (type != null) {
            try {
                errorType = XMPPError.Type.valueOf(type.toUpperCase());
            } catch (IllegalArgumentException iae) {
                iae.printStackTrace();
            }
        }
        return new XMPPError(Integer.parseInt(errorCode), errorType, condition, message, extensions);
    }

    public static PacketExtension parsePacketExtension(String elementName, String namespace, XmlPullParser parser) throws Exception {
        Object provider = ProviderManager.getInstance().getExtensionProvider(elementName, namespace);
        if (provider != null) {
            if (provider instanceof PacketExtensionProvider) {
                return ((PacketExtensionProvider) provider).parseExtension(parser);
            }
            if (provider instanceof Class) {
                return (PacketExtension) parseWithIntrospection(elementName, (Class) provider, parser);
            }
        }
        DefaultPacketExtension extension = new DefaultPacketExtension(elementName, namespace);
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                String name = parser.getName();
                if (parser.isEmptyElementTag()) {
                    extension.setValue(name, XmlPullParser.NO_NAMESPACE);
                } else if (parser.next() == 4) {
                    String value = parser.getText();
                    extension.setValue(name, value);
                }
            } else if (eventType == 3 && parser.getName().equals(elementName)) {
                done = true;
            }
        }
        return extension;
    }

    private static String getLanguageAttribute(XmlPullParser parser) {
        for (int i = 0; i < parser.getAttributeCount(); i++) {
            String attributeName = parser.getAttributeName(i);
            if ("xml:lang".equals(attributeName) || ("lang".equals(attributeName) && "xml".equals(parser.getAttributePrefix(i)))) {
                return parser.getAttributeValue(i);
            }
        }
        return null;
    }

    public static Object parseWithIntrospection(String elementName, Class objectClass, XmlPullParser parser) throws Exception {
        boolean done = false;
        Object object = objectClass.newInstance();
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                String name = parser.getName();
                String stringValue = parser.nextText();
                PropertyDescriptor descriptor = new PropertyDescriptor(name, objectClass);
                Class propertyType = descriptor.getPropertyType();
                Object value = decode(propertyType, stringValue);
                descriptor.getWriteMethod().invoke(object, value);
            } else if (eventType == 3 && parser.getName().equals(elementName)) {
                done = true;
            }
        }
        return object;
    }

    private static Object decode(Class type, String value) throws Exception {
        if (type.getName().equals("java.lang.String")) {
            return value;
        }
        if (type.getName().equals("boolean")) {
            return Boolean.valueOf(value);
        }
        if (type.getName().equals("int")) {
            return Integer.valueOf(value);
        }
        if (type.getName().equals("long")) {
            return Long.valueOf(value);
        }
        if (type.getName().equals("float")) {
            return Float.valueOf(value);
        }
        if (type.getName().equals("double")) {
            return Double.valueOf(value);
        }
        if (type.getName().equals("java.lang.Class")) {
            return Class.forName(value);
        }
        return null;
    }
}
