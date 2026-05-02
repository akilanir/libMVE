package com.bumptech.glide.load.engine;

import com.bumptech.glide.load.Key;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/EngineJobListener.class */
interface EngineJobListener {
    void onEngineJobComplete(Key key, EngineResource<?> engineResource);

    void onEngineJobCancelled(EngineJob engineJob, Key key);
}
