package org.jivesoftware.smack.sasl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;
import javax.security.sasl.RealmCallback;
import javax.security.sasl.RealmChoiceCallback;
import javax.security.sasl.Sasl;
import javax.security.sasl.SaslClient;
import javax.security.sasl.SaslException;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.util.Base64;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLMechanism.class */
public abstract class SASLMechanism implements CallbackHandler {
    private SASLAuthentication saslAuthentication;
    protected SaslClient sc;
    protected String authenticationId;
    protected String password;
    protected String hostname;

    protected abstract String getName();

    public SASLMechanism(SASLAuthentication saslAuthentication) {
        this.saslAuthentication = saslAuthentication;
    }

    public void authenticate(String username, String host, String password) throws IOException, XMPPException {
        this.authenticationId = username;
        this.password = password;
        this.hostname = host;
        String[] mechanisms = {getName()};
        Map<String, String> props = new HashMap<>();
        this.sc = Sasl.createSaslClient(mechanisms, username, "xmpp", host, props, this);
        authenticate();
    }

    public void authenticate(String username, String host, CallbackHandler cbh) throws IOException, XMPPException {
        String[] mechanisms = {getName()};
        Map<String, String> props = new HashMap<>();
        this.sc = Sasl.createSaslClient(mechanisms, username, "xmpp", host, props, cbh);
        authenticate();
    }

    protected void authenticate() throws IOException, XMPPException {
        String authenticationText = null;
        try {
            if (this.sc.hasInitialResponse()) {
                byte[] response = this.sc.evaluateChallenge(new byte[0]);
                authenticationText = Base64.encodeBytes(response, 8);
            }
            getSASLAuthentication().send(new AuthMechanism(getName(), authenticationText));
        } catch (SaslException e) {
            throw new XMPPException("SASL authentication failed", (Throwable) e);
        }
    }

    public void challengeReceived(String challenge) throws IOException {
        byte[] response;
        Packet responseStanza;
        if (challenge != null) {
            response = this.sc.evaluateChallenge(Base64.decode(challenge));
        } else {
            response = this.sc.evaluateChallenge(new byte[0]);
        }
        if (response == null) {
            responseStanza = new Response();
        } else {
            responseStanza = new Response(Base64.encodeBytes(response, 8));
        }
        getSASLAuthentication().send(responseStanza);
    }

    protected SASLAuthentication getSASLAuthentication() {
        return this.saslAuthentication;
    }

    @Override // javax.security.auth.callback.CallbackHandler
    public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException {
        for (int i = 0; i < callbacks.length; i++) {
            if (callbacks[i] instanceof NameCallback) {
                NameCallback ncb = (NameCallback) callbacks[i];
                ncb.setName(this.authenticationId);
            } else if (callbacks[i] instanceof PasswordCallback) {
                PasswordCallback pcb = (PasswordCallback) callbacks[i];
                pcb.setPassword(this.password.toCharArray());
            } else if (callbacks[i] instanceof RealmCallback) {
                RealmCallback rcb = (RealmCallback) callbacks[i];
                rcb.setText(this.hostname);
            } else if (!(callbacks[i] instanceof RealmChoiceCallback)) {
                throw new UnsupportedCallbackException(callbacks[i]);
            }
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLMechanism$AuthMechanism.class */
    public class AuthMechanism extends Packet {
        private final String name;
        private final String authenticationText;

        public AuthMechanism(String name, String authenticationText) {
            if (name == null) {
                throw new NullPointerException("SASL mechanism name shouldn't be null.");
            }
            this.name = name;
            this.authenticationText = authenticationText;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder stanza = new StringBuilder();
            stanza.append("<auth mechanism=\"").append(this.name);
            stanza.append("\" xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.authenticationText != null && this.authenticationText.trim().length() > 0) {
                stanza.append(this.authenticationText);
            }
            stanza.append("</auth>");
            return stanza.toString();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLMechanism$Challenge.class */
    public static class Challenge extends Packet {
        private final String data;

        public Challenge(String data) {
            this.data = data;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder stanza = new StringBuilder();
            stanza.append("<challenge xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.data != null && this.data.trim().length() > 0) {
                stanza.append(this.data);
            }
            stanza.append("</challenge>");
            return stanza.toString();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLMechanism$Response.class */
    public class Response extends Packet {
        private final String authenticationText;

        public Response() {
            this.authenticationText = null;
        }

        public Response(String authenticationText) {
            if (authenticationText == null || authenticationText.trim().length() == 0) {
                this.authenticationText = null;
            } else {
                this.authenticationText = authenticationText;
            }
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder stanza = new StringBuilder();
            stanza.append("<response xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.authenticationText != null) {
                stanza.append(this.authenticationText);
            } else {
                stanza.append("=");
            }
            stanza.append("</response>");
            return stanza.toString();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLMechanism$Success.class */
    public static class Success extends Packet {
        private final String data;

        public Success(String data) {
            this.data = data;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder stanza = new StringBuilder();
            stanza.append("<success xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.data != null && this.data.trim().length() > 0) {
                stanza.append(this.data);
            }
            stanza.append("</success>");
            return stanza.toString();
        }
    }

    /* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLMechanism$Failure.class */
    public static class Failure extends Packet {
        private final String condition;

        public Failure(String condition) {
            this.condition = condition;
        }

        public String getCondition() {
            return this.condition;
        }

        @Override // org.jivesoftware.smack.packet.Packet
        public String toXML() {
            StringBuilder stanza = new StringBuilder();
            stanza.append("<failure xmlns=\"urn:ietf:params:xml:ns:xmpp-sasl\">");
            if (this.condition != null && this.condition.trim().length() > 0) {
                stanza.append("<").append(this.condition).append("/>");
            }
            stanza.append("</failure>");
            return stanza.toString();
        }
    }
}
