package org.jivesoftware.smack;

import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Registration;
import org.jivesoftware.smack.util.StringUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/AccountManager.class */
public class AccountManager {
    private Connection connection;
    private Registration info = null;
    private boolean accountCreationSupported = false;

    public AccountManager(Connection connection) {
        this.connection = connection;
    }

    void setSupportsAccountCreation(boolean accountCreationSupported) {
        this.accountCreationSupported = accountCreationSupported;
    }

    public boolean supportsAccountCreation() {
        if (this.accountCreationSupported) {
            return true;
        }
        try {
            if (this.info == null) {
                getRegistrationInfo();
                this.accountCreationSupported = this.info.getType() != IQ.Type.ERROR;
            }
            return this.accountCreationSupported;
        } catch (XMPPException e) {
            return false;
        }
    }

    public Collection<String> getAccountAttributes() {
        try {
            if (this.info == null) {
                getRegistrationInfo();
            }
            Map<String, String> attributes = this.info.getAttributes();
            if (attributes != null) {
                return Collections.unmodifiableSet(attributes.keySet());
            }
        } catch (XMPPException xe) {
            xe.printStackTrace();
        }
        return Collections.emptySet();
    }

    public String getAccountAttribute(String name) {
        try {
            if (this.info == null) {
                getRegistrationInfo();
            }
            return this.info.getAttributes().get(name);
        } catch (XMPPException xe) {
            xe.printStackTrace();
            return null;
        }
    }

    public String getAccountInstructions() {
        try {
            if (this.info == null) {
                getRegistrationInfo();
            }
            return this.info.getInstructions();
        } catch (XMPPException e) {
            return null;
        }
    }

    public void createAccount(String username, String password) throws XMPPException {
        if (!supportsAccountCreation()) {
            throw new XMPPException("Server does not support account creation.");
        }
        Map<String, String> attributes = new HashMap<>();
        for (String attributeName : getAccountAttributes()) {
            attributes.put(attributeName, XmlPullParser.NO_NAMESPACE);
        }
        createAccount(username, password, attributes);
    }

    public void createAccount(String username, String password, Map<String, String> attributes) throws XMPPException {
        if (!supportsAccountCreation()) {
            throw new XMPPException("Server does not support account creation.");
        }
        Registration reg = new Registration();
        reg.setType(IQ.Type.SET);
        reg.setTo(this.connection.getServiceName());
        attributes.put("username", username);
        attributes.put("password", password);
        reg.setAttributes(attributes);
        PacketFilter filter = new AndFilter(new PacketIDFilter(reg.getPacketID()), new PacketTypeFilter(IQ.class));
        PacketCollector collector = this.connection.createPacketCollector(filter);
        this.connection.sendPacket(reg);
        IQ result = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        collector.cancel();
        if (result == null) {
            throw new XMPPException("No response from server.");
        }
        if (result.getType() == IQ.Type.ERROR) {
            throw new XMPPException(result.getError());
        }
    }

    public void changePassword(String newPassword) throws XMPPException {
        Registration reg = new Registration();
        reg.setType(IQ.Type.SET);
        reg.setTo(this.connection.getServiceName());
        Map<String, String> map = new HashMap<>();
        map.put("username", StringUtils.parseName(this.connection.getUser()));
        map.put("password", newPassword);
        reg.setAttributes(map);
        PacketFilter filter = new AndFilter(new PacketIDFilter(reg.getPacketID()), new PacketTypeFilter(IQ.class));
        PacketCollector collector = this.connection.createPacketCollector(filter);
        this.connection.sendPacket(reg);
        IQ result = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        collector.cancel();
        if (result == null) {
            throw new XMPPException("No response from server.");
        }
        if (result.getType() == IQ.Type.ERROR) {
            throw new XMPPException(result.getError());
        }
    }

    public void deleteAccount() throws XMPPException {
        if (!this.connection.isAuthenticated()) {
            throw new IllegalStateException("Must be logged in to delete a account.");
        }
        Registration reg = new Registration();
        reg.setType(IQ.Type.SET);
        reg.setTo(this.connection.getServiceName());
        Map<String, String> attributes = new HashMap<>();
        attributes.put("remove", XmlPullParser.NO_NAMESPACE);
        reg.setAttributes(attributes);
        PacketFilter filter = new AndFilter(new PacketIDFilter(reg.getPacketID()), new PacketTypeFilter(IQ.class));
        PacketCollector collector = this.connection.createPacketCollector(filter);
        this.connection.sendPacket(reg);
        IQ result = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        collector.cancel();
        if (result == null) {
            throw new XMPPException("No response from server.");
        }
        if (result.getType() == IQ.Type.ERROR) {
            throw new XMPPException(result.getError());
        }
    }

    private synchronized void getRegistrationInfo() throws XMPPException {
        Registration reg = new Registration();
        reg.setTo(this.connection.getServiceName());
        PacketFilter filter = new AndFilter(new PacketIDFilter(reg.getPacketID()), new PacketTypeFilter(IQ.class));
        PacketCollector collector = this.connection.createPacketCollector(filter);
        this.connection.sendPacket(reg);
        IQ result = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        collector.cancel();
        if (result == null) {
            throw new XMPPException("No response from server.");
        }
        if (result.getType() == IQ.Type.ERROR) {
            throw new XMPPException(result.getError());
        }
        this.info = (Registration) result;
    }
}
