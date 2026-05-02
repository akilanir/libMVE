package org.jivesoftware.smack;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.packet.RosterPacket;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Roster.class */
public class Roster {
    private static SubscriptionMode defaultSubscriptionMode = SubscriptionMode.accept_all;
    private Connection connection;
    private PresencePacketListener presencePacketListener;
    boolean rosterInitialized = false;
    private SubscriptionMode subscriptionMode = getDefaultSubscriptionMode();
    private final Map<String, RosterGroup> groups = new ConcurrentHashMap();
    private final List<RosterEntry> unfiledEntries = new CopyOnWriteArrayList();
    private final Map<String, RosterEntry> entries = new ConcurrentHashMap();
    private final List<RosterListener> rosterListeners = new CopyOnWriteArrayList();
    private Map<String, Map<String, Presence>> presenceMap = new ConcurrentHashMap();

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Roster$SubscriptionMode.class */
    public enum SubscriptionMode {
        accept_all,
        reject_all,
        manual
    }

    public static SubscriptionMode getDefaultSubscriptionMode() {
        return defaultSubscriptionMode;
    }

    public static void setDefaultSubscriptionMode(SubscriptionMode subscriptionMode) {
        defaultSubscriptionMode = subscriptionMode;
    }

    Roster(Connection connection) {
        this.connection = connection;
        PacketFilter rosterFilter = new PacketTypeFilter(RosterPacket.class);
        connection.addPacketListener(new RosterPacketListener(), rosterFilter);
        PacketFilter presenceFilter = new PacketTypeFilter(Presence.class);
        this.presencePacketListener = new PresencePacketListener();
        connection.addPacketListener(this.presencePacketListener, presenceFilter);
        final ConnectionListener connectionListener = new AbstractConnectionListener() { // from class: org.jivesoftware.smack.Roster.1
            @Override // org.jivesoftware.smack.AbstractConnectionListener, org.jivesoftware.smack.ConnectionListener
            public void connectionClosed() {
                Roster.this.setOfflinePresences();
            }

            @Override // org.jivesoftware.smack.AbstractConnectionListener, org.jivesoftware.smack.ConnectionListener
            public void connectionClosedOnError(Exception e) {
                Roster.this.setOfflinePresences();
            }
        };
        if (!this.connection.isConnected()) {
            Connection.addConnectionCreationListener(new ConnectionCreationListener() { // from class: org.jivesoftware.smack.Roster.2
                @Override // org.jivesoftware.smack.ConnectionCreationListener
                public void connectionCreated(Connection connection2) {
                    if (connection2.equals(Roster.this.connection)) {
                        Roster.this.connection.addConnectionListener(connectionListener);
                    }
                }
            });
        } else {
            connection.addConnectionListener(connectionListener);
        }
    }

    public SubscriptionMode getSubscriptionMode() {
        return this.subscriptionMode;
    }

    public void setSubscriptionMode(SubscriptionMode subscriptionMode) {
        this.subscriptionMode = subscriptionMode;
    }

    public void reload() {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        this.connection.sendPacket(new RosterPacket());
    }

    public void addRosterListener(RosterListener rosterListener) {
        if (!this.rosterListeners.contains(rosterListener)) {
            this.rosterListeners.add(rosterListener);
        }
    }

    public void removeRosterListener(RosterListener rosterListener) {
        this.rosterListeners.remove(rosterListener);
    }

    public RosterGroup createGroup(String name) {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        if (this.groups.containsKey(name)) {
            throw new IllegalArgumentException("Group with name " + name + " alread exists.");
        }
        RosterGroup group = new RosterGroup(name, this.connection);
        this.groups.put(name, group);
        return group;
    }

    public void createEntry(String user, String name, String[] groups) throws XMPPException {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        RosterPacket rosterPacket = new RosterPacket();
        rosterPacket.setType(IQ.Type.SET);
        RosterPacket.Item item = new RosterPacket.Item(user, name);
        if (groups != null) {
            for (String group : groups) {
                if (group != null && group.trim().length() > 0) {
                    item.addGroupName(group);
                }
            }
        }
        rosterPacket.addRosterItem(item);
        PacketCollector collector = this.connection.createPacketCollector(new PacketIDFilter(rosterPacket.getPacketID()));
        this.connection.sendPacket(rosterPacket);
        IQ response = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        collector.cancel();
        if (response == null) {
            throw new XMPPException("No response from the server.");
        }
        if (response.getType() == IQ.Type.ERROR) {
            throw new XMPPException(response.getError());
        }
        Presence presencePacket = new Presence(Presence.Type.subscribe);
        presencePacket.setTo(user);
        this.connection.sendPacket(presencePacket);
    }

    public void removeEntry(RosterEntry entry) throws XMPPException {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Not logged in to server.");
        }
        if (this.connection.isAnonymous()) {
            throw new IllegalStateException("Anonymous users can't have a roster.");
        }
        if (!this.entries.containsKey(entry.getUser())) {
            return;
        }
        RosterPacket packet = new RosterPacket();
        packet.setType(IQ.Type.SET);
        RosterPacket.Item item = RosterEntry.toRosterItem(entry);
        item.setItemType(RosterPacket.ItemType.remove);
        packet.addRosterItem(item);
        PacketCollector collector = this.connection.createPacketCollector(new PacketIDFilter(packet.getPacketID()));
        this.connection.sendPacket(packet);
        IQ response = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        collector.cancel();
        if (response == null) {
            throw new XMPPException("No response from the server.");
        }
        if (response.getType() == IQ.Type.ERROR) {
            throw new XMPPException(response.getError());
        }
    }

    public int getEntryCount() {
        return getEntries().size();
    }

    public Collection<RosterEntry> getEntries() {
        Set<RosterEntry> allEntries = new HashSet<>();
        for (RosterGroup rosterGroup : getGroups()) {
            allEntries.addAll(rosterGroup.getEntries());
        }
        allEntries.addAll(this.unfiledEntries);
        return Collections.unmodifiableCollection(allEntries);
    }

    public int getUnfiledEntryCount() {
        return this.unfiledEntries.size();
    }

    public Collection<RosterEntry> getUnfiledEntries() {
        return Collections.unmodifiableList(this.unfiledEntries);
    }

    public RosterEntry getEntry(String user) {
        if (user == null) {
            return null;
        }
        return this.entries.get(user.toLowerCase());
    }

    public boolean contains(String user) {
        return getEntry(user) != null;
    }

    public RosterGroup getGroup(String name) {
        return this.groups.get(name);
    }

    public int getGroupCount() {
        return this.groups.size();
    }

    public Collection<RosterGroup> getGroups() {
        return Collections.unmodifiableCollection(this.groups.values());
    }

    public Presence getPresence(String user) {
        String key = getPresenceMapKey(StringUtils.parseBareAddress(user));
        Map<String, Presence> userPresences = this.presenceMap.get(key);
        if (userPresences == null) {
            Presence presence = new Presence(Presence.Type.unavailable);
            presence.setFrom(user);
            return presence;
        }
        Presence presence2 = null;
        for (String resource : userPresences.keySet()) {
            Presence p = userPresences.get(resource);
            if (p.isAvailable()) {
                if (presence2 == null || p.getPriority() > presence2.getPriority()) {
                    presence2 = p;
                } else if (p.getPriority() == presence2.getPriority()) {
                    Presence.Mode pMode = p.getMode();
                    if (pMode == null) {
                        pMode = Presence.Mode.available;
                    }
                    Presence.Mode presenceMode = presence2.getMode();
                    if (presenceMode == null) {
                        presenceMode = Presence.Mode.available;
                    }
                    if (pMode.compareTo(presenceMode) < 0) {
                        presence2 = p;
                    }
                }
            }
        }
        if (presence2 == null) {
            Presence presence3 = new Presence(Presence.Type.unavailable);
            presence3.setFrom(user);
            return presence3;
        }
        return presence2;
    }

    public Presence getPresenceResource(String userWithResource) {
        String key = getPresenceMapKey(userWithResource);
        String resource = StringUtils.parseResource(userWithResource);
        Map<String, Presence> userPresences = this.presenceMap.get(key);
        if (userPresences == null) {
            Presence presence = new Presence(Presence.Type.unavailable);
            presence.setFrom(userWithResource);
            return presence;
        }
        Presence presence2 = userPresences.get(resource);
        if (presence2 == null) {
            Presence presence3 = new Presence(Presence.Type.unavailable);
            presence3.setFrom(userWithResource);
            return presence3;
        }
        return presence2;
    }

    public Iterator<Presence> getPresences(String user) {
        String key = getPresenceMapKey(user);
        Map<String, Presence> userPresences = this.presenceMap.get(key);
        if (userPresences == null) {
            Presence presence = new Presence(Presence.Type.unavailable);
            presence.setFrom(user);
            return Arrays.asList(presence).iterator();
        }
        Collection<Presence> answer = new ArrayList<>();
        for (Presence presence2 : userPresences.values()) {
            if (presence2.isAvailable()) {
                answer.add(presence2);
            }
        }
        if (!answer.isEmpty()) {
            return answer.iterator();
        }
        Presence presence3 = new Presence(Presence.Type.unavailable);
        presence3.setFrom(user);
        return Arrays.asList(presence3).iterator();
    }

    void cleanup() {
        this.rosterListeners.clear();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getPresenceMapKey(String user) {
        if (user == null) {
            return null;
        }
        String key = user;
        if (!contains(user)) {
            key = StringUtils.parseBareAddress(user);
        }
        return key.toLowerCase();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setOfflinePresences() {
        for (String user : this.presenceMap.keySet()) {
            Map<String, Presence> resources = this.presenceMap.get(user);
            if (resources != null) {
                for (String resource : resources.keySet()) {
                    Presence packetUnavailable = new Presence(Presence.Type.unavailable);
                    packetUnavailable.setFrom(user + "/" + resource);
                    this.presencePacketListener.processPacket(packetUnavailable);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fireRosterChangedEvent(Collection<String> addedEntries, Collection<String> updatedEntries, Collection<String> deletedEntries) {
        for (RosterListener listener : this.rosterListeners) {
            if (!addedEntries.isEmpty()) {
                listener.entriesAdded(addedEntries);
            }
            if (!updatedEntries.isEmpty()) {
                listener.entriesUpdated(updatedEntries);
            }
            if (!deletedEntries.isEmpty()) {
                listener.entriesDeleted(deletedEntries);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fireRosterPresenceEvent(Presence presence) {
        for (RosterListener listener : this.rosterListeners) {
            listener.presenceChanged(presence);
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Roster$PresencePacketListener.class */
    private class PresencePacketListener implements PacketListener {
        private PresencePacketListener() {
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            Map<String, Presence> userPresences;
            Map<String, Presence> userPresences2;
            Map<String, Presence> userPresences3;
            Presence presence = (Presence) packet;
            String from = presence.getFrom();
            String key = Roster.this.getPresenceMapKey(from);
            if (presence.getType() == Presence.Type.available) {
                if (Roster.this.presenceMap.get(key) != null) {
                    userPresences3 = (Map) Roster.this.presenceMap.get(key);
                } else {
                    userPresences3 = new ConcurrentHashMap<>();
                    Roster.this.presenceMap.put(key, userPresences3);
                }
                userPresences3.remove(XmlPullParser.NO_NAMESPACE);
                userPresences3.put(StringUtils.parseResource(from), presence);
                RosterEntry entry = (RosterEntry) Roster.this.entries.get(key);
                if (entry != null) {
                    Roster.this.fireRosterPresenceEvent(presence);
                    return;
                }
                return;
            }
            if (presence.getType() == Presence.Type.unavailable) {
                if (XmlPullParser.NO_NAMESPACE.equals(StringUtils.parseResource(from))) {
                    if (Roster.this.presenceMap.get(key) != null) {
                        userPresences2 = (Map) Roster.this.presenceMap.get(key);
                    } else {
                        userPresences2 = new ConcurrentHashMap<>();
                        Roster.this.presenceMap.put(key, userPresences2);
                    }
                    userPresences2.put(XmlPullParser.NO_NAMESPACE, presence);
                } else if (Roster.this.presenceMap.get(key) != null) {
                    ((Map) Roster.this.presenceMap.get(key)).put(StringUtils.parseResource(from), presence);
                }
                RosterEntry entry2 = (RosterEntry) Roster.this.entries.get(key);
                if (entry2 != null) {
                    Roster.this.fireRosterPresenceEvent(presence);
                    return;
                }
                return;
            }
            if (presence.getType() == Presence.Type.subscribe) {
                if (Roster.this.subscriptionMode != SubscriptionMode.accept_all) {
                    if (Roster.this.subscriptionMode == SubscriptionMode.reject_all) {
                        Presence response = new Presence(Presence.Type.unsubscribed);
                        response.setTo(presence.getFrom());
                        Roster.this.connection.sendPacket(response);
                        return;
                    }
                    return;
                }
                Presence response2 = new Presence(Presence.Type.subscribed);
                response2.setTo(presence.getFrom());
                Roster.this.connection.sendPacket(response2);
                return;
            }
            if (presence.getType() == Presence.Type.unsubscribe) {
                if (Roster.this.subscriptionMode != SubscriptionMode.manual) {
                    Presence response3 = new Presence(Presence.Type.unsubscribed);
                    response3.setTo(presence.getFrom());
                    Roster.this.connection.sendPacket(response3);
                    return;
                }
                return;
            }
            if (presence.getType() == Presence.Type.error && XmlPullParser.NO_NAMESPACE.equals(StringUtils.parseResource(from))) {
                if (Roster.this.presenceMap.containsKey(key)) {
                    userPresences = (Map) Roster.this.presenceMap.get(key);
                    userPresences.clear();
                } else {
                    userPresences = new ConcurrentHashMap<>();
                    Roster.this.presenceMap.put(key, userPresences);
                }
                userPresences.put(XmlPullParser.NO_NAMESPACE, presence);
                RosterEntry entry3 = (RosterEntry) Roster.this.entries.get(key);
                if (entry3 != null) {
                    Roster.this.fireRosterPresenceEvent(presence);
                }
            }
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/Roster$RosterPacketListener.class */
    private class RosterPacketListener implements PacketListener {
        private RosterPacketListener() {
        }

        @Override // org.jivesoftware.smack.PacketListener
        public void processPacket(Packet packet) {
            Collection<String> addedEntries = new ArrayList<>();
            Collection<String> updatedEntries = new ArrayList<>();
            Collection<String> deletedEntries = new ArrayList<>();
            RosterPacket rosterPacket = (RosterPacket) packet;
            for (RosterPacket.Item item : rosterPacket.getRosterItems()) {
                RosterEntry entry = new RosterEntry(item.getUser(), item.getName(), item.getItemType(), item.getItemStatus(), Roster.this, Roster.this.connection);
                if (RosterPacket.ItemType.remove.equals(item.getItemType())) {
                    if (Roster.this.entries.containsKey(item.getUser())) {
                        Roster.this.entries.remove(item.getUser());
                    }
                    if (Roster.this.unfiledEntries.contains(entry)) {
                        Roster.this.unfiledEntries.remove(entry);
                    }
                    String key = StringUtils.parseName(item.getUser()) + "@" + StringUtils.parseServer(item.getUser());
                    Roster.this.presenceMap.remove(key);
                    deletedEntries.add(item.getUser());
                } else {
                    if (!Roster.this.entries.containsKey(item.getUser())) {
                        Roster.this.entries.put(item.getUser(), entry);
                        addedEntries.add(item.getUser());
                    } else {
                        RosterEntry oldEntry = (RosterEntry) Roster.this.entries.put(item.getUser(), entry);
                        RosterPacket.Item oldItem = RosterEntry.toRosterItem(oldEntry);
                        if (oldEntry == null || !oldEntry.equalsDeep(entry) || !item.getGroupNames().equals(oldItem.getGroupNames())) {
                            updatedEntries.add(item.getUser());
                        }
                    }
                    if (!item.getGroupNames().isEmpty()) {
                        Roster.this.unfiledEntries.remove(entry);
                    } else if (!Roster.this.unfiledEntries.contains(entry)) {
                        Roster.this.unfiledEntries.add(entry);
                    }
                }
                List<String> currentGroupNames = new ArrayList<>();
                for (RosterGroup group : Roster.this.getGroups()) {
                    if (group.contains(entry)) {
                        currentGroupNames.add(group.getName());
                    }
                }
                if (!RosterPacket.ItemType.remove.equals(item.getItemType())) {
                    List<String> newGroupNames = new ArrayList<>();
                    for (String groupName : item.getGroupNames()) {
                        newGroupNames.add(groupName);
                        RosterGroup group2 = Roster.this.getGroup(groupName);
                        if (group2 == null) {
                            group2 = Roster.this.createGroup(groupName);
                            Roster.this.groups.put(groupName, group2);
                        }
                        group2.addEntryLocal(entry);
                    }
                    for (String newGroupName : newGroupNames) {
                        currentGroupNames.remove(newGroupName);
                    }
                }
                for (String groupName2 : currentGroupNames) {
                    RosterGroup group3 = Roster.this.getGroup(groupName2);
                    group3.removeEntryLocal(entry);
                    if (group3.getEntryCount() == 0) {
                        Roster.this.groups.remove(groupName2);
                    }
                }
                for (RosterGroup group4 : Roster.this.getGroups()) {
                    if (group4.getEntryCount() == 0) {
                        Roster.this.groups.remove(group4.getName());
                    }
                }
            }
            synchronized (Roster.this) {
                Roster.this.rosterInitialized = true;
                Roster.this.notifyAll();
            }
            Roster.this.fireRosterChangedEvent(addedEntries, updatedEntries, deletedEntries);
        }
    }
}
