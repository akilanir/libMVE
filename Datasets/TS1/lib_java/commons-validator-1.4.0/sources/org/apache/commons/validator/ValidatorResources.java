package org.apache.commons.validator;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.net.URL;
import java.util.Collections;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.collections.FastHashMap;
import org.apache.commons.digester.Digester;
import org.apache.commons.digester.Rule;
import org.apache.commons.digester.xmlrules.DigesterLoader;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/ValidatorResources.class */
public class ValidatorResources implements Serializable {
    private static final long serialVersionUID = -8203745881446239554L;
    private static final String VALIDATOR_RULES = "digester-rules.xml";
    private transient Log log;
    protected FastHashMap hFormSets;
    protected FastHashMap hConstants;
    protected FastHashMap hActions;
    protected FormSet defaultFormSet;
    private static final String ARGS_PATTERN = "form-validation/formset/form/field/arg";
    static Class class$org$apache$commons$validator$ValidatorResources;
    private static final String[] REGISTRATIONS = {"-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.0//EN", "/org/apache/commons/validator/resources/validator_1_0.dtd", "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.0.1//EN", "/org/apache/commons/validator/resources/validator_1_0_1.dtd", "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.1//EN", "/org/apache/commons/validator/resources/validator_1_1.dtd", "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.1.3//EN", "/org/apache/commons/validator/resources/validator_1_1_3.dtd", "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.2.0//EN", "/org/apache/commons/validator/resources/validator_1_2_0.dtd", "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.3.0//EN", "/org/apache/commons/validator/resources/validator_1_3_0.dtd", "-//Apache Software Foundation//DTD Commons Validator Rules Configuration 1.4.0//EN", "/org/apache/commons/validator/resources/validator_1_4_0.dtd"};
    protected static Locale defaultLocale = Locale.getDefault();

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError().initCause(x1);
        }
    }

    public ValidatorResources() {
        Class cls;
        if (class$org$apache$commons$validator$ValidatorResources == null) {
            cls = class$("org.apache.commons.validator.ValidatorResources");
            class$org$apache$commons$validator$ValidatorResources = cls;
        } else {
            cls = class$org$apache$commons$validator$ValidatorResources;
        }
        this.log = LogFactory.getLog(cls);
        this.hFormSets = new FastHashMap();
        this.hConstants = new FastHashMap();
        this.hActions = new FastHashMap();
    }

    public ValidatorResources(InputStream in) throws IOException, SAXException {
        this(new InputStream[]{in});
    }

    public ValidatorResources(InputStream[] streams) throws IOException, SAXException {
        Class cls;
        if (class$org$apache$commons$validator$ValidatorResources == null) {
            cls = class$("org.apache.commons.validator.ValidatorResources");
            class$org$apache$commons$validator$ValidatorResources = cls;
        } else {
            cls = class$org$apache$commons$validator$ValidatorResources;
        }
        this.log = LogFactory.getLog(cls);
        this.hFormSets = new FastHashMap();
        this.hConstants = new FastHashMap();
        this.hActions = new FastHashMap();
        Digester digester = initDigester();
        for (int i = 0; i < streams.length; i++) {
            if (streams[i] == null) {
                throw new IllegalArgumentException(new StringBuffer().append("Stream[").append(i).append("] is null").toString());
            }
            digester.push(this);
            digester.parse(streams[i]);
        }
        process();
    }

    public ValidatorResources(String uri) throws IOException, SAXException {
        this(new String[]{uri});
    }

    public ValidatorResources(String[] uris) throws IOException, SAXException {
        Class cls;
        if (class$org$apache$commons$validator$ValidatorResources == null) {
            cls = class$("org.apache.commons.validator.ValidatorResources");
            class$org$apache$commons$validator$ValidatorResources = cls;
        } else {
            cls = class$org$apache$commons$validator$ValidatorResources;
        }
        this.log = LogFactory.getLog(cls);
        this.hFormSets = new FastHashMap();
        this.hConstants = new FastHashMap();
        this.hActions = new FastHashMap();
        Digester digester = initDigester();
        for (String str : uris) {
            digester.push(this);
            digester.parse(str);
        }
        process();
    }

    public ValidatorResources(URL url) throws IOException, SAXException {
        this(new URL[]{url});
    }

    public ValidatorResources(URL[] urls) throws IOException, SAXException {
        Class cls;
        if (class$org$apache$commons$validator$ValidatorResources == null) {
            cls = class$("org.apache.commons.validator.ValidatorResources");
            class$org$apache$commons$validator$ValidatorResources = cls;
        } else {
            cls = class$org$apache$commons$validator$ValidatorResources;
        }
        this.log = LogFactory.getLog(cls);
        this.hFormSets = new FastHashMap();
        this.hConstants = new FastHashMap();
        this.hActions = new FastHashMap();
        Digester digester = initDigester();
        for (URL url : urls) {
            digester.push(this);
            digester.parse(url);
        }
        process();
    }

    private Digester initDigester() {
        Class cls;
        URL rulesUrl = getClass().getResource(VALIDATOR_RULES);
        if (rulesUrl == null) {
            if (class$org$apache$commons$validator$ValidatorResources == null) {
                cls = class$("org.apache.commons.validator.ValidatorResources");
                class$org$apache$commons$validator$ValidatorResources = cls;
            } else {
                cls = class$org$apache$commons$validator$ValidatorResources;
            }
            rulesUrl = cls.getResource(VALIDATOR_RULES);
        }
        if (getLog().isDebugEnabled()) {
            getLog().debug(new StringBuffer().append("Loading rules from '").append(rulesUrl).append("'").toString());
        }
        Digester digester = DigesterLoader.createDigester(rulesUrl);
        digester.setNamespaceAware(true);
        digester.setValidating(true);
        digester.setUseContextClassLoader(true);
        addOldArgRules(digester);
        for (int i = 0; i < REGISTRATIONS.length; i += 2) {
            URL url = getClass().getResource(REGISTRATIONS[i + 1]);
            if (url != null) {
                digester.register(REGISTRATIONS[i], url.toString());
            }
        }
        return digester;
    }

    private void addOldArgRules(Digester digester) {
        Rule rule = new Rule(this) { // from class: org.apache.commons.validator.ValidatorResources.1
            private final ValidatorResources this$0;

            {
                this.this$0 = this;
            }

            public void begin(String namespace, String name, Attributes attributes) throws Exception {
                Arg arg = new Arg();
                arg.setKey(attributes.getValue("key"));
                arg.setName(attributes.getValue("name"));
                if ("false".equalsIgnoreCase(attributes.getValue("resource"))) {
                    arg.setResource(false);
                }
                try {
                    arg.setPosition(Integer.parseInt(name.substring(3)));
                } catch (Exception ex) {
                    this.this$0.getLog().error(new StringBuffer().append("Error parsing Arg position: ").append(name).append(" ").append(arg).append(" ").append(ex).toString());
                }
                ((Field) getDigester().peek(0)).addArg(arg);
            }
        };
        digester.addRule("form-validation/formset/form/field/arg0", rule);
        digester.addRule("form-validation/formset/form/field/arg1", rule);
        digester.addRule("form-validation/formset/form/field/arg2", rule);
        digester.addRule("form-validation/formset/form/field/arg3", rule);
    }

    public void addFormSet(FormSet fs) {
        String key = buildKey(fs);
        if (key.length() == 0) {
            if (getLog().isWarnEnabled() && this.defaultFormSet != null) {
                getLog().warn("Overriding default FormSet definition.");
            }
            this.defaultFormSet = fs;
            return;
        }
        FormSet formset = (FormSet) this.hFormSets.get(key);
        if (formset == null) {
            if (getLog().isDebugEnabled()) {
                getLog().debug(new StringBuffer().append("Adding FormSet '").append(fs.toString()).append("'.").toString());
            }
        } else if (getLog().isWarnEnabled()) {
            getLog().warn(new StringBuffer().append("Overriding FormSet definition. Duplicate for locale: ").append(key).toString());
        }
        this.hFormSets.put(key, fs);
    }

    public void addConstant(String name, String value) {
        if (getLog().isDebugEnabled()) {
            getLog().debug(new StringBuffer().append("Adding Global Constant: ").append(name).append(",").append(value).toString());
        }
        this.hConstants.put(name, value);
    }

    public void addValidatorAction(ValidatorAction va) {
        va.init();
        this.hActions.put(va.getName(), va);
        if (getLog().isDebugEnabled()) {
            getLog().debug(new StringBuffer().append("Add ValidatorAction: ").append(va.getName()).append(",").append(va.getClassname()).toString());
        }
    }

    public ValidatorAction getValidatorAction(String key) {
        return (ValidatorAction) this.hActions.get(key);
    }

    public Map getValidatorActions() {
        return Collections.unmodifiableMap(this.hActions);
    }

    protected String buildKey(FormSet fs) {
        return buildLocale(fs.getLanguage(), fs.getCountry(), fs.getVariant());
    }

    private String buildLocale(String lang, String country, String variant) {
        String key = (lang == null || lang.length() <= 0) ? "" : lang;
        return new StringBuffer().append(new StringBuffer().append(key).append((country == null || country.length() <= 0) ? "" : new StringBuffer().append("_").append(country).toString()).toString()).append((variant == null || variant.length() <= 0) ? "" : new StringBuffer().append("_").append(variant).toString()).toString();
    }

    public Form getForm(Locale locale, String formKey) {
        return getForm(locale.getLanguage(), locale.getCountry(), locale.getVariant(), formKey);
    }

    public Form getForm(String language, String country, String variant, String formKey) {
        FormSet formSet;
        FormSet formSet2;
        FormSet formSet3;
        Form form = null;
        String key = buildLocale(language, country, variant);
        if (key.length() > 0 && (formSet3 = (FormSet) this.hFormSets.get(key)) != null) {
            form = formSet3.getForm(formKey);
        }
        if (form == null) {
            key = buildLocale(language, country, null);
            if (key.length() > 0 && (formSet2 = (FormSet) this.hFormSets.get(key)) != null) {
                form = formSet2.getForm(formKey);
            }
        }
        if (form == null) {
            key = buildLocale(language, null, null);
            if (key.length() > 0 && (formSet = (FormSet) this.hFormSets.get(key)) != null) {
                form = formSet.getForm(formKey);
            }
        }
        if (form == null) {
            form = this.defaultFormSet.getForm(formKey);
            key = "default";
        }
        if (form == null) {
            if (getLog().isWarnEnabled()) {
                getLog().warn(new StringBuffer().append("Form '").append(formKey).append("' not found for locale '").append(key).append("'").toString());
            }
        } else if (getLog().isDebugEnabled()) {
            getLog().debug(new StringBuffer().append("Form '").append(formKey).append("' found in formset '").append(key).append("' for locale '").append(key).append("'").toString());
        }
        return form;
    }

    public void process() {
        this.hFormSets.setFast(true);
        this.hConstants.setFast(true);
        this.hActions.setFast(true);
        processForms();
    }

    private void processForms() {
        if (this.defaultFormSet == null) {
            this.defaultFormSet = new FormSet();
        }
        this.defaultFormSet.process(this.hConstants);
        for (String key : this.hFormSets.keySet()) {
            FormSet fs = (FormSet) this.hFormSets.get(key);
            fs.merge(getParent(fs));
        }
        for (FormSet fs2 : this.hFormSets.values()) {
            if (!fs2.isProcessed()) {
                fs2.process(this.hConstants);
            }
        }
    }

    private FormSet getParent(FormSet fs) {
        FormSet parent = null;
        if (fs.getType() == 2) {
            parent = this.defaultFormSet;
        } else if (fs.getType() == 3) {
            parent = (FormSet) this.hFormSets.get(buildLocale(fs.getLanguage(), null, null));
            if (parent == null) {
                parent = this.defaultFormSet;
            }
        } else if (fs.getType() == 4) {
            parent = (FormSet) this.hFormSets.get(buildLocale(fs.getLanguage(), fs.getCountry(), null));
            if (parent == null) {
                parent = (FormSet) this.hFormSets.get(buildLocale(fs.getLanguage(), null, null));
                if (parent == null) {
                    parent = this.defaultFormSet;
                }
            }
        }
        return parent;
    }

    FormSet getFormSet(String language, String country, String variant) {
        String key = buildLocale(language, country, variant);
        if (key.length() == 0) {
            return this.defaultFormSet;
        }
        return (FormSet) this.hFormSets.get(key);
    }

    protected Map getFormSets() {
        return this.hFormSets;
    }

    protected Map getConstants() {
        return this.hConstants;
    }

    protected Map getActions() {
        return this.hActions;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Log getLog() {
        Class cls;
        if (this.log == null) {
            if (class$org$apache$commons$validator$ValidatorResources == null) {
                cls = class$("org.apache.commons.validator.ValidatorResources");
                class$org$apache$commons$validator$ValidatorResources = cls;
            } else {
                cls = class$org$apache$commons$validator$ValidatorResources;
            }
            this.log = LogFactory.getLog(cls);
        }
        return this.log;
    }
}
