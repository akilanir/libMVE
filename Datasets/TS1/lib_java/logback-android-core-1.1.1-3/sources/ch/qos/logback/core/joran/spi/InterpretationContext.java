package ch.qos.logback.core.joran.spi;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.joran.event.InPlayListener;
import ch.qos.logback.core.joran.event.SaxEvent;
import ch.qos.logback.core.spi.ContextAwareBase;
import ch.qos.logback.core.spi.PropertyContainer;
import ch.qos.logback.core.util.OptionHelper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Stack;
import org.xml.sax.Locator;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/InterpretationContext.class */
public class InterpretationContext extends ContextAwareBase implements PropertyContainer {
    Stack<Object> objectStack;
    Map<String, Object> objectMap;
    Map<String, String> propertiesMap;
    Interpreter joranInterpreter;
    final List<InPlayListener> listenerList = new ArrayList();
    DefaultNestedComponentRegistry defaultNestedComponentRegistry = new DefaultNestedComponentRegistry();

    public InterpretationContext(Context context, Interpreter interpreter) {
        this.context = context;
        this.joranInterpreter = interpreter;
        this.objectStack = new Stack<>();
        this.objectMap = new HashMap(5);
        this.propertiesMap = new HashMap(5);
    }

    public DefaultNestedComponentRegistry getDefaultNestedComponentRegistry() {
        return this.defaultNestedComponentRegistry;
    }

    @Override // ch.qos.logback.core.spi.PropertyContainer
    public Map<String, String> getCopyOfPropertyMap() {
        return new HashMap(this.propertiesMap);
    }

    void setPropertiesMap(Map<String, String> map) {
        this.propertiesMap = map;
    }

    String updateLocationInfo(String str) {
        Locator locator = this.joranInterpreter.getLocator();
        return locator != null ? str + locator.getLineNumber() + ":" + locator.getColumnNumber() : str;
    }

    public Locator getLocator() {
        return this.joranInterpreter.getLocator();
    }

    public Interpreter getJoranInterpreter() {
        return this.joranInterpreter;
    }

    public Stack<Object> getObjectStack() {
        return this.objectStack;
    }

    public boolean isEmpty() {
        return this.objectStack.isEmpty();
    }

    public Object peekObject() {
        return this.objectStack.peek();
    }

    public void pushObject(Object obj) {
        this.objectStack.push(obj);
    }

    public Object popObject() {
        return this.objectStack.pop();
    }

    public Object getObject(int i) {
        return this.objectStack.get(i);
    }

    public Map<String, Object> getObjectMap() {
        return this.objectMap;
    }

    public void addSubstitutionProperty(String str, String str2) {
        if (str == null || str2 == null) {
            return;
        }
        this.propertiesMap.put(str, str2.trim());
    }

    public void addSubstitutionProperties(Properties properties) {
        if (properties == null) {
            return;
        }
        for (String str : properties.keySet()) {
            addSubstitutionProperty(str, properties.getProperty(str));
        }
    }

    @Override // ch.qos.logback.core.spi.PropertyContainer
    public String getProperty(String str) {
        String str2 = this.propertiesMap.get(str);
        return str2 != null ? str2 : this.context.getProperty(str);
    }

    public String subst(String str) {
        if (str == null) {
            return null;
        }
        return OptionHelper.substVars(str, this, this.context);
    }

    public boolean isListenerListEmpty() {
        return this.listenerList.isEmpty();
    }

    public void addInPlayListener(InPlayListener inPlayListener) {
        if (this.listenerList.contains(inPlayListener)) {
            addWarn("InPlayListener " + inPlayListener + " has been already registered");
        } else {
            this.listenerList.add(inPlayListener);
        }
    }

    public boolean removeInPlayListener(InPlayListener inPlayListener) {
        return this.listenerList.remove(inPlayListener);
    }

    void fireInPlay(SaxEvent saxEvent) {
        Iterator<InPlayListener> it = this.listenerList.iterator();
        while (it.hasNext()) {
            it.next().inPlay(saxEvent);
        }
    }
}
