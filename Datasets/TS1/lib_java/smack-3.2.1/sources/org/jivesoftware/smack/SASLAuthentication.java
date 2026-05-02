package org.jivesoftware.smack;

import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.security.auth.callback.CallbackHandler;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.Bind;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Session;
import org.jivesoftware.smack.sasl.SASLAnonymous;
import org.jivesoftware.smack.sasl.SASLCramMD5Mechanism;
import org.jivesoftware.smack.sasl.SASLDigestMD5Mechanism;
import org.jivesoftware.smack.sasl.SASLExternalMechanism;
import org.jivesoftware.smack.sasl.SASLGSSAPIMechanism;
import org.jivesoftware.smack.sasl.SASLMechanism;
import org.jivesoftware.smack.sasl.SASLPlainMechanism;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/SASLAuthentication.class */
public class SASLAuthentication implements UserAuthentication {
    private static Map<String, Class> implementedMechanisms = new HashMap();
    private static List<String> mechanismsPreferences = new ArrayList();
    private Connection connection;
    private Collection<String> serverMechanisms = new ArrayList();
    private SASLMechanism currentMechanism = null;
    private boolean saslNegotiated;
    private boolean saslFailed;
    private boolean resourceBinded;
    private boolean sessionSupported;
    private String errorCondition;

    static {
        registerSASLMechanism("EXTERNAL", SASLExternalMechanism.class);
        registerSASLMechanism("GSSAPI", SASLGSSAPIMechanism.class);
        registerSASLMechanism("DIGEST-MD5", SASLDigestMD5Mechanism.class);
        registerSASLMechanism("CRAM-MD5", SASLCramMD5Mechanism.class);
        registerSASLMechanism("PLAIN", SASLPlainMechanism.class);
        registerSASLMechanism("ANONYMOUS", SASLAnonymous.class);
        supportSASLMechanism("GSSAPI", 0);
        supportSASLMechanism("DIGEST-MD5", 1);
        supportSASLMechanism("CRAM-MD5", 2);
        supportSASLMechanism("PLAIN", 3);
        supportSASLMechanism("ANONYMOUS", 4);
    }

    public static void registerSASLMechanism(String name, Class mClass) {
        implementedMechanisms.put(name, mClass);
    }

    public static void unregisterSASLMechanism(String name) {
        implementedMechanisms.remove(name);
        mechanismsPreferences.remove(name);
    }

    public static void supportSASLMechanism(String name) {
        mechanismsPreferences.add(0, name);
    }

    public static void supportSASLMechanism(String name, int index) {
        mechanismsPreferences.add(index, name);
    }

    public static void unsupportSASLMechanism(String name) {
        mechanismsPreferences.remove(name);
    }

    public static List<Class> getRegisterSASLMechanisms() {
        List<Class> answer = new ArrayList<>();
        for (String mechanismsPreference : mechanismsPreferences) {
            answer.add(implementedMechanisms.get(mechanismsPreference));
        }
        return answer;
    }

    SASLAuthentication(Connection connection) {
        this.connection = connection;
        init();
    }

    public boolean hasAnonymousAuthentication() {
        return this.serverMechanisms.contains("ANONYMOUS");
    }

    public boolean hasNonAnonymousAuthentication() {
        return (this.serverMechanisms.isEmpty() || (this.serverMechanisms.size() == 1 && hasAnonymousAuthentication())) ? false : true;
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String username, String resource, CallbackHandler cbh) throws XMPPException {
        String selectedMechanism = null;
        Iterator i$ = mechanismsPreferences.iterator();
        while (true) {
            if (!i$.hasNext()) {
                break;
            }
            String mechanism = i$.next();
            if (implementedMechanisms.containsKey(mechanism) && this.serverMechanisms.contains(mechanism)) {
                selectedMechanism = mechanism;
                break;
            }
        }
        if (selectedMechanism != null) {
            try {
                Class mechanismClass = implementedMechanisms.get(selectedMechanism);
                Constructor constructor = mechanismClass.getConstructor(SASLAuthentication.class);
                this.currentMechanism = (SASLMechanism) constructor.newInstance(this);
                this.currentMechanism.authenticate(username, this.connection.getHost(), cbh);
                synchronized (this) {
                    if (!this.saslNegotiated && !this.saslFailed) {
                        try {
                            wait(30000L);
                        } catch (InterruptedException e) {
                        }
                    }
                }
            } catch (XMPPException e2) {
                throw e2;
            } catch (Exception e3) {
                e3.printStackTrace();
            }
            if (this.saslFailed) {
                if (this.errorCondition != null) {
                    throw new XMPPException("SASL authentication " + selectedMechanism + " failed: " + this.errorCondition);
                }
                throw new XMPPException("SASL authentication failed using mechanism " + selectedMechanism);
            }
            if (this.saslNegotiated) {
                return bindResourceAndEstablishSession(resource);
            }
            throw new XMPPException("SASL authentication failed");
        }
        throw new XMPPException("SASL Authentication failed. No known authentication mechanisims.");
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticate(String username, String password, String resource) throws XMPPException {
        String selectedMechanism = null;
        Iterator i$ = mechanismsPreferences.iterator();
        while (true) {
            if (!i$.hasNext()) {
                break;
            }
            String mechanism = i$.next();
            if (implementedMechanisms.containsKey(mechanism) && this.serverMechanisms.contains(mechanism)) {
                selectedMechanism = mechanism;
                break;
            }
        }
        if (selectedMechanism != null) {
            try {
                Class mechanismClass = implementedMechanisms.get(selectedMechanism);
                Constructor constructor = mechanismClass.getConstructor(SASLAuthentication.class);
                this.currentMechanism = (SASLMechanism) constructor.newInstance(this);
                this.currentMechanism.authenticate(username, this.connection.getServiceName(), password);
                synchronized (this) {
                    if (!this.saslNegotiated && !this.saslFailed) {
                        try {
                            wait(30000L);
                        } catch (InterruptedException e) {
                        }
                    }
                }
                if (this.saslFailed) {
                    if (this.errorCondition != null) {
                        throw new XMPPException("SASL authentication " + selectedMechanism + " failed: " + this.errorCondition);
                    }
                    throw new XMPPException("SASL authentication failed using mechanism " + selectedMechanism);
                }
                if (this.saslNegotiated) {
                    return bindResourceAndEstablishSession(resource);
                }
                return new NonSASLAuthentication(this.connection).authenticate(username, password, resource);
            } catch (XMPPException e2) {
                throw e2;
            } catch (Exception e3) {
                e3.printStackTrace();
                return new NonSASLAuthentication(this.connection).authenticate(username, password, resource);
            }
        }
        return new NonSASLAuthentication(this.connection).authenticate(username, password, resource);
    }

    @Override // org.jivesoftware.smack.UserAuthentication
    public String authenticateAnonymously() throws XMPPException {
        try {
            this.currentMechanism = new SASLAnonymous(this);
            this.currentMechanism.authenticate((String) null, (String) null, XmlPullParser.NO_NAMESPACE);
            synchronized (this) {
                if (!this.saslNegotiated && !this.saslFailed) {
                    try {
                        wait(5000L);
                    } catch (InterruptedException e) {
                    }
                }
            }
            if (this.saslFailed) {
                if (this.errorCondition != null) {
                    throw new XMPPException("SASL authentication failed: " + this.errorCondition);
                }
                throw new XMPPException("SASL authentication failed");
            }
            if (this.saslNegotiated) {
                return bindResourceAndEstablishSession(null);
            }
            return new NonSASLAuthentication(this.connection).authenticateAnonymously();
        } catch (IOException e2) {
            return new NonSASLAuthentication(this.connection).authenticateAnonymously();
        }
    }

    private String bindResourceAndEstablishSession(String resource) throws XMPPException {
        synchronized (this) {
            if (!this.resourceBinded) {
                try {
                    wait(30000L);
                } catch (InterruptedException e) {
                }
            }
        }
        if (!this.resourceBinded) {
            throw new XMPPException("Resource binding not offered by server");
        }
        Bind bindResource = new Bind();
        bindResource.setResource(resource);
        PacketCollector collector = this.connection.createPacketCollector(new PacketIDFilter(bindResource.getPacketID()));
        this.connection.sendPacket(bindResource);
        Bind response = (Bind) collector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        collector.cancel();
        if (response == null) {
            throw new XMPPException("No response from the server.");
        }
        if (response.getType() == IQ.Type.ERROR) {
            throw new XMPPException(response.getError());
        }
        String userJID = response.getJid();
        if (this.sessionSupported) {
            Session session = new Session();
            PacketCollector collector2 = this.connection.createPacketCollector(new PacketIDFilter(session.getPacketID()));
            this.connection.sendPacket(session);
            IQ ack = (IQ) collector2.nextResult(SmackConfiguration.getPacketReplyTimeout());
            collector2.cancel();
            if (ack == null) {
                throw new XMPPException("No response from the server.");
            }
            if (ack.getType() == IQ.Type.ERROR) {
                throw new XMPPException(ack.getError());
            }
            return userJID;
        }
        throw new XMPPException("Session establishment not offered by server");
    }

    void setAvailableSASLMethods(Collection<String> mechanisms) {
        this.serverMechanisms = mechanisms;
    }

    public boolean isAuthenticated() {
        return this.saslNegotiated;
    }

    void challengeReceived(String challenge) throws IOException {
        this.currentMechanism.challengeReceived(challenge);
    }

    void authenticated() {
        synchronized (this) {
            this.saslNegotiated = true;
            notify();
        }
    }

    void authenticationFailed() {
        authenticationFailed(null);
    }

    void authenticationFailed(String condition) {
        synchronized (this) {
            this.saslFailed = true;
            this.errorCondition = condition;
            notify();
        }
    }

    void bindingRequired() {
        synchronized (this) {
            this.resourceBinded = true;
            notify();
        }
    }

    public void send(Packet stanza) {
        this.connection.sendPacket(stanza);
    }

    void sessionsSupported() {
        this.sessionSupported = true;
    }

    protected void init() {
        this.saslNegotiated = false;
        this.saslFailed = false;
        this.resourceBinded = false;
        this.sessionSupported = false;
    }
}
