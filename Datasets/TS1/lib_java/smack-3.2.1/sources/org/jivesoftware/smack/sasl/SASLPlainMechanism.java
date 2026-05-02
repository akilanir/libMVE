package org.jivesoftware.smack.sasl;

import org.jivesoftware.smack.SASLAuthentication;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLPlainMechanism.class */
public class SASLPlainMechanism extends SASLMechanism {
    public SASLPlainMechanism(SASLAuthentication saslAuthentication) {
        super(saslAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "PLAIN";
    }
}
