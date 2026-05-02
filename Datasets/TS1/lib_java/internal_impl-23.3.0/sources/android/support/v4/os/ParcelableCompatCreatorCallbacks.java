package android.support.v4.os;

import android.os.Parcel;

/* loaded from: internal_impl-23.3.0.jar:android/support/v4/os/ParcelableCompatCreatorCallbacks.class */
public interface ParcelableCompatCreatorCallbacks<T> {
    T createFromParcel(Parcel parcel, ClassLoader classLoader);

    T[] newArray(int i);
}
