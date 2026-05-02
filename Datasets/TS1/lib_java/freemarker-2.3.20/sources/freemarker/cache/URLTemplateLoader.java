package freemarker.cache;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/URLTemplateLoader.class */
public abstract class URLTemplateLoader implements TemplateLoader {
    protected abstract URL getURL(String str);

    @Override // freemarker.cache.TemplateLoader
    public Object findTemplateSource(String name) throws IOException {
        URL url = getURL(name);
        if (url == null) {
            return null;
        }
        return new URLTemplateSource(url);
    }

    @Override // freemarker.cache.TemplateLoader
    public long getLastModified(Object templateSource) {
        return ((URLTemplateSource) templateSource).lastModified();
    }

    @Override // freemarker.cache.TemplateLoader
    public Reader getReader(Object templateSource, String encoding) throws IOException {
        return new InputStreamReader(((URLTemplateSource) templateSource).getInputStream(), encoding);
    }

    @Override // freemarker.cache.TemplateLoader
    public void closeTemplateSource(Object templateSource) throws IOException {
        ((URLTemplateSource) templateSource).close();
    }

    protected static String canonicalizePrefix(String prefix) {
        String prefix2 = prefix.replace('\\', '/');
        if (prefix2.length() > 0 && !prefix2.endsWith("/")) {
            prefix2 = new StringBuffer().append(prefix2).append("/").toString();
        }
        return prefix2;
    }
}
