package okhttp3;

import okhttp3.internal.Util;

/* loaded from: okhttp-3.2.0.jar:okhttp3/Challenge.class */
public final class Challenge {
    private final String scheme;
    private final String realm;

    public Challenge(String scheme, String realm) {
        this.scheme = scheme;
        this.realm = realm;
    }

    public String scheme() {
        return this.scheme;
    }

    public String realm() {
        return this.realm;
    }

    public boolean equals(Object o) {
        return (o instanceof Challenge) && Util.equal(this.scheme, ((Challenge) o).scheme) && Util.equal(this.realm, ((Challenge) o).realm);
    }

    public int hashCode() {
        int result = (31 * 29) + (this.realm != null ? this.realm.hashCode() : 0);
        return (31 * result) + (this.scheme != null ? this.scheme.hashCode() : 0);
    }

    public String toString() {
        return this.scheme + " realm=\"" + this.realm + "\"";
    }
}
