package freemarker.cache;

import java.io.IOException;
import java.io.Reader;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/TemplateLoader.class */
public interface TemplateLoader {
    Object findTemplateSource(String str) throws IOException;

    long getLastModified(Object obj);

    Reader getReader(Object obj, String str) throws IOException;

    void closeTemplateSource(Object obj) throws IOException;
}
