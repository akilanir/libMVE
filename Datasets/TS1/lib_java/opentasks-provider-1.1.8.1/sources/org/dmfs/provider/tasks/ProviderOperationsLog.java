package org.dmfs.provider.tasks;

import android.net.Uri;
import android.os.Bundle;
import java.util.ArrayList;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/ProviderOperationsLog.class */
public class ProviderOperationsLog {
    private ArrayList<Uri> mUris = new ArrayList<>(16);
    private ArrayList<Integer> mOperations = new ArrayList<>(16);

    public void log(ProviderOperation providerOperation, Uri uri) {
        synchronized (this) {
            this.mUris.add(uri);
            this.mOperations.add(Integer.valueOf(providerOperation.ordinal()));
        }
    }

    public Bundle toBundle(Bundle bundle, boolean z) {
        if (bundle == null) {
            bundle = new Bundle(2);
        }
        synchronized (this) {
            bundle.putParcelableArrayList(TaskContract.EXTRA_OPERATIONS_URIS, this.mUris);
            bundle.putIntegerArrayList(TaskContract.EXTRA_OPERATIONS, this.mOperations);
            if (z) {
                this.mUris = new ArrayList<>(16);
                this.mOperations = new ArrayList<>(16);
            }
        }
        return bundle;
    }

    public Bundle toBundle(boolean z) {
        return toBundle(null, z);
    }

    public boolean isEmpty() {
        return this.mUris.size() == 0;
    }
}
