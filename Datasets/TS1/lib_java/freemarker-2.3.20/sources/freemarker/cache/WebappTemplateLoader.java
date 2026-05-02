package freemarker.cache;

import freemarker.log.Logger;
import freemarker.template.utility.StringUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.MalformedURLException;
import java.net.URL;
import javax.servlet.ServletContext;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/WebappTemplateLoader.class */
public class WebappTemplateLoader implements TemplateLoader {
    private static final Logger logger = Logger.getLogger("freemarker.cache");
    private final ServletContext servletContext;
    private final String path;

    public WebappTemplateLoader(ServletContext servletContext) {
        this(servletContext, "/");
    }

    public WebappTemplateLoader(ServletContext servletContext, String path) {
        if (servletContext == null) {
            throw new IllegalArgumentException("servletContext == null");
        }
        if (path == null) {
            throw new IllegalArgumentException("path == null");
        }
        String path2 = path.replace('\\', '/');
        path2 = path2.endsWith("/") ? path2 : new StringBuffer().append(path2).append("/").toString();
        this.path = path2.startsWith("/") ? path2 : new StringBuffer().append("/").append(path2).toString();
        this.servletContext = servletContext;
    }

    @Override // freemarker.cache.TemplateLoader
    public Object findTemplateSource(String name) throws IOException {
        String fullPath = new StringBuffer().append(this.path).append(name).toString();
        try {
            String realPath = this.servletContext.getRealPath(fullPath);
            if (realPath != null) {
                File file = new File(realPath);
                if (!file.isFile()) {
                    return null;
                }
                if (file.canRead()) {
                    return file;
                }
            }
        } catch (SecurityException e) {
        }
        try {
            URL url = this.servletContext.getResource(fullPath);
            if (url == null) {
                return null;
            }
            return new URLTemplateSource(url);
        } catch (MalformedURLException e2) {
            logger.warn(new StringBuffer().append("Could not retrieve resource ").append(StringUtil.jQuoteNoXSS(fullPath)).toString(), e2);
            return null;
        }
    }

    @Override // freemarker.cache.TemplateLoader
    public long getLastModified(Object templateSource) {
        if (templateSource instanceof File) {
            return ((File) templateSource).lastModified();
        }
        return ((URLTemplateSource) templateSource).lastModified();
    }

    @Override // freemarker.cache.TemplateLoader
    public Reader getReader(Object templateSource, String encoding) throws IOException {
        if (templateSource instanceof File) {
            return new InputStreamReader(new FileInputStream((File) templateSource), encoding);
        }
        return new InputStreamReader(((URLTemplateSource) templateSource).getInputStream(), encoding);
    }

    @Override // freemarker.cache.TemplateLoader
    public void closeTemplateSource(Object templateSource) throws IOException {
        if (!(templateSource instanceof File)) {
            ((URLTemplateSource) templateSource).close();
        }
    }
}
