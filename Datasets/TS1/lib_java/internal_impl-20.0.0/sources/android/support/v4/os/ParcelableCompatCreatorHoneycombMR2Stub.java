package android.support.v4.os;

import android.os.Parcelable;

/* compiled from: ParcelableCompatHoneycombMR2.java */
/* loaded from: internal_impl-20.0.0.jar:android/support/v4/os/ParcelableCompatCreatorHoneycombMR2Stub.class */
class ParcelableCompatCreatorHoneycombMR2Stub {
    ParcelableCompatCreatorHoneycombMR2Stub() {
    }

    static <T> Parcelable.Creator<T> instantiate(ParcelableCompatCreatorCallbacks<T> callbacks) {
        return new ParcelableCompatCreatorHoneycombMR2(callbacks);
    }
}
