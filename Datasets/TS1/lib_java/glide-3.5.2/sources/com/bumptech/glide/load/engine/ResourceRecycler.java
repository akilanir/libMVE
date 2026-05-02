package com.bumptech.glide.load.engine;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.bumptech.glide.util.Util;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/ResourceRecycler.class */
class ResourceRecycler {
    private boolean isRecycling;
    private final Handler handler = new Handler(Looper.getMainLooper(), new ResourceRecyclerCallback());

    ResourceRecycler() {
    }

    public void recycle(Resource<?> resource) {
        Util.assertMainThread();
        if (this.isRecycling) {
            this.handler.obtainMessage(1, resource).sendToTarget();
            return;
        }
        this.isRecycling = true;
        resource.recycle();
        this.isRecycling = false;
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/ResourceRecycler$ResourceRecyclerCallback.class */
    private static class ResourceRecyclerCallback implements Handler.Callback {
        public static final int RECYCLE_RESOURCE = 1;

        private ResourceRecyclerCallback() {
        }

        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message message) {
            if (message.what == 1) {
                Resource resource = (Resource) message.obj;
                resource.recycle();
                return true;
            }
            return false;
        }
    }
}
