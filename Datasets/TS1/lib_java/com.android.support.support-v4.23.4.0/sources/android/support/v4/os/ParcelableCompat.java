package android.support.v4.os;

import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;

/* loaded from: com.android.support.support-v4.23.4.0.jar:android/support/v4/os/ParcelableCompat.class */
public final class ParcelableCompat {
    public static <T> Parcelable.Creator<T> newCreator(ParcelableCompatCreatorCallbacks<T> callbacks) {
        if (Build.VERSION.SDK_INT >= 13) {
            return ParcelableCompatCreatorHoneycombMR2Stub.instantiate(callbacks);
        }
        return new CompatCreator(callbacks);
    }

    /* loaded from: com.android.support.support-v4.23.4.0.jar:android/support/v4/os/ParcelableCompat$CompatCreator.class */
    static class CompatCreator<T> implements Parcelable.Creator<T> {
        final ParcelableCompatCreatorCallbacks<T> mCallbacks;

        public CompatCreator(ParcelableCompatCreatorCallbacks<T> callbacks) {
            this.mCallbacks = callbacks;
        }

        @Override // android.os.Parcelable.Creator
        public T createFromParcel(Parcel parcel) {
            return (T) this.mCallbacks.createFromParcel(parcel, (ClassLoader) null);
        }

        @Override // android.os.Parcelable.Creator
        public T[] newArray(int i) {
            return (T[]) this.mCallbacks.newArray(i);
        }
    }

    private ParcelableCompat() {
    }
}
