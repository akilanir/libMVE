package com.octo.android.robospice.request.listener;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/request/listener/RequestProgress.class */
public class RequestProgress {
    private RequestStatus status;
    private float progress;

    public RequestProgress(RequestStatus status) {
        this(status, 0.0f);
    }

    public RequestProgress(RequestStatus status, float progress) {
        this.status = status;
        this.progress = progress;
    }

    public RequestStatus getStatus() {
        return this.status;
    }

    public void setStatus(RequestStatus status) {
        this.status = status;
    }

    public float getProgress() {
        return this.progress;
    }

    public void setProgress(float progress) {
        this.progress = progress;
    }
}
