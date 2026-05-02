package freemarker.core;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.utility.ClassUtil;
import freemarker.template.utility.NullArgumentException;
import freemarker.template.utility.StringUtil;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TimeZone;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Configurable.class */
public class Configurable {
    static final String C_TRUE_FALSE = "true,false";
    public static final String LOCALE_KEY = "locale";
    public static final String NUMBER_FORMAT_KEY = "number_format";
    public static final String TIME_FORMAT_KEY = "time_format";
    public static final String DATE_FORMAT_KEY = "date_format";
    public static final String DATETIME_FORMAT_KEY = "datetime_format";
    public static final String TIME_ZONE_KEY = "time_zone";
    public static final String CLASSIC_COMPATIBLE_KEY = "classic_compatible";
    public static final String TEMPLATE_EXCEPTION_HANDLER_KEY = "template_exception_handler";
    public static final String ARITHMETIC_ENGINE_KEY = "arithmetic_engine";
    public static final String OBJECT_WRAPPER_KEY = "object_wrapper";
    public static final String BOOLEAN_FORMAT_KEY = "boolean_format";
    public static final String OUTPUT_ENCODING_KEY = "output_encoding";
    public static final String URL_ESCAPING_CHARSET_KEY = "url_escaping_charset";
    public static final String STRICT_BEAN_MODELS = "strict_bean_models";
    public static final String AUTO_FLUSH_KEY = "auto_flush";
    public static final String NEW_BUILTIN_CLASS_RESOLVER_KEY = "new_builtin_class_resolver";
    private Configurable parent;
    private Properties properties;
    private HashMap customAttributes;
    private Locale locale;
    private String numberFormat;
    private String timeFormat;
    private String dateFormat;
    private String dateTimeFormat;
    private TimeZone timeZone;
    private String booleanFormat;
    private String trueStringValue;
    private String falseStringValue;
    private Integer classicCompatible;
    private TemplateExceptionHandler templateExceptionHandler;
    private ArithmeticEngine arithmeticEngine;
    private ObjectWrapper objectWrapper;
    private String outputEncoding;
    private boolean outputEncodingSet;
    private String urlEscapingCharset;
    private boolean urlEscapingCharsetSet;
    private Boolean autoFlush;
    private TemplateClassResolver newBuiltinClassResolver;
    private static final String ALLOWED_CLASSES = "allowed_classes";
    private static final String TRUSTED_TEMPLATES = "trusted_templates";
    static Class class$freemarker$ext$beans$BeansWrapper;

    /* renamed from: freemarker.core.Configurable$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Configurable$1.class */
    static class AnonymousClass1 {
    }

    public Configurable() {
        this.parent = null;
        this.locale = Locale.getDefault();
        this.timeZone = TimeZone.getDefault();
        this.numberFormat = "number";
        this.timeFormat = "";
        this.dateFormat = "";
        this.dateTimeFormat = "";
        this.classicCompatible = new Integer(0);
        this.templateExceptionHandler = TemplateExceptionHandler.DEBUG_HANDLER;
        this.arithmeticEngine = ArithmeticEngine.BIGDECIMAL_ENGINE;
        this.objectWrapper = ObjectWrapper.DEFAULT_WRAPPER;
        this.autoFlush = Boolean.TRUE;
        this.newBuiltinClassResolver = TemplateClassResolver.UNRESTRICTED_RESOLVER;
        this.properties = new Properties();
        this.properties.setProperty(LOCALE_KEY, this.locale.toString());
        this.properties.setProperty(TIME_FORMAT_KEY, this.timeFormat);
        this.properties.setProperty(DATE_FORMAT_KEY, this.dateFormat);
        this.properties.setProperty(DATETIME_FORMAT_KEY, this.dateTimeFormat);
        this.properties.setProperty(TIME_ZONE_KEY, this.timeZone.getID());
        this.properties.setProperty(NUMBER_FORMAT_KEY, this.numberFormat);
        this.properties.setProperty(CLASSIC_COMPATIBLE_KEY, this.classicCompatible.toString());
        this.properties.setProperty(TEMPLATE_EXCEPTION_HANDLER_KEY, this.templateExceptionHandler.getClass().getName());
        this.properties.setProperty(ARITHMETIC_ENGINE_KEY, this.arithmeticEngine.getClass().getName());
        this.properties.setProperty(AUTO_FLUSH_KEY, this.autoFlush.toString());
        this.properties.setProperty(NEW_BUILTIN_CLASS_RESOLVER_KEY, this.newBuiltinClassResolver.getClass().getName());
        setBooleanFormat(C_TRUE_FALSE);
        this.customAttributes = new HashMap();
    }

    public Configurable(Configurable parent) {
        this.parent = parent;
        this.locale = null;
        this.numberFormat = null;
        this.classicCompatible = null;
        this.templateExceptionHandler = null;
        this.properties = new Properties(parent.properties);
        this.customAttributes = new HashMap();
    }

    protected Object clone() throws CloneNotSupportedException {
        Configurable copy = (Configurable) super.clone();
        copy.properties = new Properties(this.properties);
        copy.customAttributes = (HashMap) this.customAttributes.clone();
        return copy;
    }

    public final Configurable getParent() {
        return this.parent;
    }

    final void setParent(Configurable parent) {
        this.parent = parent;
    }

    public void setClassicCompatible(boolean classicCompatibility) {
        this.classicCompatible = new Integer(classicCompatibility ? 1 : 0);
        this.properties.setProperty(CLASSIC_COMPATIBLE_KEY, classicCompatibilityIntToString(this.classicCompatible));
    }

    public void setClassicCompatibleAsInt(int classicCompatibility) {
        if (classicCompatibility < 0 || classicCompatibility > 2) {
            throw new IllegalArgumentException(new StringBuffer().append("Unsupported \"classicCompatibility\": ").append(classicCompatibility).toString());
        }
        this.classicCompatible = new Integer(classicCompatibility);
    }

    private String classicCompatibilityIntToString(Integer i) {
        if (i == null) {
            return null;
        }
        return i.intValue() == 0 ? "false" : i.intValue() == 1 ? "true" : i.toString();
    }

    public boolean isClassicCompatible() {
        return this.classicCompatible != null ? this.classicCompatible.intValue() != 0 : this.parent.isClassicCompatible();
    }

    public int getClassicCompatibleAsInt() {
        return this.classicCompatible != null ? this.classicCompatible.intValue() : this.parent.getClassicCompatibleAsInt();
    }

    public void setLocale(Locale locale) {
        NullArgumentException.check(LOCALE_KEY, locale);
        this.locale = locale;
        this.properties.setProperty(LOCALE_KEY, locale.toString());
    }

    public TimeZone getTimeZone() {
        return this.timeZone != null ? this.timeZone : this.parent.getTimeZone();
    }

    public void setTimeZone(TimeZone timeZone) {
        NullArgumentException.check("timeZone", timeZone);
        this.timeZone = timeZone;
        this.properties.setProperty(TIME_ZONE_KEY, timeZone.getID());
    }

    public Locale getLocale() {
        return this.locale != null ? this.locale : this.parent.getLocale();
    }

    public void setNumberFormat(String numberFormat) {
        NullArgumentException.check("numberFormat", numberFormat);
        this.numberFormat = numberFormat;
        this.properties.setProperty(NUMBER_FORMAT_KEY, numberFormat);
    }

    public String getNumberFormat() {
        return this.numberFormat != null ? this.numberFormat : this.parent.getNumberFormat();
    }

    public void setBooleanFormat(String booleanFormat) {
        NullArgumentException.check("booleanFormat", booleanFormat);
        int commaIdx = booleanFormat.indexOf(44);
        if (commaIdx == -1) {
            throw new IllegalArgumentException("Setting \"boolean_format\" must consist of two comma-separated values for true and false,respectively.");
        }
        this.booleanFormat = booleanFormat;
        this.properties.setProperty(BOOLEAN_FORMAT_KEY, booleanFormat);
        if (booleanFormat.equals(C_TRUE_FALSE)) {
            this.trueStringValue = null;
            this.falseStringValue = null;
        } else {
            this.trueStringValue = booleanFormat.substring(0, commaIdx);
            this.falseStringValue = booleanFormat.substring(commaIdx + 1);
        }
    }

    public String getBooleanFormat() {
        return this.booleanFormat != null ? this.booleanFormat : this.parent.getBooleanFormat();
    }

    String formatBoolean(boolean value, boolean fallbackToTrueFalse) throws TemplateException {
        if (value) {
            String s = getTrueStringValue();
            if (s == null) {
                if (fallbackToTrueFalse) {
                    return "true";
                }
                throw new _MiscTemplateException(getNullBooleanFormatErrorDescription());
            }
            return s;
        }
        String s2 = getFalseStringValue();
        if (s2 == null) {
            if (fallbackToTrueFalse) {
                return "false";
            }
            throw new _MiscTemplateException(getNullBooleanFormatErrorDescription());
        }
        return s2;
    }

    private _ErrorDescriptionBuilder getNullBooleanFormatErrorDescription() {
        Object[] objArr = new Object[5];
        objArr[0] = "Can't convert boolean to string automatically, because the \"";
        objArr[1] = BOOLEAN_FORMAT_KEY;
        objArr[2] = "\" setting was ";
        objArr[3] = new _DelayedJQuote(getBooleanFormat());
        objArr[4] = getBooleanFormat().equals(C_TRUE_FALSE) ? ", which is the legacy default computer-language format, and hence isn't accepted." : ".";
        return new _ErrorDescriptionBuilder(objArr).tips(new Object[]{"If you just want \"true\"/\"false\" result as you are generting computer-language output, use \"?c\", like ${myBool?c}.", "You can write myBool?string('yes', 'no') and like to specify boolean formatting in place.", new Object[]{"If you need the same two values on most places, the programmers should set the \"", BOOLEAN_FORMAT_KEY, "\" setting to something like \"yes,no\"."}});
    }

    String getTrueStringValue() {
        if (this.booleanFormat != null) {
            return this.trueStringValue;
        }
        if (this.parent != null) {
            return this.parent.getTrueStringValue();
        }
        return null;
    }

    String getFalseStringValue() {
        if (this.booleanFormat != null) {
            return this.falseStringValue;
        }
        if (this.parent != null) {
            return this.parent.getFalseStringValue();
        }
        return null;
    }

    public void setTimeFormat(String timeFormat) {
        NullArgumentException.check("timeFormat", timeFormat);
        this.timeFormat = timeFormat;
        this.properties.setProperty(TIME_FORMAT_KEY, timeFormat);
    }

    public String getTimeFormat() {
        return this.timeFormat != null ? this.timeFormat : this.parent.getTimeFormat();
    }

    public void setDateFormat(String dateFormat) {
        NullArgumentException.check("dateFormat", dateFormat);
        this.dateFormat = dateFormat;
        this.properties.setProperty(DATE_FORMAT_KEY, dateFormat);
    }

    public String getDateFormat() {
        return this.dateFormat != null ? this.dateFormat : this.parent.getDateFormat();
    }

    public void setDateTimeFormat(String dateTimeFormat) {
        NullArgumentException.check("dateTimeFormat", dateTimeFormat);
        this.dateTimeFormat = dateTimeFormat;
        this.properties.setProperty(DATETIME_FORMAT_KEY, dateTimeFormat);
    }

    public String getDateTimeFormat() {
        return this.dateTimeFormat != null ? this.dateTimeFormat : this.parent.getDateTimeFormat();
    }

    public void setTemplateExceptionHandler(TemplateExceptionHandler templateExceptionHandler) {
        NullArgumentException.check("templateExceptionHandler", templateExceptionHandler);
        this.templateExceptionHandler = templateExceptionHandler;
        this.properties.setProperty(TEMPLATE_EXCEPTION_HANDLER_KEY, templateExceptionHandler.getClass().getName());
    }

    public TemplateExceptionHandler getTemplateExceptionHandler() {
        return this.templateExceptionHandler != null ? this.templateExceptionHandler : this.parent.getTemplateExceptionHandler();
    }

    public void setArithmeticEngine(ArithmeticEngine arithmeticEngine) {
        NullArgumentException.check("arithmeticEngine", arithmeticEngine);
        this.arithmeticEngine = arithmeticEngine;
        this.properties.setProperty(ARITHMETIC_ENGINE_KEY, arithmeticEngine.getClass().getName());
    }

    public ArithmeticEngine getArithmeticEngine() {
        return this.arithmeticEngine != null ? this.arithmeticEngine : this.parent.getArithmeticEngine();
    }

    public void setObjectWrapper(ObjectWrapper objectWrapper) {
        NullArgumentException.check("objectWrapper", objectWrapper);
        this.objectWrapper = objectWrapper;
        this.properties.setProperty(OBJECT_WRAPPER_KEY, objectWrapper.getClass().getName());
    }

    public ObjectWrapper getObjectWrapper() {
        return this.objectWrapper != null ? this.objectWrapper : this.parent.getObjectWrapper();
    }

    public void setOutputEncoding(String outputEncoding) {
        this.outputEncoding = outputEncoding;
        if (outputEncoding != null) {
            this.properties.setProperty(OUTPUT_ENCODING_KEY, outputEncoding);
        } else {
            this.properties.remove(OUTPUT_ENCODING_KEY);
        }
        this.outputEncodingSet = true;
    }

    public String getOutputEncoding() {
        if (this.outputEncodingSet) {
            return this.outputEncoding;
        }
        if (this.parent != null) {
            return this.parent.getOutputEncoding();
        }
        return null;
    }

    public void setURLEscapingCharset(String urlEscapingCharset) {
        this.urlEscapingCharset = urlEscapingCharset;
        if (urlEscapingCharset != null) {
            this.properties.setProperty(URL_ESCAPING_CHARSET_KEY, urlEscapingCharset);
        } else {
            this.properties.remove(URL_ESCAPING_CHARSET_KEY);
        }
        this.urlEscapingCharsetSet = true;
    }

    public String getURLEscapingCharset() {
        if (this.urlEscapingCharsetSet) {
            return this.urlEscapingCharset;
        }
        if (this.parent != null) {
            return this.parent.getURLEscapingCharset();
        }
        return null;
    }

    public void setNewBuiltinClassResolver(TemplateClassResolver newBuiltinClassResolver) {
        NullArgumentException.check("newBuiltinClassResolver", newBuiltinClassResolver);
        this.newBuiltinClassResolver = newBuiltinClassResolver;
        this.properties.setProperty(NEW_BUILTIN_CLASS_RESOLVER_KEY, newBuiltinClassResolver.getClass().getName());
    }

    public TemplateClassResolver getNewBuiltinClassResolver() {
        return this.newBuiltinClassResolver != null ? this.newBuiltinClassResolver : this.parent.getNewBuiltinClassResolver();
    }

    public void setAutoFlush(boolean autoFlush) {
        this.autoFlush = autoFlush ? Boolean.TRUE : Boolean.FALSE;
        this.properties.setProperty(AUTO_FLUSH_KEY, String.valueOf(autoFlush));
    }

    public boolean getAutoFlush() {
        if (this.autoFlush != null) {
            return this.autoFlush.booleanValue();
        }
        if (this.parent != null) {
            return this.parent.getAutoFlush();
        }
        return true;
    }

    public void setSetting(String name, String value) throws TemplateException {
        char firstChar;
        try {
            if (LOCALE_KEY.equals(name)) {
                setLocale(StringUtil.deduceLocale(value));
            } else if (NUMBER_FORMAT_KEY.equals(name)) {
                setNumberFormat(value);
            } else if (TIME_FORMAT_KEY.equals(name)) {
                setTimeFormat(value);
            } else if (DATE_FORMAT_KEY.equals(name)) {
                setDateFormat(value);
            } else if (DATETIME_FORMAT_KEY.equals(name)) {
                setDateTimeFormat(value);
            } else if (TIME_ZONE_KEY.equals(name)) {
                setTimeZone(TimeZone.getTimeZone(value));
            } else if (CLASSIC_COMPATIBLE_KEY.equals(name)) {
                if (value != null && value.length() > 0) {
                    firstChar = value.charAt(0);
                } else {
                    firstChar = 0;
                }
                if (Character.isDigit(firstChar) || firstChar == '+' || firstChar == '-') {
                    setClassicCompatibleAsInt(Integer.parseInt(value));
                } else {
                    setClassicCompatible(StringUtil.getYesNo(value));
                }
            } else if (TEMPLATE_EXCEPTION_HANDLER_KEY.equals(name)) {
                if (value.indexOf(46) == -1) {
                    if ("debug".equalsIgnoreCase(value)) {
                        setTemplateExceptionHandler(TemplateExceptionHandler.DEBUG_HANDLER);
                    } else if ("html_debug".equalsIgnoreCase(value)) {
                        setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
                    } else if ("ignore".equalsIgnoreCase(value)) {
                        setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
                    } else if ("rethrow".equalsIgnoreCase(value)) {
                        setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
                    } else {
                        throw invalidSettingValueException(name, value);
                    }
                } else {
                    setTemplateExceptionHandler((TemplateExceptionHandler) ClassUtil.forName(value).newInstance());
                }
            } else if (ARITHMETIC_ENGINE_KEY.equals(name)) {
                if (value.indexOf(46) == -1) {
                    if ("bigdecimal".equalsIgnoreCase(value)) {
                        setArithmeticEngine(ArithmeticEngine.BIGDECIMAL_ENGINE);
                    } else if ("conservative".equalsIgnoreCase(value)) {
                        setArithmeticEngine(ArithmeticEngine.CONSERVATIVE_ENGINE);
                    } else {
                        throw invalidSettingValueException(name, value);
                    }
                } else {
                    setArithmeticEngine((ArithmeticEngine) ClassUtil.forName(value).newInstance());
                }
            } else if (OBJECT_WRAPPER_KEY.equals(name)) {
                if (value.indexOf(46) == -1) {
                    if ("default".equalsIgnoreCase(value)) {
                        setObjectWrapper(ObjectWrapper.DEFAULT_WRAPPER);
                    } else if ("simple".equalsIgnoreCase(value)) {
                        setObjectWrapper(ObjectWrapper.SIMPLE_WRAPPER);
                    } else if ("beans".equalsIgnoreCase(value)) {
                        setObjectWrapper(ObjectWrapper.BEANS_WRAPPER);
                    } else if ("jython".equalsIgnoreCase(value)) {
                        Class clazz = Class.forName("freemarker.ext.jython.JythonWrapper");
                        setObjectWrapper((ObjectWrapper) clazz.getField("INSTANCE").get(null));
                    } else {
                        throw invalidSettingValueException(name, value);
                    }
                } else {
                    setObjectWrapper((ObjectWrapper) ClassUtil.forName(value).newInstance());
                }
            } else if (BOOLEAN_FORMAT_KEY.equals(name)) {
                setBooleanFormat(value);
            } else if (OUTPUT_ENCODING_KEY.equals(name)) {
                setOutputEncoding(value);
            } else if (URL_ESCAPING_CHARSET_KEY.equals(name)) {
                setURLEscapingCharset(value);
            } else if (STRICT_BEAN_MODELS.equals(name)) {
                setStrictBeanModels(StringUtil.getYesNo(value));
            } else if (AUTO_FLUSH_KEY.equals(name)) {
                setAutoFlush(StringUtil.getYesNo(value));
            } else if (NEW_BUILTIN_CLASS_RESOLVER_KEY.equals(name)) {
                if ("unrestricted".equals(value)) {
                    setNewBuiltinClassResolver(TemplateClassResolver.UNRESTRICTED_RESOLVER);
                } else if ("safer".equals(value)) {
                    setNewBuiltinClassResolver(TemplateClassResolver.SAFER_RESOLVER);
                } else if ("allows_nothing".equals(value)) {
                    setNewBuiltinClassResolver(TemplateClassResolver.ALLOWS_NOTHING_RESOLVER);
                } else if (value.indexOf(":") != -1) {
                    List segments = parseAsSegmentedList(value);
                    Set allowedClasses = null;
                    List trustedTemplates = null;
                    for (int i = 0; i < segments.size(); i++) {
                        KeyValuePair kv = (KeyValuePair) segments.get(i);
                        String segmentKey = (String) kv.getKey();
                        List segmentValue = (List) kv.getValue();
                        if (segmentKey.equals(ALLOWED_CLASSES)) {
                            allowedClasses = new HashSet(segmentValue);
                        } else if (segmentKey.equals(TRUSTED_TEMPLATES)) {
                            trustedTemplates = segmentValue;
                        } else {
                            throw new ParseException(new StringBuffer().append("Unrecognized list segment key: ").append(StringUtil.jQuote(segmentKey)).append(". Supported keys are: \"").append(ALLOWED_CLASSES).append("\", \"").append(TRUSTED_TEMPLATES).append("\"").toString(), 0, 0);
                        }
                    }
                    setNewBuiltinClassResolver(new OptInTemplateClassResolver(allowedClasses, trustedTemplates));
                } else if (value.indexOf(46) == -1) {
                    setNewBuiltinClassResolver((TemplateClassResolver) ClassUtil.forName(value).newInstance());
                } else {
                    throw invalidSettingValueException(name, value);
                }
            } else {
                throw unknownSettingException(name);
            }
        } catch (Exception e) {
            throw new _MiscTemplateException(e, getEnvironment(), new Object[]{"Failed to set setting ", new _DelayedJQuote(name), " to value ", new _DelayedJQuote(value), "; see cause exception."});
        }
    }

    public void setStrictBeanModels(boolean strict) {
        Class cls;
        if (!(this.objectWrapper instanceof BeansWrapper)) {
            StringBuffer append = new StringBuffer().append("The value of the object_wrapper setting isn't a ");
            if (class$freemarker$ext$beans$BeansWrapper == null) {
                cls = class$("freemarker.ext.beans.BeansWrapper");
                class$freemarker$ext$beans$BeansWrapper = cls;
            } else {
                cls = class$freemarker$ext$beans$BeansWrapper;
            }
            throw new IllegalStateException(append.append(cls.getName()).append(".").toString());
        }
        ((BeansWrapper) this.objectWrapper).setStrict(strict);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public String getSetting(String key) {
        return this.properties.getProperty(key);
    }

    public Map getSettings() {
        return Collections.unmodifiableMap(this.properties);
    }

    protected Environment getEnvironment() {
        return this instanceof Environment ? (Environment) this : Environment.getCurrentEnvironment();
    }

    protected TemplateException unknownSettingException(String name) {
        return new UnknownSettingException(name, getEnvironment(), null);
    }

    protected TemplateException invalidSettingValueException(String name, String value) {
        return new _MiscTemplateException(getEnvironment(), new Object[]{"Invalid value for setting ", new _DelayedJQuote(name), ": ", new _DelayedJQuote(value)});
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Configurable$UnknownSettingException.class */
    public static class UnknownSettingException extends _MiscTemplateException {
        UnknownSettingException(String x0, Environment x1, AnonymousClass1 x2) {
            this(x0, x1);
        }

        private UnknownSettingException(String name, Environment env) {
            super(env, new Object[]{"Unknown setting: ", new _DelayedJQuote(name)});
        }
    }

    public void setSettings(Properties props) throws TemplateException {
        for (String key : props.keySet()) {
            setSetting(key, props.getProperty(key).trim());
        }
    }

    public void setSettings(InputStream propsIn) throws TemplateException, IOException {
        Properties p = new Properties();
        p.load(propsIn);
        setSettings(p);
    }

    void setCustomAttribute(Object key, Object value) {
        synchronized (this.customAttributes) {
            this.customAttributes.put(key, value);
        }
    }

    Object getCustomAttribute(Object key, CustomAttribute attr) {
        Object obj;
        synchronized (this.customAttributes) {
            Object o = this.customAttributes.get(key);
            if (o == null && !this.customAttributes.containsKey(key)) {
                o = attr.create();
                this.customAttributes.put(key, o);
            }
            obj = o;
        }
        return obj;
    }

    public void setCustomAttribute(String name, Object value) {
        synchronized (this.customAttributes) {
            this.customAttributes.put(name, value);
        }
    }

    public String[] getCustomAttributeNames() {
        String[] strArr;
        synchronized (this.customAttributes) {
            Collection names = new LinkedList(this.customAttributes.keySet());
            Iterator iter = names.iterator();
            while (iter.hasNext()) {
                if (!(iter.next() instanceof String)) {
                    iter.remove();
                }
            }
            strArr = (String[]) names.toArray(new String[names.size()]);
        }
        return strArr;
    }

    public void removeCustomAttribute(String name) {
        synchronized (this.customAttributes) {
            this.customAttributes.remove(name);
        }
    }

    public Object getCustomAttribute(String name) {
        synchronized (this.customAttributes) {
            Object retval = this.customAttributes.get(name);
            if (retval == null && this.customAttributes.containsKey(name)) {
                return null;
            }
            if (retval == null && this.parent != null) {
                return this.parent.getCustomAttribute(name);
            }
            return retval;
        }
    }

    protected void doAutoImportsAndIncludes(Environment env) throws TemplateException, IOException {
        if (this.parent != null) {
            this.parent.doAutoImportsAndIncludes(env);
        }
    }

    protected ArrayList parseAsList(String text) throws ParseException {
        return new SettingStringParser(text, null).parseAsList();
    }

    protected ArrayList parseAsSegmentedList(String text) throws ParseException {
        return new SettingStringParser(text, null).parseAsSegmentedList();
    }

    protected HashMap parseAsImportList(String text) throws ParseException {
        return new SettingStringParser(text, null).parseAsImportList();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Configurable$KeyValuePair.class */
    private static class KeyValuePair {
        private final Object key;
        private final Object value;

        KeyValuePair(Object key, Object value) {
            this.key = key;
            this.value = value;
        }

        Object getKey() {
            return this.key;
        }

        Object getValue() {
            return this.value;
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Configurable$SettingStringParser.class */
    private static class SettingStringParser {
        private String text;
        private int p;
        private int ln;

        SettingStringParser(String x0, AnonymousClass1 x1) {
            this(x0);
        }

        private SettingStringParser(String text) {
            this.text = text;
            this.p = 0;
            this.ln = text.length();
        }

        ArrayList parseAsSegmentedList() throws ParseException {
            ArrayList segments = new ArrayList();
            ArrayList currentSegment = null;
            while (skipWS() != ' ') {
                String item = fetchStringValue();
                char c = skipWS();
                if (c == ':') {
                    currentSegment = new ArrayList();
                    segments.add(new KeyValuePair(item, currentSegment));
                } else {
                    if (currentSegment == null) {
                        throw new ParseException("The very first list item must be followed by \":\" so it will be the key for the following sub-list.", 0, 0);
                    }
                    currentSegment.add(item);
                }
                if (c == ' ') {
                    break;
                }
                if (c != ',' && c != ':') {
                    throw new ParseException(new StringBuffer().append("Expected \",\" or \":\" or the end of text but found \"").append(c).append("\"").toString(), 0, 0);
                }
                this.p++;
            }
            return segments;
        }

        ArrayList parseAsList() throws ParseException {
            ArrayList seq = new ArrayList();
            while (skipWS() != ' ') {
                seq.add(fetchStringValue());
                char c = skipWS();
                if (c == ' ') {
                    break;
                }
                if (c != ',') {
                    throw new ParseException(new StringBuffer().append("Expected \",\" or the end of text but found \"").append(c).append("\"").toString(), 0, 0);
                }
                this.p++;
            }
            return seq;
        }

        /* JADX WARN: Incorrect condition in loop: B:4:0x0010 */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        java.util.HashMap parseAsImportList() throws freemarker.core.ParseException {
            /*
                Method dump skipped, instructions count: 205
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: freemarker.core.Configurable.SettingStringParser.parseAsImportList():java.util.HashMap");
        }

        String fetchStringValue() throws ParseException {
            String w = fetchWord();
            if (w.startsWith("'") || w.startsWith("\"")) {
                w = w.substring(1, w.length() - 1);
            }
            return StringUtil.FTLStringLiteralDec(w);
        }

        String fetchKeyword() throws ParseException {
            String w = fetchWord();
            if (w.startsWith("'") || w.startsWith("\"")) {
                throw new ParseException(new StringBuffer().append("Keyword expected, but a string value found: ").append(w).toString(), 0, 0);
            }
            return w;
        }

        char skipWS() {
            while (this.p < this.ln) {
                char c = this.text.charAt(this.p);
                if (!Character.isWhitespace(c)) {
                    return c;
                }
                this.p++;
            }
            return ' ';
        }

        private String fetchWord() throws ParseException {
            char c;
            if (this.p == this.ln) {
                throw new ParseException("Unexpeced end of text", 0, 0);
            }
            char c2 = this.text.charAt(this.p);
            int b = this.p;
            if (c2 == '\'' || c2 == '\"') {
                boolean escaped = false;
                this.p++;
                while (this.p < this.ln) {
                    char c3 = this.text.charAt(this.p);
                    if (!escaped) {
                        if (c3 == '\\') {
                            escaped = true;
                        } else if (c3 == c2) {
                            break;
                        }
                    } else {
                        escaped = false;
                    }
                    this.p++;
                }
                if (this.p == this.ln) {
                    throw new ParseException(new StringBuffer().append("Missing ").append(c2).toString(), 0, 0);
                }
                this.p++;
                return this.text.substring(b, this.p);
            }
            do {
                c = this.text.charAt(this.p);
                if (!Character.isLetterOrDigit(c) && c != '/' && c != '\\' && c != '_' && c != '.' && c != '-' && c != '!' && c != '*' && c != '?') {
                    break;
                }
                this.p++;
            } while (this.p < this.ln);
            if (b == this.p) {
                throw new ParseException(new StringBuffer().append("Unexpected character: ").append(c).toString(), 0, 0);
            }
            return this.text.substring(b, this.p);
        }
    }
}
