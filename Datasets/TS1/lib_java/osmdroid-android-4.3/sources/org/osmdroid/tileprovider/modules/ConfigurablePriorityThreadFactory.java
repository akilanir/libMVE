package org.osmdroid.tileprovider.modules;

import java.util.concurrent.ThreadFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/ConfigurablePriorityThreadFactory.class */
public class ConfigurablePriorityThreadFactory implements ThreadFactory {
    private final int mPriority;
    private final String mName;

    public ConfigurablePriorityThreadFactory(int pPriority, String pName) {
        this.mPriority = pPriority;
        this.mName = pName;
    }

    @Override // java.util.concurrent.ThreadFactory
    public Thread newThread(Runnable pRunnable) {
        Thread thread = new Thread(pRunnable);
        thread.setPriority(this.mPriority);
        if (this.mName != null) {
            thread.setName(this.mName);
        }
        return thread;
    }
}
