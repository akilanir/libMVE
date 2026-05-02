package pl.droidsonroids.gif;

import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.view.View;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifViewSavedState.class */
class GifViewSavedState extends View.BaseSavedState {
    final long[][] mStates;
    public static final Parcelable.Creator<GifViewSavedState> CREATOR = new Parcelable.Creator<GifViewSavedState>() { // from class: pl.droidsonroids.gif.GifViewSavedState.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public GifViewSavedState createFromParcel(Parcel in) {
            return new GifViewSavedState(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public GifViewSavedState[] newArray(int size) {
            return new GifViewSavedState[size];
        }
    };

    /* JADX WARN: Type inference failed for: r1v3, types: [long[], long[][]] */
    GifViewSavedState(Parcelable superState, Drawable... drawables) {
        super(superState);
        this.mStates = new long[drawables.length];
        for (int i = 0; i < drawables.length; i++) {
            Drawable drawable = drawables[i];
            if (drawable instanceof GifDrawable) {
                this.mStates[i] = ((GifDrawable) drawable).mNativeInfoHandle.getSavedState();
            } else {
                this.mStates[i] = null;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r1v3, types: [long[], long[][]] */
    private GifViewSavedState(Parcel in) {
        super(in);
        this.mStates = new long[in.readInt()];
        for (int i = 0; i < this.mStates.length; i++) {
            this.mStates[i] = in.createLongArray();
        }
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [long[], long[][]] */
    public GifViewSavedState(Parcelable superState, long[] savedState) {
        super(superState);
        this.mStates = new long[1];
        this.mStates[0] = savedState;
    }

    @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
    public void writeToParcel(@NonNull Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.mStates.length);
        for (long[] mState : this.mStates) {
            dest.writeLongArray(mState);
        }
    }

    void restoreState(Drawable drawable, int i) {
        if (this.mStates[i] != null && (drawable instanceof GifDrawable)) {
            GifDrawable gifDrawable = (GifDrawable) drawable;
            gifDrawable.startAnimation(gifDrawable.mNativeInfoHandle.restoreSavedState(this.mStates[i], gifDrawable.mBuffer));
        }
    }
}
