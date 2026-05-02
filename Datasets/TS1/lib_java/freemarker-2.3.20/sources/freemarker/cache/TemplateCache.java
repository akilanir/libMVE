package freemarker.cache;

import freemarker.core.Environment;
import freemarker.debug.DebugModel;
import freemarker.log.Logger;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.utility.StringUtil;
import freemarker.template.utility.UndeclaredThrowableException;
import java.io.IOException;
import java.io.Reader;
import java.io.Serializable;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

/* loaded from: freemarker-2.3.20.jar:freemarker/cache/TemplateCache.class */
public class TemplateCache {
    private static final String ASTERISKSTR = "*";
    private static final String LOCALE_SEPARATOR = "_";
    private static final char ASTERISK = '*';
    private static final String CURRENT_DIR_PATH_PREFIX = "./";
    private static final String CURRENT_DIR_PATH = "/./";
    private static final String PARENT_DIR_PATH_PREFIX = "../";
    private static final String PARENT_DIR_PATH = "/../";
    private static final char SLASH = '/';
    private final TemplateLoader templateLoader;
    private final CacheStorage storage;
    private final boolean isStorageConcurrent;
    private long delay;
    private boolean localizedLookup;
    private Configuration config;
    static Class class$java$lang$Throwable;
    private static final Logger logger = Logger.getLogger("freemarker.cache");
    private static final Method INIT_CAUSE = getInitCauseMethod();

    /* renamed from: freemarker.cache.TemplateCache$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/cache/TemplateCache$1.class */
    static class AnonymousClass1 {
    }

    public TemplateCache() {
        this(createDefaultTemplateLoader());
    }

    private static TemplateLoader createDefaultTemplateLoader() {
        try {
            return new FileTemplateLoader();
        } catch (Exception e) {
            logger.warn("Could not create a file template loader for current directory", e);
            return null;
        }
    }

    public TemplateCache(TemplateLoader templateLoader) {
        this(templateLoader, new SoftCacheStorage());
    }

    public TemplateCache(TemplateLoader templateLoader, CacheStorage cacheStorage) {
        this.delay = 5000L;
        this.localizedLookup = true;
        this.templateLoader = templateLoader;
        this.storage = cacheStorage;
        if (cacheStorage == null) {
            throw new IllegalArgumentException("storage == null");
        }
        this.isStorageConcurrent = (cacheStorage instanceof ConcurrentCacheStorage) && ((ConcurrentCacheStorage) cacheStorage).isConcurrent();
    }

    public void setConfiguration(Configuration config) {
        this.config = config;
        clear();
    }

    public TemplateLoader getTemplateLoader() {
        return this.templateLoader;
    }

    public CacheStorage getCacheStorage() {
        return this.storage;
    }

    public Template getTemplate(String name, Locale locale, String encoding, boolean parseAsFTL) throws IOException {
        if (name == null) {
            throw new IllegalArgumentException("Argument \"name\" can't be null");
        }
        if (locale == null) {
            throw new IllegalArgumentException("Argument \"locale\" can't be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument \"encoding\" can't be null");
        }
        String name2 = normalizeName(name);
        if (name2 == null) {
            return null;
        }
        Template result = null;
        if (this.templateLoader != null) {
            result = getTemplate(this.templateLoader, name2, locale, encoding, parseAsFTL);
        }
        return result;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private Template getTemplate(TemplateLoader loader, String name, Locale locale, String encoding, boolean parse) throws IOException {
        CachedTemplate cachedTemplate;
        CachedTemplate cachedTemplate2;
        Object newlyFoundSource;
        long lastModified;
        boolean debug = logger.isDebugEnabled();
        String debugName = debug ? buildDebugName(name, locale, encoding, parse) : null;
        TemplateKey tk = new TemplateKey(name, locale, encoding, parse);
        if (this.isStorageConcurrent) {
            cachedTemplate = (CachedTemplate) this.storage.get(tk);
        } else {
            synchronized (this.storage) {
                cachedTemplate = (CachedTemplate) this.storage.get(tk);
            }
        }
        long now = System.currentTimeMillis();
        try {
            try {
                if (cachedTemplate == null) {
                    if (debug) {
                        logger.debug(new StringBuffer().append("Could not find template in cache, creating new one; id=[").append(StringUtil.jQuoteNoXSS(tk.name)).append("[").append(StringUtil.jQuoteNoXSS(tk.locale)).append(",").append(tk.encoding).append(tk.parse ? ",parsed] " : ",unparsed] ").append("]").toString());
                    }
                    cachedTemplate2 = new CachedTemplate(null);
                    cachedTemplate2.lastChecked = now;
                    newlyFoundSource = findTemplateSource(name, locale);
                    if (newlyFoundSource == null) {
                        storeNegativeLookup(tk, cachedTemplate2, null);
                        if (newlyFoundSource != null) {
                            loader.closeTemplateSource(newlyFoundSource);
                        }
                        return null;
                    }
                    cachedTemplate2.source = newlyFoundSource;
                    lastModified = locale;
                    cachedTemplate2.lastModified = Long.MIN_VALUE;
                } else {
                    if (now - cachedTemplate.lastChecked < this.delay) {
                        if (debug) {
                            logger.debug(new StringBuffer().append(debugName).append(" cached copy not yet stale; using cached.").toString());
                        }
                        Object t = cachedTemplate.templateOrException;
                        if ((t instanceof Template) || t == null) {
                            Template template = (Template) t;
                            if (0 != 0) {
                                loader.closeTemplateSource(null);
                            }
                            return template;
                        }
                        if (t instanceof RuntimeException) {
                            throwLoadFailedException((RuntimeException) t);
                        } else if (t instanceof IOException) {
                            throwLoadFailedException((IOException) t);
                        }
                        throw new RuntimeException(new StringBuffer().append("t is ").append(t.getClass().getName()).toString());
                    }
                    cachedTemplate2 = cachedTemplate.cloneCachedTemplate();
                    cachedTemplate2.lastChecked = now;
                    newlyFoundSource = findTemplateSource(name, locale);
                    if (newlyFoundSource == null) {
                        if (debug) {
                            logger.debug(new StringBuffer().append(debugName).append(" no source found.").toString());
                        }
                        storeNegativeLookup(tk, cachedTemplate2, null);
                        if (newlyFoundSource != null) {
                            loader.closeTemplateSource(newlyFoundSource);
                        }
                        return null;
                    }
                    lastModified = loader.getLastModified(newlyFoundSource);
                    boolean lastModifiedNotChanged = lastModified == cachedTemplate2.lastModified;
                    boolean sourceEquals = newlyFoundSource.equals(cachedTemplate2.source);
                    if (lastModifiedNotChanged && sourceEquals) {
                        if (debug) {
                            logger.debug(new StringBuffer().append(debugName).append(" using cached since ").append(newlyFoundSource).append(" didn't change.").toString());
                        }
                        storeCached(tk, cachedTemplate2);
                        Template template2 = (Template) cachedTemplate2.templateOrException;
                        if (newlyFoundSource != null) {
                            loader.closeTemplateSource(newlyFoundSource);
                        }
                        return template2;
                    }
                    if (debug && !sourceEquals) {
                        logger.debug(new StringBuffer().append("Updating source, info for cause: sourceEquals=").append(sourceEquals).append(", newlyFoundSource=").append(StringUtil.jQuoteNoXSS(newlyFoundSource)).append(", cachedTemplate.source=").append(StringUtil.jQuoteNoXSS(cachedTemplate2.source)).toString());
                    }
                    if (debug && !lastModifiedNotChanged) {
                        logger.debug(new StringBuffer().append("Updating source, info for cause: lastModifiedNotChanged=").append(lastModifiedNotChanged).append(", cache lastModified=").append(cachedTemplate2.lastModified).append(" != file lastModified=").append(lastModified).toString());
                    }
                    cachedTemplate2.source = newlyFoundSource;
                }
                if (debug) {
                    logger.debug(new StringBuffer().append("Compiling FreeMarker template ").append(debugName).append(" from ").append(StringUtil.jQuoteNoXSS(newlyFoundSource)).toString());
                }
                Object source = cachedTemplate2.source;
                Template t2 = loadTemplate(loader, name, locale, encoding, parse, source);
                cachedTemplate2.templateOrException = t2;
                cachedTemplate2.lastModified = lastModified == Long.MIN_VALUE ? loader.getLastModified(source) : lastModified;
                storeCached(tk, cachedTemplate2);
                if (newlyFoundSource != null) {
                    loader.closeTemplateSource(newlyFoundSource);
                }
                return t2;
            } catch (IOException e) {
                if (0 == 0) {
                    storeNegativeLookup(tk, cachedTemplate, e);
                }
                throw e;
            } catch (RuntimeException e2) {
                if (cachedTemplate != null) {
                    storeNegativeLookup(tk, cachedTemplate, e2);
                }
                throw e2;
            }
        } catch (Throwable th) {
            if (0 != 0) {
                loader.closeTemplateSource(null);
            }
            throw th;
        }
    }

    private static final Method getInitCauseMethod() {
        Class cls;
        Class<?> cls2;
        try {
            if (class$java$lang$Throwable == null) {
                cls = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls;
            } else {
                cls = class$java$lang$Throwable;
            }
            Class<?>[] clsArr = new Class[1];
            if (class$java$lang$Throwable == null) {
                cls2 = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls2;
            } else {
                cls2 = class$java$lang$Throwable;
            }
            clsArr[0] = cls2;
            return cls.getMethod("initCause", clsArr);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private void throwLoadFailedException(Exception e) throws IOException {
        IOException ioe;
        if (INIT_CAUSE != null) {
            ioe = new IOException("There was an error loading the template on an earlier attempt; it's attached as a cause");
            try {
                INIT_CAUSE.invoke(ioe, e);
            } catch (RuntimeException ex) {
                throw ex;
            } catch (Exception ex2) {
                throw new UndeclaredThrowableException(ex2);
            }
        } else {
            ioe = new IOException(new StringBuffer().append("There was an error loading the template on an earlier attempt: ").append(e.getClass().getName()).append(": ").append(e.getMessage()).toString());
        }
        throw ioe;
    }

    private void storeNegativeLookup(TemplateKey tk, CachedTemplate cachedTemplate, Exception e) {
        cachedTemplate.templateOrException = e;
        cachedTemplate.source = null;
        cachedTemplate.lastModified = 0L;
        storeCached(tk, cachedTemplate);
    }

    private void storeCached(TemplateKey tk, CachedTemplate cachedTemplate) {
        if (this.isStorageConcurrent) {
            this.storage.put(tk, cachedTemplate);
            return;
        }
        synchronized (this.storage) {
            this.storage.put(tk, cachedTemplate);
        }
    }

    private Template loadTemplate(TemplateLoader loader, String name, Locale locale, String encoding, boolean parse, Object source) throws IOException {
        Template template;
        Reader reader = loader.getReader(source, encoding);
        try {
            if (parse) {
                try {
                    template = new Template(name, reader, this.config, encoding);
                } catch (Template.WrongEncodingException wee) {
                    encoding = wee.specifiedEncoding;
                    reader = loader.getReader(source, encoding);
                    template = new Template(name, reader, this.config, encoding);
                }
                template.setLocale(locale);
            } else {
                StringWriter sw = new StringWriter();
                char[] buf = new char[DebugModel.TYPE_TEMPLATE];
                while (true) {
                    int charsRead = reader.read(buf);
                    if (charsRead > 0) {
                        sw.write(buf, 0, charsRead);
                    } else if (charsRead == -1) {
                        break;
                    }
                }
                template = Template.getPlainTextTemplate(name, sw.toString(), this.config);
                template.setLocale(locale);
            }
            template.setEncoding(encoding);
            reader.close();
            return template;
        } catch (Throwable th) {
            reader.close();
            throw th;
        }
    }

    public synchronized long getDelay() {
        return this.delay;
    }

    public synchronized void setDelay(long delay) {
        this.delay = delay;
    }

    public synchronized boolean getLocalizedLookup() {
        return this.localizedLookup;
    }

    public synchronized void setLocalizedLookup(boolean localizedLookup) {
        this.localizedLookup = localizedLookup;
    }

    public void clear() {
        synchronized (this.storage) {
            this.storage.clear();
            if (this.templateLoader instanceof StatefulTemplateLoader) {
                ((StatefulTemplateLoader) this.templateLoader).resetState();
            }
        }
    }

    public void removeTemplate(String name, Locale locale, String encoding, boolean parse) throws IOException {
        if (name == null) {
            throw new IllegalArgumentException("Argument \"name\" can't be null");
        }
        if (locale == null) {
            throw new IllegalArgumentException("Argument \"locale\" can't be null");
        }
        if (encoding == null) {
            throw new IllegalArgumentException("Argument \"encoding\" can't be null");
        }
        String name2 = normalizeName(name);
        if (name2 != null && this.templateLoader != null) {
            boolean debug = logger.isDebugEnabled();
            String debugName = debug ? buildDebugName(name2, locale, encoding, parse) : null;
            TemplateKey tk = new TemplateKey(name2, locale, encoding, parse);
            if (this.isStorageConcurrent) {
                this.storage.remove(tk);
            } else {
                synchronized (this.storage) {
                    this.storage.remove(tk);
                }
            }
            logger.debug(new StringBuffer().append(debugName).append(" was removed from the cache, if it was there").toString());
        }
    }

    private String buildDebugName(String name, Locale locale, String encoding, boolean parse) {
        return new StringBuffer().append(StringUtil.jQuoteNoXSS(name)).append("[").append(StringUtil.jQuoteNoXSS(locale)).append(",").append(encoding).append(parse ? ",parsed] " : ",unparsed]").toString();
    }

    public static String getFullTemplatePath(Environment env, String currentTemplateDir, String targetTemplatePath) {
        if (!env.isClassicCompatible() && targetTemplatePath.indexOf("://") <= 0) {
            if (targetTemplatePath.length() > 0 && targetTemplatePath.charAt(0) == '/') {
                int protIndex = currentTemplateDir.indexOf("://");
                if (protIndex > 0) {
                    targetTemplatePath = new StringBuffer().append(currentTemplateDir.substring(0, protIndex + 2)).append(targetTemplatePath).toString();
                } else {
                    targetTemplatePath = targetTemplatePath.substring(1);
                }
            } else {
                targetTemplatePath = new StringBuffer().append(currentTemplateDir).append(targetTemplatePath).toString();
            }
        }
        return targetTemplatePath;
    }

    private Object findTemplateSource(String name, Locale locale) throws IOException {
        if (this.localizedLookup) {
            int lastDot = name.lastIndexOf(46);
            String prefix = lastDot == -1 ? name : name.substring(0, lastDot);
            String suffix = lastDot == -1 ? "" : name.substring(lastDot);
            String localeName = new StringBuffer().append(LOCALE_SEPARATOR).append(locale.toString()).toString();
            StringBuffer buf = new StringBuffer(name.length() + localeName.length());
            buf.append(prefix);
            while (true) {
                buf.setLength(prefix.length());
                String path = buf.append(localeName).append(suffix).toString();
                Object templateSource = acquireTemplateSource(path);
                if (templateSource != null) {
                    return templateSource;
                }
                int lastUnderscore = localeName.lastIndexOf(95);
                if (lastUnderscore != -1) {
                    localeName = localeName.substring(0, lastUnderscore);
                } else {
                    return null;
                }
            }
        } else {
            return acquireTemplateSource(name);
        }
    }

    private Object acquireTemplateSource(String path) throws IOException {
        int asterisk = path.indexOf(42);
        if (asterisk == -1) {
            return this.templateLoader.findTemplateSource(path);
        }
        StringTokenizer tok = new StringTokenizer(path, "/");
        int lastAsterisk = -1;
        List tokpath = new ArrayList();
        while (tok.hasMoreTokens()) {
            String pathToken = tok.nextToken();
            if (pathToken.equals(ASTERISKSTR)) {
                if (lastAsterisk != -1) {
                    tokpath.remove(lastAsterisk);
                }
                lastAsterisk = tokpath.size();
            }
            tokpath.add(pathToken);
        }
        if (lastAsterisk == -1) {
            return this.templateLoader.findTemplateSource(path);
        }
        String basePath = concatPath(tokpath, 0, lastAsterisk);
        String resourcePath = concatPath(tokpath, lastAsterisk + 1, tokpath.size());
        if (resourcePath.endsWith("/")) {
            resourcePath = resourcePath.substring(0, resourcePath.length() - 1);
        }
        StringBuffer buf = new StringBuffer(path.length()).append(basePath);
        int l = basePath.length();
        boolean debug = logger.isDebugEnabled();
        while (true) {
            String fullPath = buf.append(resourcePath).toString();
            if (debug) {
                logger.debug(new StringBuffer().append("Trying to find template source ").append(StringUtil.jQuoteNoXSS(fullPath)).toString());
            }
            Object templateSource = this.templateLoader.findTemplateSource(fullPath);
            if (templateSource != null) {
                return templateSource;
            }
            if (l == 0) {
                return null;
            }
            l = basePath.lastIndexOf(47, l - 2) + 1;
            buf.setLength(l);
        }
    }

    private String concatPath(List path, int from, int to) {
        StringBuffer buf = new StringBuffer((to - from) * 16);
        for (int i = from; i < to; i++) {
            buf.append(path.get(i)).append('/');
        }
        return buf.toString();
    }

    private static String normalizeName(String name) {
        if (name.indexOf(0) != -1) {
            return null;
        }
        while (true) {
            int parentDirPathLoc = name.indexOf(PARENT_DIR_PATH);
            if (parentDirPathLoc == 0) {
                return null;
            }
            if (parentDirPathLoc == -1) {
                if (name.startsWith(PARENT_DIR_PATH_PREFIX)) {
                    return null;
                }
                while (true) {
                    int currentDirPathLoc = name.indexOf(CURRENT_DIR_PATH);
                    if (currentDirPathLoc == -1) {
                        break;
                    }
                    name = new StringBuffer().append(name.substring(0, currentDirPathLoc)).append(name.substring((currentDirPathLoc + CURRENT_DIR_PATH.length()) - 1)).toString();
                }
                if (name.startsWith(CURRENT_DIR_PATH_PREFIX)) {
                    name = name.substring(CURRENT_DIR_PATH_PREFIX.length());
                }
                if (name.length() > 1 && name.charAt(0) == '/') {
                    name = name.substring(1);
                }
                return name;
            }
            int previousSlashLoc = name.lastIndexOf(47, parentDirPathLoc - 1);
            name = new StringBuffer().append(name.substring(0, previousSlashLoc + 1)).append(name.substring(parentDirPathLoc + PARENT_DIR_PATH.length())).toString();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/cache/TemplateCache$TemplateKey.class */
    private static final class TemplateKey {
        private final String name;
        private final Locale locale;
        private final String encoding;
        private final boolean parse;

        TemplateKey(String name, Locale locale, String encoding, boolean parse) {
            this.name = name;
            this.locale = locale;
            this.encoding = encoding;
            this.parse = parse;
        }

        public boolean equals(Object o) {
            if (o instanceof TemplateKey) {
                TemplateKey tk = (TemplateKey) o;
                return this.parse == tk.parse && this.name.equals(tk.name) && this.locale.equals(tk.locale) && this.encoding.equals(tk.encoding);
            }
            return false;
        }

        public int hashCode() {
            return ((this.name.hashCode() ^ this.locale.hashCode()) ^ this.encoding.hashCode()) ^ (this.parse ? Boolean.FALSE : Boolean.TRUE).hashCode();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/cache/TemplateCache$CachedTemplate.class */
    private static final class CachedTemplate implements Cloneable, Serializable {
        private static final long serialVersionUID = 1;
        Object templateOrException;
        Object source;
        long lastChecked;
        long lastModified;

        private CachedTemplate() {
        }

        CachedTemplate(AnonymousClass1 x0) {
            this();
        }

        public CachedTemplate cloneCachedTemplate() {
            try {
                return (CachedTemplate) super.clone();
            } catch (CloneNotSupportedException e) {
                throw new UndeclaredThrowableException(e);
            }
        }
    }
}
