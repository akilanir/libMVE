package cz.msebera.android.httpclient.auth;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;
import cz.msebera.android.httpclient.util.LangUtils;
import java.io.Serializable;
import java.security.Principal;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/auth/BasicUserPrincipal.class */
public final class BasicUserPrincipal implements Principal, Serializable {
    private static final long serialVersionUID = -2266305184969850467L;
    private final String username;

    public BasicUserPrincipal(String username) {
        Args.notNull(username, "User name");
        this.username = username;
    }

    @Override // java.security.Principal
    public String getName() {
        return this.username;
    }

    @Override // java.security.Principal
    public int hashCode() {
        int hash = LangUtils.hashCode(17, this.username);
        return hash;
    }

    @Override // java.security.Principal
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o instanceof BasicUserPrincipal) {
            BasicUserPrincipal that = (BasicUserPrincipal) o;
            if (LangUtils.equals(this.username, that.username)) {
                return true;
            }
            return false;
        }
        return false;
    }

    @Override // java.security.Principal
    public String toString() {
        return "[principal: " + this.username + "]";
    }
}
