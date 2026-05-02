package org.dmfs.provider.tasks;

import android.net.Uri;
import java.util.HashMap;
import java.util.Map;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/UriFactory.class */
public class UriFactory {
    public final String authority;
    private final Map<String, Uri> mUriMap = new HashMap(16);

    UriFactory(String str) {
        this.authority = str;
        this.mUriMap.put((String) null, Uri.parse("content://" + str));
    }

    void addUri(String str) {
        this.mUriMap.put(str, Uri.parse("content://" + this.authority + "/" + str));
    }

    public Uri getUri() {
        return this.mUriMap.get(null);
    }

    public Uri getUri(String str) {
        return this.mUriMap.get(str);
    }
}
