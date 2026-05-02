package com.bumptech.glide.manager;

import com.bumptech.glide.request.Request;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/manager/RequestTracker.class */
public class RequestTracker {
    private final Set<Request> requests = Collections.newSetFromMap(new WeakHashMap());
    private final List<Request> pendingRequests = new ArrayList();
    private boolean isPaused;

    public void runRequest(Request request) {
        this.requests.add(request);
        if (!this.isPaused) {
            request.begin();
        } else {
            this.pendingRequests.add(request);
        }
    }

    void addRequest(Request request) {
        this.requests.add(request);
    }

    public void removeRequest(Request request) {
        this.requests.remove(request);
        this.pendingRequests.remove(request);
    }

    public boolean isPaused() {
        return this.isPaused;
    }

    public void pauseRequests() {
        this.isPaused = true;
        for (Request request : getSnapshot()) {
            if (request.isRunning()) {
                request.pause();
                this.pendingRequests.add(request);
            }
        }
    }

    public void resumeRequests() {
        this.isPaused = false;
        for (Request request : getSnapshot()) {
            if (!request.isComplete() && !request.isCancelled() && !request.isRunning()) {
                request.begin();
            }
        }
        this.pendingRequests.clear();
    }

    public void clearRequests() {
        for (Request request : getSnapshot()) {
            request.clear();
        }
        this.pendingRequests.clear();
    }

    public void restartRequests() {
        for (Request request : getSnapshot()) {
            if (!request.isComplete() && !request.isCancelled()) {
                request.pause();
                if (!this.isPaused) {
                    request.begin();
                } else {
                    this.pendingRequests.add(request);
                }
            }
        }
    }

    private List<Request> getSnapshot() {
        List<Request> result = new ArrayList<>(this.requests.size());
        for (Request request : this.requests) {
            result.add(request);
        }
        return result;
    }
}
