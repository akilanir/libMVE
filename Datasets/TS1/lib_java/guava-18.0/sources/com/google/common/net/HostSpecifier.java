package com.google.common.net;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.net.InetAddress;
import java.text.ParseException;
import javax.annotation.Nullable;

@Beta
/* loaded from: guava-18.0.jar:com/google/common/net/HostSpecifier.class */
public final class HostSpecifier {
    private final String canonicalForm;

    private HostSpecifier(String canonicalForm) {
        this.canonicalForm = canonicalForm;
    }

    public static HostSpecifier fromValid(String specifier) {
        String str;
        HostAndPort parsedHost = HostAndPort.fromString(specifier);
        Preconditions.checkArgument(!parsedHost.hasPort());
        String host = parsedHost.getHostText();
        InetAddress addr = null;
        try {
            addr = InetAddresses.forString(host);
        } catch (IllegalArgumentException e) {
        }
        if (addr != null) {
            return new HostSpecifier(InetAddresses.toUriString(addr));
        }
        InternetDomainName domain = InternetDomainName.from(host);
        if (domain.hasPublicSuffix()) {
            return new HostSpecifier(domain.toString());
        }
        String valueOf = String.valueOf(host);
        if (valueOf.length() != 0) {
            str = "Domain name does not have a recognized public suffix: ".concat(valueOf);
        } else {
            str = r3;
            String str2 = new String("Domain name does not have a recognized public suffix: ");
        }
        throw new IllegalArgumentException(str);
    }

    public static HostSpecifier from(String specifier) throws ParseException {
        String str;
        try {
            return fromValid(specifier);
        } catch (IllegalArgumentException e) {
            String valueOf = String.valueOf(specifier);
            if (valueOf.length() != 0) {
                str = "Invalid host specifier: ".concat(valueOf);
            } else {
                str = r3;
                String str2 = new String("Invalid host specifier: ");
            }
            ParseException parseException = new ParseException(str, 0);
            parseException.initCause(e);
            throw parseException;
        }
    }

    public static boolean isValid(String specifier) {
        try {
            fromValid(specifier);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (other instanceof HostSpecifier) {
            HostSpecifier that = (HostSpecifier) other;
            return this.canonicalForm.equals(that.canonicalForm);
        }
        return false;
    }

    public int hashCode() {
        return this.canonicalForm.hashCode();
    }

    public String toString() {
        return this.canonicalForm;
    }
}
