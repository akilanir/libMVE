package org.jivesoftware.smack.sasl;

import java.io.IOException;
import javax.security.auth.callback.CallbackHandler;
import org.jivesoftware.smack.SASLAuthentication;
import org.jivesoftware.smack.sasl.SASLMechanism;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLAnonymous.class */
public class SASLAnonymous extends SASLMechanism {
    public SASLAnonymous(SASLAuthentication saslAuthentication) {
        super(saslAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "ANONYMOUS";
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String username, String host, CallbackHandler cbh) throws IOException {
        authenticate();
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void authenticate(String username, String host, String password) throws IOException {
        authenticate();
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected void authenticate() throws IOException {
        getSASLAuthentication().send(new SASLMechanism.AuthMechanism(this, getName(), null));
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    public void challengeReceived(String challenge) throws IOException {
        getSASLAuthentication().send(new SASLMechanism.Response(this));
    }
}
