package org.acra.builder;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.HashMap;
import java.util.Map;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/builder/ReportBuilder.class */
public final class ReportBuilder {
    private String message;
    private Thread uncaughtExceptionThread;
    private Throwable exception;
    private final Map<String, String> customData = new HashMap();
    private boolean sendSilently = false;
    private boolean endApplication = false;

    @NonNull
    public ReportBuilder message(@Nullable String msg) {
        this.message = msg;
        return this;
    }

    @Nullable
    public String getMessage() {
        return this.message;
    }

    @NonNull
    public ReportBuilder uncaughtExceptionThread(@Nullable Thread thread) {
        this.uncaughtExceptionThread = thread;
        return this;
    }

    @Nullable
    public Thread getUncaughtExceptionThread() {
        return this.uncaughtExceptionThread;
    }

    @NonNull
    public ReportBuilder exception(@Nullable Throwable e) {
        this.exception = e;
        return this;
    }

    @Nullable
    public Throwable getException() {
        return this.exception;
    }

    @NonNull
    public ReportBuilder customData(@NonNull Map<String, String> customData) {
        this.customData.putAll(customData);
        return this;
    }

    @NonNull
    public ReportBuilder customData(@NonNull String key, String value) {
        this.customData.put(key, value);
        return this;
    }

    @NonNull
    public Map<String, String> getCustomData() {
        return this.customData;
    }

    @NonNull
    public ReportBuilder sendSilently() {
        this.sendSilently = true;
        return this;
    }

    public boolean isSendSilently() {
        return this.sendSilently;
    }

    @NonNull
    public ReportBuilder endApplication() {
        this.endApplication = true;
        return this;
    }

    public boolean isEndApplication() {
        return this.endApplication;
    }

    public void build(@NonNull ReportExecutor reportExecutor) {
        if (this.message == null && this.exception == null) {
            this.message = "Report requested by developer";
        }
        reportExecutor.execute(this);
    }
}
