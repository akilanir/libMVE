package ch.qos.logback.classic.joran.action;

import ch.qos.logback.classic.spi.LoggerContextListener;
import ch.qos.logback.core.joran.action.Action;
import ch.qos.logback.core.joran.spi.ActionException;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.spi.ContextAware;
import ch.qos.logback.core.spi.LifeCycle;
import ch.qos.logback.core.util.OptionHelper;
import org.xml.sax.Attributes;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/joran/action/LoggerContextListenerAction.class */
public class LoggerContextListenerAction extends Action {
    boolean inError = false;
    LoggerContextListener lcl;

    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) throws ActionException {
        this.inError = false;
        String value = attributes.getValue("class");
        if (OptionHelper.isEmpty(value)) {
            addError("Mandatory \"class\" attribute not set for <loggerContextListener> element");
            this.inError = true;
            return;
        }
        try {
            this.lcl = (LoggerContextListener) OptionHelper.instantiateByClassName(value, LoggerContextListener.class, this.context);
            if (this.lcl instanceof ContextAware) {
                this.lcl.setContext(this.context);
            }
            interpretationContext.pushObject(this.lcl);
            addInfo("Adding LoggerContextListener of type [" + value + "] to the object stack");
        } catch (Exception e) {
            this.inError = true;
            addError("Could not create LoggerContextListener of type " + value + "].", e);
        }
    }

    public void end(InterpretationContext interpretationContext, String str) throws ActionException {
        if (this.inError) {
            return;
        }
        if (interpretationContext.peekObject() != this.lcl) {
            addWarn("The object on the top the of the stack is not the LoggerContextListener pushed earlier.");
            return;
        }
        if (this.lcl instanceof LifeCycle) {
            this.lcl.start();
            addInfo("Starting LoggerContextListener");
        }
        this.context.addListener(this.lcl);
        interpretationContext.popObject();
    }
}
