package org.jivesoftware.smack.provider;

import java.util.ArrayList;
import org.jivesoftware.smack.packet.DefaultPacketExtension;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Privacy;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/provider/PrivacyProvider.class */
public class PrivacyProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser parser) throws Exception {
        Privacy privacy = new Privacy();
        privacy.addExtension(new DefaultPacketExtension(parser.getName(), parser.getNamespace()));
        boolean done = false;
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("active")) {
                    String activeName = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "name");
                    if (activeName == null) {
                        privacy.setDeclineActiveList(true);
                    } else {
                        privacy.setActiveName(activeName);
                    }
                } else if (parser.getName().equals("default")) {
                    String defaultName = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "name");
                    if (defaultName == null) {
                        privacy.setDeclineDefaultList(true);
                    } else {
                        privacy.setDefaultName(defaultName);
                    }
                } else if (parser.getName().equals("list")) {
                    parseList(parser, privacy);
                }
            } else if (eventType == 3 && parser.getName().equals("query")) {
                done = true;
            }
        }
        return privacy;
    }

    public void parseList(XmlPullParser parser, Privacy privacy) throws Exception {
        boolean done = false;
        String listName = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "name");
        ArrayList<PrivacyItem> items = new ArrayList<>();
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("item")) {
                    items.add(parseItem(parser));
                }
            } else if (eventType == 3 && parser.getName().equals("list")) {
                done = true;
            }
        }
        privacy.setPrivacyList(listName, items);
    }

    public PrivacyItem parseItem(XmlPullParser parser) throws Exception {
        boolean done = false;
        String actionValue = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "action");
        String orderValue = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "order");
        String type = parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "type");
        boolean allow = true;
        if ("allow".equalsIgnoreCase(actionValue)) {
            allow = true;
        } else if ("deny".equalsIgnoreCase(actionValue)) {
            allow = false;
        }
        int order = Integer.parseInt(orderValue);
        PrivacyItem item = new PrivacyItem(type, allow, order);
        item.setValue(parser.getAttributeValue(XmlPullParser.NO_NAMESPACE, "value"));
        while (!done) {
            int eventType = parser.next();
            if (eventType == 2) {
                if (parser.getName().equals("iq")) {
                    item.setFilterIQ(true);
                }
                if (parser.getName().equals("message")) {
                    item.setFilterMessage(true);
                }
                if (parser.getName().equals("presence-in")) {
                    item.setFilterPresence_in(true);
                }
                if (parser.getName().equals("presence-out")) {
                    item.setFilterPresence_out(true);
                }
            } else if (eventType == 3 && parser.getName().equals("item")) {
                done = true;
            }
        }
        return item;
    }
}
