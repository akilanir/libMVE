package com.googlecode.androidannotations.api;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/BackgroundExecutor.class */
public class BackgroundExecutor {
    private static Executor executor = Executors.newCachedThreadPool();

    public static void execute(Runnable runnable) {
        executor.execute(runnable);
    }

    public static void setExecutor(Executor executor2) {
        executor = executor2;
    }
}
