package ch.qos.logback.core;

import ch.qos.logback.core.spi.ContextAwareBase;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/LayoutBase.class */
public abstract class LayoutBase<E> extends ContextAwareBase implements Layout<E> {
    protected boolean started;
    String fileHeader;
    String fileFooter;
    String presentationHeader;
    String presentationFooter;

    @Override // ch.qos.logback.core.spi.ContextAwareBase, ch.qos.logback.core.spi.ContextAware
    public void setContext(Context context) {
        this.context = context;
    }

    @Override // ch.qos.logback.core.spi.ContextAwareBase, ch.qos.logback.core.spi.ContextAware
    public Context getContext() {
        return this.context;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void start() {
        this.started = true;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public void stop() {
        this.started = false;
    }

    @Override // ch.qos.logback.core.spi.LifeCycle
    public boolean isStarted() {
        return this.started;
    }

    @Override // ch.qos.logback.core.Layout
    public String getFileHeader() {
        return this.fileHeader;
    }

    @Override // ch.qos.logback.core.Layout
    public String getPresentationHeader() {
        return this.presentationHeader;
    }

    @Override // ch.qos.logback.core.Layout
    public String getPresentationFooter() {
        return this.presentationFooter;
    }

    @Override // ch.qos.logback.core.Layout
    public String getFileFooter() {
        return this.fileFooter;
    }

    @Override // ch.qos.logback.core.Layout
    public String getContentType() {
        return "text/plain";
    }

    public void setFileHeader(String str) {
        this.fileHeader = str;
    }

    public void setFileFooter(String str) {
        this.fileFooter = str;
    }

    public void setPresentationHeader(String str) {
        this.presentationHeader = str;
    }

    public void setPresentationFooter(String str) {
        this.presentationFooter = str;
    }
}
