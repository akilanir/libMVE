package org.jivesoftware.smack;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.PasswordCallback;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.Authentication;
import org.jivesoftware.smack.packet.IQ;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/NonSASLAuthentication.class */
class NonSASLAuthentication implements UserAuthentication {
    private Connection connection;

    public NonSASLAuthentication(Connection connection) {
        this.connection = connection;
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String username, String resource, CallbackHandler cbh) throws XMPPException {
        PasswordCallback pcb = new PasswordCallback("Password: ", false);
        try {
            cbh.handle(new Callback[]{pcb});
            return authenticate(username, String.valueOf(pcb.getPassword()), resource);
        } catch (Exception e) {
            throw new XMPPException("Unable to determine password.", e);
        }
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String username, String password, String resource) throws XMPPException {
        Authentication discoveryAuth = new Authentication();
        discoveryAuth.setType(IQ.Type.GET);
        discoveryAuth.setUsername(username);
        PacketCollector collector = this.connection.createPacketCollector(new PacketIDFilter(discoveryAuth.getPacketID()));
        this.connection.sendPacket(discoveryAuth);
        IQ response = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        if (response == null) {
            throw new XMPPException("No response from the server.");
        }
        if (response.getType() == IQ.Type.ERROR) {
            throw new XMPPException(response.getError());
        }
        Authentication authTypes = (Authentication) response;
        collector.cancel();
        Authentication auth = new Authentication();
        auth.setUsername(username);
        if (authTypes.getDigest() != null) {
            auth.setDigest(this.connection.getConnectionID(), password);
        } else if (authTypes.getPassword() != null) {
            auth.setPassword(password);
        } else {
            throw new XMPPException("Server does not support compatible authentication mechanism.");
        }
        auth.setResource(resource);
        PacketCollector collector2 = this.connection.createPacketCollector(new PacketIDFilter(auth.getPacketID()));
        this.connection.sendPacket(auth);
        IQ response2 = (IQ) collector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
        if (response2 == null) {
            throw new XMPPException("Authentication failed.");
        }
        if (response2.getType() == IQ.Type.ERROR) {
            throw new XMPPException(response2.getError());
        }
        collector2.cancel();
        return response2.getTo();
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticateAnonymously() throws XMPPException {
        Authentication auth = new Authentication();
        PacketCollector collector = this.connection.createPacketCollector(new PacketIDFilter(auth.getPacketID()));
        this.connection.sendPacket(auth);
        IQ response = (IQ) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        if (response == null) {
            throw new XMPPException("Anonymous login failed.");
        }
        if (response.getType() == IQ.Type.ERROR) {
            throw new XMPPException(response.getError());
        }
        collector.cancel();
        if (response.getTo() != null) {
            return response.getTo();
        }
        return this.connection.getServiceName() + "/" + ((Authentication) response).getResource();
    }
}
