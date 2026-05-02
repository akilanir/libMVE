package org.jivesoftware.smack.sasl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.security.auth.callback.CallbackHandler;
import javax.security.sasl.Sasl;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.XMPPException;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLGSSAPIMechanism.class */
public class SASLGSSAPIMechanism extends SASLMechanism {
    public SASLGSSAPIMechanism(SASLAuthentication saslAuthentication) {
        super(saslAuthentication);
        System.setProperty("javax.security.auth.useSubjectCredsOnly", "false");
        System.setProperty("java.security.auth.login.config", "gss.conf");
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "GSSAPI";
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String username, String host, CallbackHandler cbh) throws IOException, XMPPException {
        String[] mechanisms = {getName()};
        Map props = new HashMap();
        props.put("javax.security.sasl.server.authentication", "TRUE");
        this.sc = Sasl.createSaslClient(mechanisms, username, "xmpp", host, props, cbh);
        authenticate();
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String username, String host, String password) throws IOException, XMPPException {
        String[] mechanisms = {getName()};
        Map props = new HashMap();
        props.put("javax.security.sasl.server.authentication", "TRUE");
        this.sc = Sasl.createSaslClient(mechanisms, username, "xmpp", host, props, this);
        authenticate();
    }
}
