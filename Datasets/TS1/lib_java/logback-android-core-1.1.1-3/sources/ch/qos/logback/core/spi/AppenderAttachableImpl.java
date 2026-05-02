package ch.qos.logback.core.spi;

import ch.qos.logback.core.Appender;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/spi/AppenderAttachableImpl.class */
public class AppenderAttachableImpl<E> implements AppenderAttachable<E> {
    private final CopyOnWriteArrayList<Appender<E>> appenderList = new CopyOnWriteArrayList<>();
    static final long START = System.currentTimeMillis();

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public void addAppender(Appender<E> appender) {
        if (appender == null) {
            throw new IllegalArgumentException("Null argument disallowed");
        }
        this.appenderList.addIfAbsent(appender);
    }

    public int appendLoopOnAppenders(E e) {
        int i = 0;
        Iterator<Appender<E>> it = this.appenderList.iterator();
        while (it.hasNext()) {
            it.next().doAppend(e);
            i++;
        }
        return i;
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public Iterator<Appender<E>> iteratorForAppenders() {
        return this.appenderList.iterator();
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public Appender<E> getAppender(String str) {
        if (str == null) {
            return null;
        }
        Iterator<Appender<E>> it = this.appenderList.iterator();
        while (it.hasNext()) {
            Appender<E> next = it.next();
            if (str.equals(next.getName())) {
                return next;
            }
        }
        return null;
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public boolean isAttached(Appender<E> appender) {
        if (appender == null) {
            return false;
        }
        Iterator<Appender<E>> it = this.appenderList.iterator();
        while (it.hasNext()) {
            if (it.next() == appender) {
                return true;
            }
        }
        return false;
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public void detachAndStopAllAppenders() {
        Iterator<Appender<E>> it = this.appenderList.iterator();
        while (it.hasNext()) {
            it.next().stop();
        }
        this.appenderList.clear();
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public boolean detachAppender(Appender<E> appender) {
        if (appender == null) {
            return false;
        }
        return this.appenderList.remove(appender);
    }

    @Override // ch.qos.logback.core.spi.AppenderAttachable
    public boolean detachAppender(String str) {
        if (str == null) {
            return false;
        }
        boolean z = false;
        Iterator<Appender<E>> it = this.appenderList.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            Appender<E> next = it.next();
            if (str.equals(next.getName())) {
                z = this.appenderList.remove(next);
                break;
            }
        }
        return z;
    }
}
