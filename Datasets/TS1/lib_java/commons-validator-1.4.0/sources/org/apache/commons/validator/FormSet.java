package org.apache.commons.validator;

import java.io.Serializable;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/FormSet.class */
public class FormSet implements Serializable {
    private static final long serialVersionUID = -8936513232763306055L;
    private transient Log log;
    private boolean processed;
    private String language;
    private String country;
    private String variant;
    private Map forms;
    private Map constants;
    protected static final int GLOBAL_FORMSET = 1;
    protected static final int LANGUAGE_FORMSET = 2;
    protected static final int COUNTRY_FORMSET = 3;
    protected static final int VARIANT_FORMSET = 4;
    private boolean merged;
    static Class class$org$apache$commons$validator$FormSet;

    public FormSet() {
        Class cls;
        if (class$org$apache$commons$validator$FormSet == null) {
            cls = class$("org.apache.commons.validator.FormSet");
            class$org$apache$commons$validator$FormSet = cls;
        } else {
            cls = class$org$apache$commons$validator$FormSet;
        }
        this.log = LogFactory.getLog(cls);
        this.processed = false;
        this.language = null;
        this.country = null;
        this.variant = null;
        this.forms = new HashMap();
        this.constants = new HashMap();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError().initCause(x1);
        }
    }

    protected boolean isMerged() {
        return this.merged;
    }

    protected int getType() {
        if (getVariant() != null) {
            if (getLanguage() == null || getCountry() == null) {
                throw new NullPointerException("When variant is specified, country and language must be specified.");
            }
            return 4;
        }
        if (getCountry() != null) {
            if (getLanguage() == null) {
                throw new NullPointerException("When country is specified, language must be specified.");
            }
            return COUNTRY_FORMSET;
        }
        if (getLanguage() != null) {
            return 2;
        }
        return 1;
    }

    protected void merge(FormSet depends) {
        if (depends != null) {
            Map pForms = getForms();
            Map dForms = depends.getForms();
            for (Map.Entry entry : dForms.entrySet()) {
                Object key = entry.getKey();
                Form pForm = (Form) pForms.get(key);
                if (pForm != null) {
                    pForm.merge((Form) entry.getValue());
                } else {
                    addForm((Form) entry.getValue());
                }
            }
        }
        this.merged = true;
    }

    public boolean isProcessed() {
        return this.processed;
    }

    public String getLanguage() {
        return this.language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCountry() {
        return this.country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getVariant() {
        return this.variant;
    }

    public void setVariant(String variant) {
        this.variant = variant;
    }

    public void addConstant(String name, String value) {
        if (this.constants.containsKey(name)) {
            getLog().error(new StringBuffer().append("Constant '").append(name).append("' already exists in FormSet[").append(displayKey()).append("] - ignoring.").toString());
        } else {
            this.constants.put(name, value);
        }
    }

    public void addForm(Form f) {
        String formName = f.getName();
        if (this.forms.containsKey(formName)) {
            getLog().error(new StringBuffer().append("Form '").append(formName).append("' already exists in FormSet[").append(displayKey()).append("] - ignoring.").toString());
        } else {
            this.forms.put(f.getName(), f);
        }
    }

    public Form getForm(String formName) {
        return (Form) this.forms.get(formName);
    }

    public Map getForms() {
        return Collections.unmodifiableMap(this.forms);
    }

    synchronized void process(Map globalConstants) {
        for (Form f : this.forms.values()) {
            f.process(globalConstants, this.constants, this.forms);
        }
        this.processed = true;
    }

    public String displayKey() {
        StringBuffer results = new StringBuffer();
        if (this.language != null && this.language.length() > 0) {
            results.append("language=");
            results.append(this.language);
        }
        if (this.country != null && this.country.length() > 0) {
            if (results.length() > 0) {
                results.append(", ");
            }
            results.append("country=");
            results.append(this.country);
        }
        if (this.variant != null && this.variant.length() > 0) {
            if (results.length() > 0) {
                results.append(", ");
            }
            results.append("variant=");
            results.append(this.variant);
        }
        if (results.length() == 0) {
            results.append("default");
        }
        return results.toString();
    }

    public String toString() {
        StringBuffer results = new StringBuffer();
        results.append("FormSet: language=");
        results.append(this.language);
        results.append("  country=");
        results.append(this.country);
        results.append("  variant=");
        results.append(this.variant);
        results.append("\n");
        Iterator i = getForms().values().iterator();
        while (i.hasNext()) {
            results.append("   ");
            results.append(i.next());
            results.append("\n");
        }
        return results.toString();
    }

    private Log getLog() {
        Class cls;
        if (this.log == null) {
            if (class$org$apache$commons$validator$FormSet == null) {
                cls = class$("org.apache.commons.validator.FormSet");
                class$org$apache$commons$validator$FormSet = cls;
            } else {
                cls = class$org$apache$commons$validator$FormSet;
            }
            this.log = LogFactory.getLog(cls);
        }
        return this.log;
    }
}
