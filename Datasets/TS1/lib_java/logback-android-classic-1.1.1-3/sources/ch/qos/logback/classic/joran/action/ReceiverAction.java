package ch.qos.logback.classic.joran.action;

import ch.qos.logback.classic.net.ReceiverBase;
import ch.qos.logback.core.joran.action.Action;
import ch.qos.logback.core.joran.spi.ActionException;
import ch.qos.logback.core.joran.spi.InterpretationContext;
import ch.qos.logback.core.util.OptionHelper;
import org.xml.sax.Attributes;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/joran/action/ReceiverAction.class */
public class ReceiverAction extends Action {
    private ReceiverBase receiver;
    private boolean inError;

    public void begin(InterpretationContext interpretationContext, String str, Attributes attributes) throws ActionException {
        String value = attributes.getValue("class");
        if (OptionHelper.isEmpty(value)) {
            addError("Missing class name for receiver. Near [" + str + "] line " + getLineNumber(interpretationContext));
            this.inError = true;
            return;
        }
        try {
            addInfo("About to instantiate receiver of type [" + value + "]");
            this.receiver = (ReceiverBase) OptionHelper.instantiateByClassName(value, ReceiverBase.class, this.context);
            this.receiver.setContext(this.context);
            interpretationContext.pushObject(this.receiver);
        } catch (Exception e) {
            this.inError = true;
            addError("Could not create a receiver of type [" + value + "].", e);
            throw new ActionException(e);
        }
    }

    public void end(InterpretationContext interpretationContext, String str) throws ActionException {
        if (this.inError) {
            return;
        }
        interpretationContext.getContext().register(this.receiver);
        this.receiver.start();
        if (interpretationContext.peekObject() != this.receiver) {
            addWarn("The object at the of the stack is not the remote pushed earlier.");
        } else {
            interpretationContext.popObject();
        }
    }
}
