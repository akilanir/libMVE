package com.octo.android.robospice.priority;

import java.util.concurrent.ThreadFactory;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/priority/CustomizablePriorityThreadFactory.class */
public class CustomizablePriorityThreadFactory implements ThreadFactory {
    private int threadPriority;

    public CustomizablePriorityThreadFactory(int threadPriority) {
        this.threadPriority = 1;
        this.threadPriority = threadPriority;
    }

    public CustomizablePriorityThreadFactory() {
        this(1);
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable runnable) {
        Thread thread = new Thread(runnable);
        thread.setPriority(this.threadPriority);
        return thread;
    }
}
