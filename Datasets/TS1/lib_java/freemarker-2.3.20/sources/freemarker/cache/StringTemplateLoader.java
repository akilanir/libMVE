package freemarker.cache;

import java.io.Reader;
import java.io.StringReader;
import java.util.HashMap;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/StringTemplateLoader.class */
public class StringTemplateLoader implements TemplateLoader {
    private final Map templates = new HashMap();

    public void putTemplate(String name, String templateSource) {
        putTemplate(name, templateSource, System.currentTimeMillis());
    }

    public void putTemplate(String name, String templateSource, long lastModified) {
        this.templates.put(name, new StringTemplateSource(name, templateSource, lastModified));
    }

    @Override // freemarker.cache.TemplateLoader
    public void closeTemplateSource(Object templateSource) {
    }

    @Override // freemarker.cache.TemplateLoader
    public Object findTemplateSource(String name) {
        return this.templates.get(name);
    }

    @Override // freemarker.cache.TemplateLoader
    public long getLastModified(Object templateSource) {
        return ((StringTemplateSource) templateSource).lastModified;
    }

    @Override // freemarker.cache.TemplateLoader
    public Reader getReader(Object templateSource, String encoding) {
        return new StringReader(((StringTemplateSource) templateSource).source);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/cache/StringTemplateLoader$StringTemplateSource.class */
    private static class StringTemplateSource {
        private final String name;
        private final String source;
        private final long lastModified;

        StringTemplateSource(String name, String source, long lastModified) {
            if (name == null) {
                throw new IllegalArgumentException("name == null");
            }
            if (source == null) {
                throw new IllegalArgumentException("source == null");
            }
            if (lastModified < -1) {
                throw new IllegalArgumentException("lastModified < -1L");
            }
            this.name = name;
            this.source = source;
            this.lastModified = lastModified;
        }

        public boolean equals(Object obj) {
            if (obj instanceof StringTemplateSource) {
                return this.name.equals(((StringTemplateSource) obj).name);
            }
            return false;
        }

        public int hashCode() {
            return this.name.hashCode();
        }
    }
}
