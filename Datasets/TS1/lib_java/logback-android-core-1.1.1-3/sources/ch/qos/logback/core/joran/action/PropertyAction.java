package ch.qos.logback.core.joran.action;

import ch.qos.logback.core.joran.action.ActionUtil;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.pattern.util.RegularEscapeUtil;
import ch.qos.logback.core.util.Loader;
import ch.qos.logback.core.util.OptionHelper;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;
import org.xml.sax.Attributes;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/PropertyAction.class */
public class PropertyAction extends Action {
    static final String RESOURCE_ATTRIBUTE = "resource";
    static String INVALID_ATTRIBUTES = "In <property> element, either the \"file\" attribute alone, or the \"resource\" element alone, or both the \"name\" and \"value\" attributes must be set.";

    @Override // ch.qos.logback.core.joran.action.Action
    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) {
        if ("substitutionProperty".equals(str)) {
            addWarn("[substitutionProperty] element has been deprecated. Please use the [property] element instead.");
        }
        String value = attributes.getValue(Action.NAME_ATTRIBUTE);
        String value2 = attributes.getValue("value");
        ActionUtil.Scope stringToScope = ActionUtil.stringToScope(attributes.getValue(Action.SCOPE_ATTRIBUTE));
        if (checkFileAttributeSanity(attributes)) {
            String subst = interpretationContext.subst(attributes.getValue(Action.FILE_ATTRIBUTE));
            try {
                loadAndSetProperties(interpretationContext, new FileInputStream(subst), stringToScope);
                return;
            } catch (FileNotFoundException e) {
                addError("Could not find properties file [" + subst + "].");
                return;
            } catch (IOException e2) {
                addError("Could not read properties file [" + subst + "].", e2);
                return;
            }
        }
        if (!checkResourceAttributeSanity(attributes)) {
            if (checkValueNameAttributesSanity(attributes)) {
                ActionUtil.setProperty(interpretationContext, value, interpretationContext.subst(RegularEscapeUtil.basicEscape(value2).trim()), stringToScope);
                return;
            } else {
                addError(INVALID_ATTRIBUTES);
                return;
            }
        }
        String subst2 = interpretationContext.subst(attributes.getValue(RESOURCE_ATTRIBUTE));
        URL resourceBySelfClassLoader = Loader.getResourceBySelfClassLoader(subst2);
        if (resourceBySelfClassLoader == null) {
            addError("Could not find resource [" + subst2 + "].");
            return;
        }
        try {
            loadAndSetProperties(interpretationContext, resourceBySelfClassLoader.openStream(), stringToScope);
        } catch (IOException e3) {
            addError("Could not read resource file [" + subst2 + "].", e3);
        }
    }

    void loadAndSetProperties(InterpretationContext interpretationContext, InputStream inputStream, ActionUtil.Scope scope) throws IOException {
        Properties properties = new Properties();
        properties.load(inputStream);
        inputStream.close();
        ActionUtil.setProperties(interpretationContext, properties, scope);
    }

    boolean checkFileAttributeSanity(Attributes attributes) {
        return !OptionHelper.isEmpty(attributes.getValue(Action.FILE_ATTRIBUTE)) && OptionHelper.isEmpty(attributes.getValue(Action.NAME_ATTRIBUTE)) && OptionHelper.isEmpty(attributes.getValue("value")) && OptionHelper.isEmpty(attributes.getValue(RESOURCE_ATTRIBUTE));
    }

    boolean checkResourceAttributeSanity(Attributes attributes) {
        return !OptionHelper.isEmpty(attributes.getValue(RESOURCE_ATTRIBUTE)) && OptionHelper.isEmpty(attributes.getValue(Action.NAME_ATTRIBUTE)) && OptionHelper.isEmpty(attributes.getValue("value")) && OptionHelper.isEmpty(attributes.getValue(Action.FILE_ATTRIBUTE));
    }

    boolean checkValueNameAttributesSanity(Attributes attributes) {
        return !OptionHelper.isEmpty(attributes.getValue(Action.NAME_ATTRIBUTE)) && !OptionHelper.isEmpty(attributes.getValue("value")) && OptionHelper.isEmpty(attributes.getValue(Action.FILE_ATTRIBUTE)) && OptionHelper.isEmpty(attributes.getValue(RESOURCE_ATTRIBUTE));
    }

    @Override // ch.qos.logback.core.joran.action.Action
    public void end(InterpretationContext interpretationContext, String str) {
    }

    public void finish(InterpretationContext interpretationContext) {
    }
}
