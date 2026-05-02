package org.spongycastle.util;

import java.security.AccessControlException;
import java.security.AccessController;
import java.security.PrivilegedAction;

/* loaded from: core-1.54.0.0.jar:org/spongycastle/util/Properties.class */
public class Properties {
    public static boolean isOverrideSet(final String propertyName) {
        try {
            return "true".equals(AccessController.doPrivileged(new PrivilegedAction() { // from class: org.spongycastle.util.Properties.1
                @Override // java.security.PrivilegedAction
                public Object run() {
                    String value = System.getProperty(propertyName);
                    if (value == null) {
                        return null;
                    }
                    return Strings.toLowerCase(value);
                }
            }));
        } catch (AccessControlException e) {
            return false;
        }
    }
}
