package freemarker.cache;

import java.io.IOException;
import java.io.Reader;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/MultiTemplateLoader.class */
public class MultiTemplateLoader implements StatefulTemplateLoader {
    private final TemplateLoader[] loaders;
    private final Map lastLoaderForName = Collections.synchronizedMap(new HashMap());

    public MultiTemplateLoader(TemplateLoader[] loaders) {
        this.loaders = (TemplateLoader[]) loaders.clone();
    }

    @Override // freemarker.cache.TemplateLoader
    public Object findTemplateSource(String name) throws IOException {
        Object source;
        TemplateLoader lastLoader = (TemplateLoader) this.lastLoaderForName.get(name);
        if (lastLoader != null && (source = lastLoader.findTemplateSource(name)) != null) {
            return new MultiSource(source, lastLoader);
        }
        for (int i = 0; i < this.loaders.length; i++) {
            TemplateLoader loader = this.loaders[i];
            Object source2 = loader.findTemplateSource(name);
            if (source2 != null) {
                this.lastLoaderForName.put(name, loader);
                return new MultiSource(source2, loader);
            }
        }
        this.lastLoaderForName.remove(name);
        return null;
    }

    @Override // freemarker.cache.TemplateLoader
    public long getLastModified(Object templateSource) {
        return ((MultiSource) templateSource).getLastModified();
    }

    @Override // freemarker.cache.TemplateLoader
    public Reader getReader(Object templateSource, String encoding) throws IOException {
        return ((MultiSource) templateSource).getReader(encoding);
    }

    @Override // freemarker.cache.TemplateLoader
    public void closeTemplateSource(Object templateSource) throws IOException {
        ((MultiSource) templateSource).close();
    }

    @Override // freemarker.cache.StatefulTemplateLoader
    public void resetState() {
        this.lastLoaderForName.clear();
        for (int i = 0; i < this.loaders.length; i++) {
            TemplateLoader loader = this.loaders[i];
            if (loader instanceof StatefulTemplateLoader) {
                ((StatefulTemplateLoader) loader).resetState();
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/cache/MultiTemplateLoader$MultiSource.class */
    private static final class MultiSource {
        private final Object source;
        private final TemplateLoader loader;

        MultiSource(Object source, TemplateLoader loader) {
            this.source = source;
            this.loader = loader;
        }

        long getLastModified() {
            return this.loader.getLastModified(this.source);
        }

        Reader getReader(String encoding) throws IOException {
            return this.loader.getReader(this.source, encoding);
        }

        void close() throws IOException {
            this.loader.closeTemplateSource(this.source);
        }

        public boolean equals(Object o) {
            if (o instanceof MultiSource) {
                MultiSource m = (MultiSource) o;
                return m.loader.equals(this.loader) && m.source.equals(this.source);
            }
            return false;
        }

        public int hashCode() {
            return this.loader.hashCode() + (31 * this.source.hashCode());
        }

        public String toString() {
            return this.source.toString();
        }
    }
}
