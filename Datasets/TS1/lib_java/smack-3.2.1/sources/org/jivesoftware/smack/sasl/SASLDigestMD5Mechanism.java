package org.jivesoftware.smack.sasl;

import org.jivesoftware.smack.SASLAuthentication;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/sasl/SASLDigestMD5Mechanism.class */
public class SASLDigestMD5Mechanism extends SASLMechanism {
    public SASLDigestMD5Mechanism(SASLAuthentication saslAuthentication) {
        super(saslAuthentication);
    }

    @Override // org.jivesoftware.smack.sasl.SASLMechanism
    protected String getName() {
        return "DIGEST-MD5";
    }
}
