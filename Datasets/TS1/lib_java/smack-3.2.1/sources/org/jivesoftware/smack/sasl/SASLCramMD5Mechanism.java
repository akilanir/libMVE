package org.jivesoftware.smack.sasl;

import org.jivesoftware.smack.SASLAuthentication;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLCramMD5Mechanism.class */
public class SASLCramMD5Mechanism extends SASLMechanism {
    public SASLCramMD5Mechanism(SASLAuthentication saslAuthentication) {
        super(saslAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "CRAM-MD5";
    }
}
