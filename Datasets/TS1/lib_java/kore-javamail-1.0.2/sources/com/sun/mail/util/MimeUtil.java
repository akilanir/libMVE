package com.sun.mail.util;

import java.lang.reflect.Method;
import java.security.AccessController;
import java.security.PrivilegedAction;
import korex.mail.internet.MimePart;

/* loaded from: kore-javamail-1.0.2.jar:com/sun/mail/util/MimeUtil.class */
public class MimeUtil {
    private static final Method cleanContentType;

    static {
        Method meth = null;
        try {
            String cth = System.getProperty("mail.mime.contenttypehandler");
            if (cth != null) {
                ClassLoader cl = getContextClassLoader();
                Class clsHandler = null;
                if (cl != null) {
                    try {
                        clsHandler = Class.forName(cth, false, cl);
                    } catch (ClassNotFoundException e) {
                    }
                }
                if (clsHandler == null) {
                    clsHandler = Class.forName(cth);
                }
                meth = clsHandler.getMethod("cleanContentType", MimePart.class, String.class);
            }
            cleanContentType = meth;
        } catch (ClassNotFoundException e2) {
            cleanContentType = meth;
        } catch (NoSuchMethodException e3) {
            cleanContentType = meth;
        } catch (RuntimeException e4) {
            cleanContentType = meth;
        } catch (Throwable th) {
            cleanContentType = meth;
            throw th;
        }
    }

    private MimeUtil() {
    }

    public static String cleanContentType(MimePart mp, String contentType) {
        if (cleanContentType != null) {
            try {
                return (String) cleanContentType.invoke(null, mp, contentType);
            } catch (Exception e) {
                return contentType;
            }
        }
        return contentType;
    }

    private static ClassLoader getContextClassLoader() {
        return (ClassLoader) AccessController.doPrivileged(new PrivilegedAction() { // from class: com.sun.mail.util.MimeUtil.1
            @Override // java.security.PrivilegedAction
            public Object run() {
                ClassLoader cl = null;
                try {
                    cl = Thread.currentThread().getContextClassLoader();
                } catch (SecurityException e) {
                }
                return cl;
            }
        });
    }
}
