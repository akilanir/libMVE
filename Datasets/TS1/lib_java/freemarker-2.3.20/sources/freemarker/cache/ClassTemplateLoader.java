package freemarker.cache;

import java.net.URL;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/ClassTemplateLoader.class */
public class ClassTemplateLoader extends URLTemplateLoader {
    private Class loaderClass;
    private String path;

    public ClassTemplateLoader() {
        setFields(getClass(), "/");
    }

    public ClassTemplateLoader(Class loaderClass) {
        setFields(loaderClass, "");
    }

    public ClassTemplateLoader(Class loaderClass, String path) {
        setFields(loaderClass, path);
    }

    @Override // freemarker.cache.URLTemplateLoader
    protected URL getURL(String name) {
        String fullPath = new StringBuffer().append(this.path).append(name).toString();
        if (this.path.equals("/") && !isSchemeless(fullPath)) {
            return null;
        }
        return this.loaderClass.getResource(fullPath);
    }

    private static boolean isSchemeless(String fullPath) {
        char c;
        int i = 0;
        int ln = fullPath.length();
        if (0 < ln && fullPath.charAt(0) == '/') {
            i = 0 + 1;
        }
        while (i < ln && (c = fullPath.charAt(i)) != '/') {
            if (c == ':') {
                return false;
            }
            i++;
        }
        return true;
    }

    private void setFields(Class loaderClass, String path) {
        if (loaderClass == null) {
            throw new IllegalArgumentException("loaderClass == null");
        }
        if (path == null) {
            throw new IllegalArgumentException("path == null");
        }
        this.loaderClass = loaderClass;
        this.path = canonicalizePrefix(path);
    }
}
