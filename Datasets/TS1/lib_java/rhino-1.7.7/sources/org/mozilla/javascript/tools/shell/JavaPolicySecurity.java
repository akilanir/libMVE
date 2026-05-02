package org.mozilla.javascript.tools.shell;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.AccessControlContext;
import java.security.AccessControlException;
import java.security.AccessController;
import java.security.CodeSource;
import java.security.Permission;
import java.security.PermissionCollection;
import java.security.Policy;
import java.security.PrivilegedAction;
import java.security.ProtectionDomain;
import java.security.cert.Certificate;
import java.util.Enumeration;
import org.mozilla.javascript.Callable;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.GeneratedClassLoader;
import org.mozilla.javascript.Scriptable;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/JavaPolicySecurity.class */
public class JavaPolicySecurity extends SecurityProxy {
    @Override // org.mozilla.javascript.SecurityController
    public Class<?> getStaticSecurityDomainClassInternal() {
        return ProtectionDomain.class;
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/JavaPolicySecurity$Loader.class */
    private static class Loader extends ClassLoader implements GeneratedClassLoader {
        private ProtectionDomain domain;

        Loader(ClassLoader parent, ProtectionDomain domain) {
            super(parent != null ? parent : getSystemClassLoader());
            this.domain = domain;
        }

        @Override // org.mozilla.javascript.GeneratedClassLoader
        public Class<?> defineClass(String name, byte[] data) {
            return super.defineClass(name, data, 0, data.length, this.domain);
        }

        @Override // org.mozilla.javascript.GeneratedClassLoader
        public void linkClass(Class<?> cl) {
            resolveClass(cl);
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/JavaPolicySecurity$ContextPermissions.class */
    private static class ContextPermissions extends PermissionCollection {
        static final long serialVersionUID = -1721494496320750721L;
        AccessControlContext _context = AccessController.getContext();
        PermissionCollection _statisPermissions;

        ContextPermissions(ProtectionDomain staticDomain) {
            if (staticDomain != null) {
                this._statisPermissions = staticDomain.getPermissions();
            }
            setReadOnly();
        }

        @Override // java.security.PermissionCollection
        public void add(Permission permission) {
            throw new RuntimeException("NOT IMPLEMENTED");
        }

        @Override // java.security.PermissionCollection
        public boolean implies(Permission permission) {
            if (this._statisPermissions != null && !this._statisPermissions.implies(permission)) {
                return false;
            }
            try {
                this._context.checkPermission(permission);
                return true;
            } catch (AccessControlException e) {
                return false;
            }
        }

        @Override // java.security.PermissionCollection
        public Enumeration<Permission> elements() {
            return new Enumeration<Permission>() { // from class: org.mozilla.javascript.tools.shell.JavaPolicySecurity.ContextPermissions.1
                @Override // java.util.Enumeration
                public boolean hasMoreElements() {
                    return false;
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // java.util.Enumeration
                public Permission nextElement() {
                    return null;
                }
            };
        }

        public String toString() {
            return getClass().getName() + '@' + Integer.toHexString(System.identityHashCode(this)) + " (context=" + this._context + ", static_permitions=" + this._statisPermissions + ')';
        }
    }

    public JavaPolicySecurity() {
        new CodeSource((URL) null, (Certificate[]) null);
    }

    @Override // org.mozilla.javascript.tools.shell.SecurityProxy
    protected void callProcessFileSecure(final Context cx, final Scriptable scope, final String filename) {
        AccessController.doPrivileged(new PrivilegedAction<Object>() { // from class: org.mozilla.javascript.tools.shell.JavaPolicySecurity.1
            @Override // java.security.PrivilegedAction
            public Object run() {
                URL url = JavaPolicySecurity.this.getUrlObj(filename);
                ProtectionDomain staticDomain = JavaPolicySecurity.this.getUrlDomain(url);
                try {
                    Main.processFileSecure(cx, scope, url.toExternalForm(), staticDomain);
                    return null;
                } catch (IOException ioex) {
                    throw new RuntimeException(ioex);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public URL getUrlObj(String url) {
        URL urlObj;
        try {
            urlObj = new URL(url);
        } catch (MalformedURLException e) {
            String curDir = System.getProperty("user.dir").replace('\\', '/');
            if (!curDir.endsWith("/")) {
                curDir = curDir + '/';
            }
            try {
                URL curDirURL = new URL("file:" + curDir);
                urlObj = new URL(curDirURL, url);
            } catch (MalformedURLException ex2) {
                throw new RuntimeException("Can not construct file URL for '" + url + "':" + ex2.getMessage());
            }
        }
        return urlObj;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ProtectionDomain getUrlDomain(URL url) {
        CodeSource cs = new CodeSource(url, (Certificate[]) null);
        PermissionCollection pc = Policy.getPolicy().getPermissions(cs);
        return new ProtectionDomain(cs, pc);
    }

    @Override // org.mozilla.javascript.SecurityController
    public GeneratedClassLoader createClassLoader(final ClassLoader parentLoader, Object securityDomain) {
        final ProtectionDomain domain = (ProtectionDomain) securityDomain;
        return (GeneratedClassLoader) AccessController.doPrivileged(new PrivilegedAction<Loader>() { // from class: org.mozilla.javascript.tools.shell.JavaPolicySecurity.2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.security.PrivilegedAction
            public Loader run() {
                return new Loader(parentLoader, domain);
            }
        });
    }

    @Override // org.mozilla.javascript.SecurityController
    public Object getDynamicSecurityDomain(Object securityDomain) {
        ProtectionDomain staticDomain = (ProtectionDomain) securityDomain;
        return getDynamicDomain(staticDomain);
    }

    private ProtectionDomain getDynamicDomain(ProtectionDomain staticDomain) {
        ContextPermissions p = new ContextPermissions(staticDomain);
        ProtectionDomain contextDomain = new ProtectionDomain(null, p);
        return contextDomain;
    }

    @Override // org.mozilla.javascript.SecurityController
    public Object callWithDomain(Object securityDomain, final Context cx, final Callable callable, final Scriptable scope, final Scriptable thisObj, final Object[] args) {
        ProtectionDomain staticDomain = (ProtectionDomain) securityDomain;
        ProtectionDomain dynamicDomain = getDynamicDomain(staticDomain);
        ProtectionDomain[] tmp = {dynamicDomain};
        AccessControlContext restricted = new AccessControlContext(tmp);
        PrivilegedAction<Object> action = new PrivilegedAction<Object>() { // from class: org.mozilla.javascript.tools.shell.JavaPolicySecurity.3
            @Override // java.security.PrivilegedAction
            public Object run() {
                return callable.call(cx, scope, thisObj, args);
            }
        };
        return AccessController.doPrivileged(action, restricted);
    }
}
