package org.jivesoftware.smack;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.IQTypeFilter;
import org.jivesoftware.smack.filter.PacketExtensionFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Privacy;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/PrivacyListManager.class */
public class PrivacyListManager {
    private static Map<Connection, PrivacyListManager> instances = new Hashtable();
    private Connection connection;
    private final List<PrivacyListListener> listeners;
    PacketFilter packetFilter;

    static {
        Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smack.PrivacyListManager.1
            @Override // org.jivesoftware.smack.ConnectionCreationListener
            public void connectionCreated(Connection connection) {
                new PrivacyListManager(connection);
            }
        });
    }

    private PrivacyListManager(Connection connection) {
        this.listeners = new ArrayList();
        this.packetFilter = new AndFilter(new IQTypeFilter(IQ.Type.SET), new PacketExtensionFilter("query", "jabber:iq:privacy"));
        this.connection = connection;
        init();
    }

    private String getUser() {
        return this.connection.getUser();
    }

    private void init() {
        instances.put(this.connection, this);
        this.connection.addConnectionListener(new ConnectionListener() { // from class: org.jivesoftware.smack.PrivacyListManager.2
            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                PrivacyListManager.instances.remove(PrivacyListManager.this.connection);
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception e) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionFailed(Exception e) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectingIn(int seconds) {
            }

            @Override // org.jivesoftware.smack.ConnectionListener
            public void reconnectionSuccessful() {
            }
        });
        this.connection.addPacketListener(new PacketListener() { // from class: org.jivesoftware.smack.PrivacyListManager.3
            @Override // org.jivesoftware.smack.PacketListener
            public void processPacket(Packet packet) {
                if (packet == null || packet.getError() != null) {
                    return;
                }
                Privacy privacy = (Privacy) packet;
                synchronized (PrivacyListManager.this.listeners) {
                    for (PrivacyListListener listener : PrivacyListManager.this.listeners) {
                        for (Map.Entry<String, List<PrivacyItem>> entry : privacy.getItemLists().entrySet()) {
                            String listName = entry.getKey();
                            List<PrivacyItem> items = entry.getValue();
                            if (items.isEmpty()) {
                                listener.updatedPrivacyList(listName);
                            } else {
                                listener.setPrivacyList(listName, items);
                            }
                        }
                    }
                }
                IQ iq = new IQ() { // from class: org.jivesoftware.smack.PrivacyListManager.3.1
                    @Override // org.jivesoftware.smack.packet.IQ
                    public String getChildElementXML() {
                        return XmlPullParser.NO_NAMESPACE;
                    }
                };
                iq.setType(IQ.Type.RESULT);
                iq.setFrom(packet.getFrom());
                iq.setPacketID(packet.getPacketID());
                PrivacyListManager.this.connection.sendPacket(iq);
            }
        }, this.packetFilter);
    }

    public static PrivacyListManager getInstanceFor(Connection connection) {
        return instances.get(connection);
    }

    private Privacy getRequest(Privacy requestPrivacy) throws XMPPException {
        requestPrivacy.setType(IQ.Type.GET);
        requestPrivacy.setFrom(getUser());
        PacketFilter responseFilter = new PacketIDFilter(requestPrivacy.getPacketID());
        PacketCollector response = this.connection.createPacketCollector(responseFilter);
        this.connection.sendPacket(requestPrivacy);
        Privacy privacyAnswer = (Privacy) response.nextResult(SmackConfiguration.getPacketReplyTimeout());
        response.cancel();
        if (privacyAnswer == null) {
            throw new XMPPException("No response from server.");
        }
        if (privacyAnswer.getError() != null) {
            throw new XMPPException(privacyAnswer.getError());
        }
        return privacyAnswer;
    }

    private Packet setRequest(Privacy requestPrivacy) throws XMPPException {
        requestPrivacy.setType(IQ.Type.SET);
        requestPrivacy.setFrom(getUser());
        PacketFilter responseFilter = new PacketIDFilter(requestPrivacy.getPacketID());
        PacketCollector response = this.connection.createPacketCollector(responseFilter);
        this.connection.sendPacket(requestPrivacy);
        Packet privacyAnswer = response.nextResult(SmackConfiguration.getPacketReplyTimeout());
        response.cancel();
        if (privacyAnswer == null) {
            throw new XMPPException("No response from server.");
        }
        if (privacyAnswer.getError() != null) {
            throw new XMPPException(privacyAnswer.getError());
        }
        return privacyAnswer;
    }

    private Privacy getPrivacyWithListNames() throws XMPPException {
        Privacy request = new Privacy();
        return getRequest(request);
    }

    public PrivacyList getActiveList() throws XMPPException {
        Privacy privacyAnswer = getPrivacyWithListNames();
        String listName = privacyAnswer.getActiveName();
        boolean isDefaultAndActive = (privacyAnswer.getActiveName() == null || privacyAnswer.getDefaultName() == null || !privacyAnswer.getActiveName().equals(privacyAnswer.getDefaultName())) ? false : true;
        return new PrivacyList(true, isDefaultAndActive, listName, getPrivacyListItems(listName));
    }

    public PrivacyList getDefaultList() throws XMPPException {
        Privacy privacyAnswer = getPrivacyWithListNames();
        String listName = privacyAnswer.getDefaultName();
        boolean isDefaultAndActive = (privacyAnswer.getActiveName() == null || privacyAnswer.getDefaultName() == null || !privacyAnswer.getActiveName().equals(privacyAnswer.getDefaultName())) ? false : true;
        return new PrivacyList(isDefaultAndActive, true, listName, getPrivacyListItems(listName));
    }

    private List<PrivacyItem> getPrivacyListItems(String listName) throws XMPPException {
        Privacy request = new Privacy();
        request.setPrivacyList(listName, new ArrayList());
        Privacy privacyAnswer = getRequest(request);
        return privacyAnswer.getPrivacyList(listName);
    }

    public PrivacyList getPrivacyList(String listName) throws XMPPException {
        return new PrivacyList(false, false, listName, getPrivacyListItems(listName));
    }

    public PrivacyList[] getPrivacyLists() throws XMPPException {
        Privacy privacyAnswer = getPrivacyWithListNames();
        Set<String> names = privacyAnswer.getPrivacyListNames();
        PrivacyList[] lists = new PrivacyList[names.size()];
        int index = 0;
        for (String listName : names) {
            boolean isActiveList = listName.equals(privacyAnswer.getActiveName());
            boolean isDefaultList = listName.equals(privacyAnswer.getDefaultName());
            lists[index] = new PrivacyList(isActiveList, isDefaultList, listName, getPrivacyListItems(listName));
            index++;
        }
        return lists;
    }

    public void setActiveListName(String listName) throws XMPPException {
        Privacy request = new Privacy();
        request.setActiveName(listName);
        setRequest(request);
    }

    public void declineActiveList() throws XMPPException {
        Privacy request = new Privacy();
        request.setDeclineActiveList(true);
        setRequest(request);
    }

    public void setDefaultListName(String listName) throws XMPPException {
        Privacy request = new Privacy();
        request.setDefaultName(listName);
        setRequest(request);
    }

    public void declineDefaultList() throws XMPPException {
        Privacy request = new Privacy();
        request.setDeclineDefaultList(true);
        setRequest(request);
    }

    public void createPrivacyList(String listName, List<PrivacyItem> privacyItems) throws XMPPException {
        updatePrivacyList(listName, privacyItems);
    }

    public void updatePrivacyList(String listName, List<PrivacyItem> privacyItems) throws XMPPException {
        Privacy request = new Privacy();
        request.setPrivacyList(listName, privacyItems);
        setRequest(request);
    }

    public void deletePrivacyList(String listName) throws XMPPException {
        Privacy request = new Privacy();
        request.setPrivacyList(listName, new ArrayList());
        setRequest(request);
    }

    public void addListener(PrivacyListListener listener) {
        synchronized (this.listeners) {
            this.listeners.add(listener);
        }
    }
}
