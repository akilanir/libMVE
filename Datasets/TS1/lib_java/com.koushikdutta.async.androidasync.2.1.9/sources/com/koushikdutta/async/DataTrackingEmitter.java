package com.koushikdutta.async;

/* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/DataTrackingEmitter.class */
public interface DataTrackingEmitter extends DataEmitter {

    /* loaded from: com.koushikdutta.async.androidasync.2.1.9.jar:com/koushikdutta/async/DataTrackingEmitter$DataTracker.class */
    public interface DataTracker {
        void onData(int i);
    }

    void setDataTracker(DataTracker dataTracker);

    DataTracker getDataTracker();

    int getBytesRead();

    void setDataEmitter(DataEmitter dataEmitter);
}
