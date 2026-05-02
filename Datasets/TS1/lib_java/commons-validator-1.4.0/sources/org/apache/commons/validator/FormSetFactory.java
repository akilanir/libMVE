package org.apache.commons.validator;

import org.apache.commons.digester.AbstractObjectCreationFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xml.sax.Attributes;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/FormSetFactory.class */
public class FormSetFactory extends AbstractObjectCreationFactory {
    private transient Log log;
    static Class class$org$apache$commons$validator$FormSetFactory;

    public FormSetFactory() {
        Class cls;
        if (class$org$apache$commons$validator$FormSetFactory == null) {
            cls = class$("org.apache.commons.validator.FormSetFactory");
            class$org$apache$commons$validator$FormSetFactory = cls;
        } else {
            cls = class$org$apache$commons$validator$FormSetFactory;
        }
        this.log = LogFactory.getLog(cls);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError().initCause(x1);
        }
    }

    public Object createObject(Attributes attributes) throws Exception {
        ValidatorResources resources = (ValidatorResources) this.digester.peek(0);
        String language = attributes.getValue("language");
        String country = attributes.getValue("country");
        String variant = attributes.getValue("variant");
        return createFormSet(resources, language, country, variant);
    }

    private FormSet createFormSet(ValidatorResources resources, String language, String country, String variant) throws Exception {
        FormSet formSet = resources.getFormSet(language, country, variant);
        if (formSet != null) {
            if (getLog().isDebugEnabled()) {
                getLog().debug(new StringBuffer().append("FormSet[").append(formSet.displayKey()).append("] found - merging.").toString());
            }
            return formSet;
        }
        FormSet formSet2 = new FormSet();
        formSet2.setLanguage(language);
        formSet2.setCountry(country);
        formSet2.setVariant(variant);
        resources.addFormSet(formSet2);
        if (getLog().isDebugEnabled()) {
            getLog().debug(new StringBuffer().append("FormSet[").append(formSet2.displayKey()).append("] created.").toString());
        }
        return formSet2;
    }

    private Log getLog() {
        Class cls;
        if (this.log == null) {
            if (class$org$apache$commons$validator$FormSetFactory == null) {
                cls = class$("org.apache.commons.validator.FormSetFactory");
                class$org$apache$commons$validator$FormSetFactory = cls;
            } else {
                cls = class$org$apache$commons$validator$FormSetFactory;
            }
            this.log = LogFactory.getLog(cls);
        }
        return this.log;
    }
}
