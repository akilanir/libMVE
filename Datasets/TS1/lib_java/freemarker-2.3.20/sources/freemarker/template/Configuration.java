package freemarker.template;

import freemarker.cache.CacheStorage;
import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.FileTemplateLoader;
import freemarker.cache.MruCacheStorage;
import freemarker.cache.TemplateCache;
import freemarker.cache.TemplateLoader;
import freemarker.core.Configurable;
import freemarker.core.Environment;
import freemarker.core._ConcurrentMapFactory;
import freemarker.core._CoreAPI;
import freemarker.core._DelayedJQuote;
import freemarker.core._MiscTemplateException;
import freemarker.template.utility.CaptureOutput;
import freemarker.template.utility.ClassUtil;
import freemarker.template.utility.HtmlEscape;
import freemarker.template.utility.NormalizeNewlines;
import freemarker.template.utility.SecurityUtilities;
import freemarker.template.utility.StandardCompress;
import freemarker.template.utility.StringUtil;
import freemarker.template.utility.XmlEscape;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/Configuration.class */
public class Configuration extends Configurable implements Cloneable {
    public static final String DEFAULT_ENCODING_KEY = "default_encoding";
    public static final String LOCALIZED_LOOKUP_KEY = "localized_lookup";
    public static final String STRICT_SYNTAX_KEY = "strict_syntax";
    public static final String WHITESPACE_STRIPPING_KEY = "whitespace_stripping";
    public static final String CACHE_STORAGE_KEY = "cache_storage";
    public static final String TEMPLATE_UPDATE_DELAY_KEY = "template_update_delay";
    public static final String AUTO_IMPORT_KEY = "auto_import";
    public static final String AUTO_INCLUDE_KEY = "auto_include";
    public static final String TAG_SYNTAX_KEY = "tag_syntax";
    public static final String INCOMPATIBLE_IMPROVEMENTS = "incompatible_improvements";
    public static final String INCOMPATIBLE_ENHANCEMENTS = "incompatible_enhancements";
    public static final int AUTO_DETECT_TAG_SYNTAX = 0;
    public static final int ANGLE_BRACKET_TAG_SYNTAX = 1;
    public static final int SQUARE_BRACKET_TAG_SYNTAX = 2;
    public static final Version DEFAULT_INCOMPATIBLE_IMPROVEMENTS = new Version(2, 3, 0);
    public static final String DEFAULT_INCOMPATIBLE_ENHANCEMENTS = DEFAULT_INCOMPATIBLE_IMPROVEMENTS.toString();
    public static final int PARSED_DEFAULT_INCOMPATIBLE_ENHANCEMENTS = DEFAULT_INCOMPATIBLE_IMPROVEMENTS.intValue();
    private static Configuration defaultConfig = new Configuration();
    private static boolean versionPropertiesLoaded;
    private static String versionNumber;
    private static Version version;
    static Class class$java$lang$String;
    static Class class$freemarker$template$Configuration;
    private boolean strictSyntax = true;
    private volatile boolean localizedLookup = true;
    private boolean whitespaceStripping = true;
    private Version incompatibleImprovements = DEFAULT_INCOMPATIBLE_IMPROVEMENTS;
    private int tagSyntax = 1;
    private HashMap sharedVariables = new HashMap();
    private String defaultEncoding = SecurityUtilities.getSystemProperty("file.encoding");
    private Map localeToCharsetMap = _ConcurrentMapFactory.newThreadSafeMap();
    private ArrayList autoImports = new ArrayList();
    private ArrayList autoIncludes = new ArrayList();
    private Map autoImportNsToTmpMap = new HashMap();
    private TemplateCache cache = new TemplateCache();

    public Configuration() {
        this.cache.setConfiguration(this);
        this.cache.setDelay(5000L);
        loadBuiltInSharedVariables();
    }

    @Override // freemarker.core.Configurable
    public Object clone() {
        try {
            Configuration copy = (Configuration) super.clone();
            copy.sharedVariables = new HashMap(this.sharedVariables);
            copy.localeToCharsetMap = new HashMap(this.localeToCharsetMap);
            copy.autoImportNsToTmpMap = new HashMap(this.autoImportNsToTmpMap);
            copy.autoImports = (ArrayList) this.autoImports.clone();
            copy.autoIncludes = (ArrayList) this.autoIncludes.clone();
            copy.createTemplateCache(this.cache.getTemplateLoader(), this.cache.getCacheStorage());
            return copy;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(new StringBuffer().append("Clone is not supported, but it should be: ").append(e.getMessage()).toString());
        }
    }

    private void loadBuiltInSharedVariables() {
        this.sharedVariables.put("capture_output", new CaptureOutput());
        this.sharedVariables.put("compress", StandardCompress.INSTANCE);
        this.sharedVariables.put("html_escape", new HtmlEscape());
        this.sharedVariables.put("normalize_newlines", new NormalizeNewlines());
        this.sharedVariables.put("xml_escape", new XmlEscape());
    }

    public void loadBuiltInEncodingMap() {
        this.localeToCharsetMap.clear();
        this.localeToCharsetMap.put("ar", "ISO-8859-6");
        this.localeToCharsetMap.put("be", "ISO-8859-5");
        this.localeToCharsetMap.put("bg", "ISO-8859-5");
        this.localeToCharsetMap.put("ca", "ISO-8859-1");
        this.localeToCharsetMap.put("cs", "ISO-8859-2");
        this.localeToCharsetMap.put("da", "ISO-8859-1");
        this.localeToCharsetMap.put("de", "ISO-8859-1");
        this.localeToCharsetMap.put("el", "ISO-8859-7");
        this.localeToCharsetMap.put("en", "ISO-8859-1");
        this.localeToCharsetMap.put("es", "ISO-8859-1");
        this.localeToCharsetMap.put("et", "ISO-8859-1");
        this.localeToCharsetMap.put("fi", "ISO-8859-1");
        this.localeToCharsetMap.put("fr", "ISO-8859-1");
        this.localeToCharsetMap.put("hr", "ISO-8859-2");
        this.localeToCharsetMap.put("hu", "ISO-8859-2");
        this.localeToCharsetMap.put("is", "ISO-8859-1");
        this.localeToCharsetMap.put("it", "ISO-8859-1");
        this.localeToCharsetMap.put("iw", "ISO-8859-8");
        this.localeToCharsetMap.put("ja", "Shift_JIS");
        this.localeToCharsetMap.put("ko", "EUC-KR");
        this.localeToCharsetMap.put("lt", "ISO-8859-2");
        this.localeToCharsetMap.put("lv", "ISO-8859-2");
        this.localeToCharsetMap.put("mk", "ISO-8859-5");
        this.localeToCharsetMap.put("nl", "ISO-8859-1");
        this.localeToCharsetMap.put("no", "ISO-8859-1");
        this.localeToCharsetMap.put("pl", "ISO-8859-2");
        this.localeToCharsetMap.put("pt", "ISO-8859-1");
        this.localeToCharsetMap.put("ro", "ISO-8859-2");
        this.localeToCharsetMap.put("ru", "ISO-8859-5");
        this.localeToCharsetMap.put("sh", "ISO-8859-5");
        this.localeToCharsetMap.put("sk", "ISO-8859-2");
        this.localeToCharsetMap.put("sl", "ISO-8859-2");
        this.localeToCharsetMap.put("sq", "ISO-8859-2");
        this.localeToCharsetMap.put("sr", "ISO-8859-5");
        this.localeToCharsetMap.put("sv", "ISO-8859-1");
        this.localeToCharsetMap.put("tr", "ISO-8859-9");
        this.localeToCharsetMap.put("uk", "ISO-8859-5");
        this.localeToCharsetMap.put("zh", "GB2312");
        this.localeToCharsetMap.put("zh_TW", "Big5");
    }

    public void clearEncodingMap() {
        this.localeToCharsetMap.clear();
    }

    public static Configuration getDefaultConfiguration() {
        return defaultConfig;
    }

    public static void setDefaultConfiguration(Configuration config) {
        defaultConfig = config;
    }

    public synchronized void setTemplateLoader(TemplateLoader loader) {
        createTemplateCache(loader, this.cache.getCacheStorage());
    }

    private void createTemplateCache(TemplateLoader loader, CacheStorage storage) {
        TemplateCache oldCache = this.cache;
        this.cache = new TemplateCache(loader, storage);
        this.cache.setDelay(oldCache.getDelay());
        this.cache.setConfiguration(this);
        this.cache.setLocalizedLookup(this.localizedLookup);
    }

    public TemplateLoader getTemplateLoader() {
        return this.cache.getTemplateLoader();
    }

    public synchronized void setCacheStorage(CacheStorage storage) {
        createTemplateCache(this.cache.getTemplateLoader(), storage);
    }

    public synchronized CacheStorage getCacheStorage() {
        return this.cache.getCacheStorage();
    }

    public void setDirectoryForTemplateLoading(File dir) throws IOException {
        TemplateLoader tl = getTemplateLoader();
        if (tl instanceof FileTemplateLoader) {
            String path = ((FileTemplateLoader) tl).baseDir.getCanonicalPath();
            if (path.equals(dir.getCanonicalPath())) {
                return;
            }
        }
        setTemplateLoader(new FileTemplateLoader(dir));
    }

    public void setServletContextForTemplateLoading(Object servletContext, String path) {
        Class cls;
        Class[] constructorParamTypes;
        Object[] constructorParams;
        try {
            Class webappTemplateLoaderClass = ClassUtil.forName("freemarker.cache.WebappTemplateLoader");
            Class servletContextClass = ClassUtil.forName("javax.servlet.ServletContext");
            if (path == null) {
                constructorParamTypes = new Class[]{servletContextClass};
                constructorParams = new Object[]{servletContext};
            } else {
                Class[] clsArr = new Class[2];
                clsArr[0] = servletContextClass;
                if (class$java$lang$String == null) {
                    cls = class$("java.lang.String");
                    class$java$lang$String = cls;
                } else {
                    cls = class$java$lang$String;
                }
                clsArr[1] = cls;
                constructorParamTypes = clsArr;
                constructorParams = new Object[]{servletContext, path};
            }
            setTemplateLoader((TemplateLoader) webappTemplateLoaderClass.getConstructor(constructorParamTypes).newInstance(constructorParams));
        } catch (Exception exc) {
            throw new RuntimeException(new StringBuffer().append("Internal FreeMarker error: ").append(exc).toString());
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public void setClassForTemplateLoading(Class clazz, String pathPrefix) {
        setTemplateLoader(new ClassTemplateLoader(clazz, pathPrefix));
    }

    public void setTemplateUpdateDelay(int seconds) {
        this.cache.setDelay(1000 * seconds);
    }

    public void setStrictSyntaxMode(boolean b) {
        this.strictSyntax = b;
    }

    public boolean getStrictSyntaxMode() {
        return this.strictSyntax;
    }

    public void setIncompatibleImprovements(Version version2) {
        this.incompatibleImprovements = version2;
    }

    public Version getIncompatibleImprovements() {
        return this.incompatibleImprovements;
    }

    public void setIncompatibleEnhancements(String version2) {
        setIncompatibleImprovements(new Version(version2));
    }

    public String getIncompatibleEnhancements() {
        return this.incompatibleImprovements.toString();
    }

    public int getParsedIncompatibleEnhancements() {
        return getIncompatibleImprovements().intValue();
    }

    public void setWhitespaceStripping(boolean b) {
        this.whitespaceStripping = b;
    }

    public boolean getWhitespaceStripping() {
        return this.whitespaceStripping;
    }

    public void setTagSyntax(int tagSyntax) {
        if (tagSyntax != 0 && tagSyntax != 2 && tagSyntax != 1) {
            throw new IllegalArgumentException("\"tag_syntax\" can only be set to one of these: Configuration.AUTO_DETECT_TAG_SYNTAX, Configuration.ANGLE_BRACKET_SYNTAX, or Configuration.SQAUARE_BRACKET_SYNTAX");
        }
        this.tagSyntax = tagSyntax;
    }

    public int getTagSyntax() {
        return this.tagSyntax;
    }

    public Template getTemplate(String name) throws IOException {
        Locale loc = getLocale();
        return getTemplate(name, loc, getEncoding(loc), true);
    }

    public Template getTemplate(String name, Locale locale) throws IOException {
        return getTemplate(name, locale, getEncoding(locale), true);
    }

    public Template getTemplate(String name, String encoding) throws IOException {
        return getTemplate(name, getLocale(), encoding, true);
    }

    public Template getTemplate(String name, Locale locale, String encoding) throws IOException {
        return getTemplate(name, locale, encoding, true);
    }

    public Template getTemplate(String name, Locale locale, String encoding, boolean parseAsFTL) throws IOException {
        Template result = this.cache.getTemplate(name, locale, encoding, parseAsFTL);
        if (result == null) {
            throw new FileNotFoundException(new StringBuffer().append("Template ").append(StringUtil.jQuote(name)).append(" not found.").toString());
        }
        return result;
    }

    public void setDefaultEncoding(String encoding) {
        this.defaultEncoding = encoding;
    }

    public String getDefaultEncoding() {
        return this.defaultEncoding;
    }

    public String getEncoding(Locale locale) {
        if (this.localeToCharsetMap.isEmpty()) {
            return this.defaultEncoding;
        }
        String charset = (String) this.localeToCharsetMap.get(locale.toString());
        if (charset == null) {
            if (locale.getVariant().length() > 0) {
                Locale l = new Locale(locale.getLanguage(), locale.getCountry());
                String charset2 = (String) this.localeToCharsetMap.get(l.toString());
                if (charset2 != null) {
                    this.localeToCharsetMap.put(locale.toString(), charset2);
                }
            }
            charset = (String) this.localeToCharsetMap.get(locale.getLanguage());
            if (charset != null) {
                this.localeToCharsetMap.put(locale.toString(), charset);
            }
        }
        return charset != null ? charset : this.defaultEncoding;
    }

    public void setEncoding(Locale locale, String encoding) {
        this.localeToCharsetMap.put(locale.toString(), encoding);
    }

    public void setSharedVariable(String name, TemplateModel tm) {
        this.sharedVariables.put(name, tm);
    }

    public Set getSharedVariableNames() {
        return new HashSet(this.sharedVariables.keySet());
    }

    public void setSharedVariable(String name, Object obj) throws TemplateModelException {
        setSharedVariable(name, getObjectWrapper().wrap(obj));
    }

    public void setAllSharedVariables(TemplateHashModelEx hash) throws TemplateModelException {
        TemplateModelIterator keys = hash.keys().iterator();
        TemplateModelIterator values = hash.values().iterator();
        while (keys.hasNext()) {
            setSharedVariable(((TemplateScalarModel) keys.next()).getAsString(), values.next());
        }
    }

    public TemplateModel getSharedVariable(String name) {
        return (TemplateModel) this.sharedVariables.get(name);
    }

    public void clearSharedVariables() {
        this.sharedVariables.clear();
        loadBuiltInSharedVariables();
    }

    public void clearTemplateCache() {
        this.cache.clear();
    }

    public void removeTemplateFromCache(String name) throws IOException {
        Locale loc = getLocale();
        removeTemplateFromCache(name, loc, getEncoding(loc), true);
    }

    public void removeTemplateFromCache(String name, Locale locale) throws IOException {
        removeTemplateFromCache(name, locale, getEncoding(locale), true);
    }

    public void removeTemplateFromCache(String name, String encoding) throws IOException {
        removeTemplateFromCache(name, getLocale(), encoding, true);
    }

    public void removeTemplateFromCache(String name, Locale locale, String encoding) throws IOException {
        removeTemplateFromCache(name, locale, encoding, true);
    }

    public void removeTemplateFromCache(String name, Locale locale, String encoding, boolean parse) throws IOException {
        this.cache.removeTemplate(name, locale, encoding, parse);
    }

    public boolean getLocalizedLookup() {
        return this.cache.getLocalizedLookup();
    }

    public void setLocalizedLookup(boolean localizedLookup) {
        this.localizedLookup = localizedLookup;
        this.cache.setLocalizedLookup(localizedLookup);
    }

    @Override // freemarker.core.Configurable
    public void setSetting(String key, String value) throws TemplateException {
        try {
            if ("TemplateUpdateInterval".equalsIgnoreCase(key)) {
                key = TEMPLATE_UPDATE_DELAY_KEY;
            } else if ("DefaultEncoding".equalsIgnoreCase(key)) {
                key = DEFAULT_ENCODING_KEY;
            }
            if (DEFAULT_ENCODING_KEY.equals(key)) {
                setDefaultEncoding(value);
            } else if (LOCALIZED_LOOKUP_KEY.equals(key)) {
                setLocalizedLookup(StringUtil.getYesNo(value));
            } else if (STRICT_SYNTAX_KEY.equals(key)) {
                setStrictSyntaxMode(StringUtil.getYesNo(value));
            } else if (WHITESPACE_STRIPPING_KEY.equals(key)) {
                setWhitespaceStripping(StringUtil.getYesNo(value));
            } else if (CACHE_STORAGE_KEY.equals(key)) {
                if (value.indexOf(46) == -1) {
                    int strongSize = 0;
                    int softSize = 0;
                    Map map = StringUtil.parseNameValuePairList(value, String.valueOf(Integer.MAX_VALUE));
                    for (Map.Entry ent : map.entrySet()) {
                        String pname = (String) ent.getKey();
                        try {
                            int pvalue = Integer.parseInt((String) ent.getValue());
                            if ("soft".equalsIgnoreCase(pname)) {
                                softSize = pvalue;
                            } else if ("strong".equalsIgnoreCase(pname)) {
                                strongSize = pvalue;
                            } else {
                                throw invalidSettingValueException(key, value);
                            }
                        } catch (NumberFormatException e) {
                            throw invalidSettingValueException(key, value);
                        }
                    }
                    if (softSize == 0 && strongSize == 0) {
                        throw invalidSettingValueException(key, value);
                    }
                    setCacheStorage(new MruCacheStorage(strongSize, softSize));
                } else {
                    setCacheStorage((CacheStorage) ClassUtil.forName(value).newInstance());
                }
            } else if (TEMPLATE_UPDATE_DELAY_KEY.equals(key)) {
                setTemplateUpdateDelay(Integer.parseInt(value));
            } else if (AUTO_INCLUDE_KEY.equals(key)) {
                setAutoIncludes(parseAsList(value));
            } else if (AUTO_IMPORT_KEY.equals(key)) {
                setAutoImports(parseAsImportList(value));
            } else if (TAG_SYNTAX_KEY.equals(key)) {
                if ("auto_detect".equals(value)) {
                    setTagSyntax(0);
                } else if ("angle_bracket".equals(value)) {
                    setTagSyntax(1);
                } else if ("square_bracket".equals(value)) {
                    setTagSyntax(2);
                } else {
                    throw invalidSettingValueException(key, value);
                }
            } else if (INCOMPATIBLE_IMPROVEMENTS.equals(key)) {
                setIncompatibleImprovements(new Version(value));
            } else if (INCOMPATIBLE_ENHANCEMENTS.equals(key)) {
                setIncompatibleEnhancements(value);
            } else {
                super.setSetting(key, value);
            }
        } catch (Exception e2) {
            throw new _MiscTemplateException(e2, getEnvironment(), new Object[]{"Failed to set setting ", new _DelayedJQuote(key), " to value ", new _DelayedJQuote(value), "; see cause exception."});
        }
    }

    public synchronized void addAutoImport(String namespaceVarName, String templateName) {
        this.autoImports.remove(namespaceVarName);
        this.autoImports.add(namespaceVarName);
        this.autoImportNsToTmpMap.put(namespaceVarName, templateName);
    }

    public synchronized void removeAutoImport(String namespaceVarName) {
        this.autoImports.remove(namespaceVarName);
        this.autoImportNsToTmpMap.remove(namespaceVarName);
    }

    public synchronized void setAutoImports(Map map) {
        this.autoImports = new ArrayList(map.keySet());
        if (map instanceof HashMap) {
            this.autoImportNsToTmpMap = (Map) ((HashMap) map).clone();
        } else if (map instanceof SortedMap) {
            this.autoImportNsToTmpMap = new TreeMap(map);
        } else {
            this.autoImportNsToTmpMap = new HashMap(map);
        }
    }

    @Override // freemarker.core.Configurable
    protected void doAutoImportsAndIncludes(Environment env) throws TemplateException, IOException {
        for (int i = 0; i < this.autoImports.size(); i++) {
            String namespace = (String) this.autoImports.get(i);
            String templateName = (String) this.autoImportNsToTmpMap.get(namespace);
            env.importLib(templateName, namespace);
        }
        for (int i2 = 0; i2 < this.autoIncludes.size(); i2++) {
            String templateName2 = (String) this.autoIncludes.get(i2);
            Template template = getTemplate(templateName2, env.getLocale());
            env.include(template);
        }
    }

    public synchronized void addAutoInclude(String templateName) {
        this.autoIncludes.remove(templateName);
        this.autoIncludes.add(templateName);
    }

    public synchronized void setAutoIncludes(List templateNames) {
        this.autoIncludes.clear();
        for (Object o : templateNames) {
            if (!(o instanceof String)) {
                throw new IllegalArgumentException("List items must be String-s.");
            }
            this.autoIncludes.add(o);
        }
    }

    public synchronized void removeAutoInclude(String templateName) {
        this.autoIncludes.remove(templateName);
    }

    public static String getVersionNumber() {
        if (!versionPropertiesLoaded) {
            loadVersionProperties();
        }
        return versionNumber;
    }

    public static Version getVersion() {
        if (!versionPropertiesLoaded) {
            loadVersionProperties();
        }
        return version;
    }

    private static void loadVersionProperties() {
        Class cls;
        Date buildDate;
        try {
            Properties vp = new Properties();
            if (class$freemarker$template$Configuration == null) {
                cls = class$("freemarker.template.Configuration");
                class$freemarker$template$Configuration = cls;
            } else {
                cls = class$freemarker$template$Configuration;
            }
            InputStream ins = cls.getClassLoader().getResourceAsStream("freemarker/version.properties");
            if (ins == null) {
                throw new RuntimeException("Version file is missing.");
            }
            try {
                vp.load(ins);
                ins.close();
                String versionString = getRequiredVersionProperty(vp, "version");
                versionNumber = versionString;
                String buildDateStr = getRequiredVersionProperty(vp, "buildTimestamp");
                if (buildDateStr.endsWith("Z")) {
                    buildDateStr = new StringBuffer().append(buildDateStr.substring(0, buildDateStr.length() - 1)).append("+0000").toString();
                }
                try {
                    buildDate = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ssZ", Locale.US).parse(buildDateStr);
                } catch (ParseException e) {
                    buildDate = null;
                }
                Boolean gaeCompliant = Boolean.valueOf(getRequiredVersionProperty(vp, "isGAECompliant"));
                version = new Version(versionString, gaeCompliant, buildDate);
                versionPropertiesLoaded = true;
            } catch (Throwable th) {
                ins.close();
                throw th;
            }
        } catch (IOException e2) {
            throw new RuntimeException(new StringBuffer().append("Failed to load version file: ").append(e2).toString());
        }
    }

    public Set getSupportedBuiltInNames() {
        return _CoreAPI.getSupportedBuiltInNames();
    }

    private static String getRequiredVersionProperty(Properties vp, String properyName) {
        String s = vp.getProperty(properyName);
        if (s == null) {
            throw new RuntimeException(new StringBuffer().append("Version file is corrupt: \"").append(properyName).append("\" property is missing.").toString());
        }
        return s;
    }
}
