package com.mikepenz.aboutlibraries;

import com.mikepenz.fastadapter.adapters.FastItemAdapter;
import java.io.Serializable;

/* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/LibTaskCallback.class */
public interface LibTaskCallback extends Serializable {
    void onLibTaskStarted();

    void onLibTaskFinished(FastItemAdapter fastItemAdapter);
}
