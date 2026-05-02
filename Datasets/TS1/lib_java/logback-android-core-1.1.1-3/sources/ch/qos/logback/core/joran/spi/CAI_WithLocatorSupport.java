package ch.qos.logback.core.joran.spi;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.spi.ContextAwareImpl;
import org.xml.sax.Locator;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/spi/CAI_WithLocatorSupport.class */
class CAI_WithLocatorSupport extends ContextAwareImpl {
    CAI_WithLocatorSupport(Context context, Interpreter interpreter) {
        super(context, interpreter);
    }

    @Override // ch.qos.logback.core.spi.ContextAwareImpl
    protected Object getOrigin() {
        Locator locator = ((Interpreter) super.getOrigin()).locator;
        return locator != null ? Interpreter.class.getName() + "@" + locator.getLineNumber() + ":" + locator.getColumnNumber() : Interpreter.class.getName() + "@NA:NA";
    }
}
