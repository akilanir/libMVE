package android.support.design.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.util.SparseArray;

/* loaded from: com.android.support.design.24.0.0.jar:android/support/design/internal/ParcelableSparseArray.class */
public class ParcelableSparseArray extends SparseArray<Parcelable> implements Parcelable {
    public static final Parcelable.Creator<ParcelableSparseArray> CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks<ParcelableSparseArray>() { // from class: android.support.design.internal.ParcelableSparseArray.1
        /* renamed from: createFromParcel, reason: merged with bridge method [inline-methods] */
        public ParcelableSparseArray m4createFromParcel(Parcel source, ClassLoader loader) {
            return new ParcelableSparseArray(source, loader);
        }

        /* renamed from: newArray, reason: merged with bridge method [inline-methods] */
        public ParcelableSparseArray[] m3newArray(int size) {
            return new ParcelableSparseArray[size];
        }
    });

    public ParcelableSparseArray() {
    }

    public ParcelableSparseArray(Parcel source, ClassLoader loader) {
        int size = source.readInt();
        int[] keys = new int[size];
        source.readIntArray(keys);
        Parcelable[] values = source.readParcelableArray(loader);
        for (int i = 0; i < size; i++) {
            put(keys[i], values[i]);
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        int size = size();
        int[] keys = new int[size];
        Parcelable[] values = new Parcelable[size];
        for (int i = 0; i < size; i++) {
            keys[i] = keyAt(i);
            values[i] = valueAt(i);
        }
        parcel.writeInt(size);
        parcel.writeIntArray(keys);
        parcel.writeParcelableArray(values, flags);
    }
}
