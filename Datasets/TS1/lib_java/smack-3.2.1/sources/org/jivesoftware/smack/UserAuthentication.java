package org.jivesoftware.smack;

import javax.security.auth.callback.CallbackHandler;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/UserAuthentication.class */
interface UserAuthentication {
    String authenticate(String str, String str2, CallbackHandler callbackHandler) throws XMPPException;

    String authenticate(String str, String str2, String str3) throws XMPPException;

    String authenticateAnonymously() throws XMPPException;
}
