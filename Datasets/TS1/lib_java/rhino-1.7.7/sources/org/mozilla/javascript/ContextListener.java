package org.mozilla.javascript;

import org.mozilla.javascript.ContextFactory;

@Deprecated
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/ContextListener.class */
public interface ContextListener extends ContextFactory.Listener {
    @Deprecated
    void contextEntered(Context context);

    @Deprecated
    void contextExited(Context context);
}
