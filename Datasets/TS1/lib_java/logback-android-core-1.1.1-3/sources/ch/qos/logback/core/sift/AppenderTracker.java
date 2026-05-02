package ch.qos.logback.core.sift;

import ch.qos.logback.core.Appender;
import ch.qos.logback.core.Context;
import ch.qos.logback.core.helpers.NOPAppender;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.spi.AbstractComponentTracker;
import ch.qos.logback.core.spi.ContextAwareImpl;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/sift/AppenderTracker.class */
public class AppenderTracker<E> extends AbstractComponentTracker<Appender<E>> {
    int nopaWarningCount = 0;
    final Context context;
    final AppenderFactory<E> appenderFactory;
    final ContextAwareImpl contextAware;

    public AppenderTracker(Context context, AppenderFactory<E> appenderFactory) {
        this.context = context;
        this.appenderFactory = appenderFactory;
        this.contextAware = new ContextAwareImpl(context, this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ch.qos.logback.core.spi.AbstractComponentTracker
    public void processPriorToRemoval(Appender<E> appender) {
        appender.stop();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ch.qos.logback.core.spi.AbstractComponentTracker
    public Appender<E> buildComponent(String str) {
        NOPAppender<E> nOPAppender = null;
        try {
            nOPAppender = this.appenderFactory.buildAppender(this.context, str);
        } catch (JoranException e) {
            this.contextAware.addError("Error while building appender with discriminating value [" + str + "]");
        }
        if (nOPAppender == null) {
            nOPAppender = buildNOPAppender(str);
        }
        return nOPAppender;
    }

    private NOPAppender<E> buildNOPAppender(String str) {
        if (this.nopaWarningCount < 4) {
            this.nopaWarningCount++;
            this.contextAware.addError("Building NOPAppender for discriminating value [" + str + "]");
        }
        NOPAppender<E> nOPAppender = new NOPAppender<>();
        nOPAppender.setContext(this.context);
        nOPAppender.start();
        return nOPAppender;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ch.qos.logback.core.spi.AbstractComponentTracker
    public boolean isComponentStale(Appender<E> appender) {
        return !appender.isStarted();
    }
}
