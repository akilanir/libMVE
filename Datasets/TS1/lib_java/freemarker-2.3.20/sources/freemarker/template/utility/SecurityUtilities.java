package freemarker.template.utility;

import freemarker.log.Logger;
import java.security.AccessControlException;
import java.security.AccessController;
import java.security.PrivilegedAction;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/SecurityUtilities.class */
public class SecurityUtilities {
    private static final Logger logger = Logger.getLogger("freemarker.security");

    private SecurityUtilities() {
    }

    public static String getSystemProperty(String key) {
        return (String) AccessController.doPrivileged(new PrivilegedAction(key) { // from class: freemarker.template.utility.SecurityUtilities.1
            private final String val$key;

            {
                this.val$key = key;
            }

            @Override // java.security.PrivilegedAction
            public Object run() {
                return System.getProperty(this.val$key);
            }
        });
    }

    public static String getSystemProperty(String key, String defValue) {
        try {
            return (String) AccessController.doPrivileged(new PrivilegedAction(key, defValue) { // from class: freemarker.template.utility.SecurityUtilities.2
                private final String val$key;
                private final String val$defValue;

                {
                    this.val$key = key;
                    this.val$defValue = defValue;
                }

                @Override // java.security.PrivilegedAction
                public Object run() {
                    return System.getProperty(this.val$key, this.val$defValue);
                }
            });
        } catch (AccessControlException e) {
            logger.warn(new StringBuffer().append("Insufficient permissions to read system property ").append(StringUtil.jQuoteNoXSS(key)).append(", using default value ").append(StringUtil.jQuoteNoXSS(defValue)).toString());
            return defValue;
        }
    }

    public static Integer getSystemProperty(String key, int defValue) {
        try {
            return (Integer) AccessController.doPrivileged(new PrivilegedAction(key, defValue) { // from class: freemarker.template.utility.SecurityUtilities.3
                private final String val$key;
                private final int val$defValue;

                {
                    this.val$key = key;
                    this.val$defValue = defValue;
                }

                @Override // java.security.PrivilegedAction
                public Object run() {
                    return Integer.getInteger(this.val$key, this.val$defValue);
                }
            });
        } catch (AccessControlException e) {
            logger.warn(new StringBuffer().append("Insufficient permissions to read system property ").append(StringUtil.jQuote(key)).append(", using default value ").append(defValue).toString());
            return new Integer(defValue);
        }
    }
}
