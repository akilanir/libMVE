package org.joda.time.base;

/* loaded from: joda-time-2.6.jar:org/joda/time/base/BaseLocal.class */
public abstract class BaseLocal extends AbstractPartial {
    private static final long serialVersionUID = 276453175381783L;

    protected abstract long getLocalMillis();

    protected BaseLocal() {
    }
}
