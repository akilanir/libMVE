package pl.droidsonroids.gif;

import android.support.annotation.NonNull;
import java.io.IOException;

/* loaded from: pl.droidsonroids.gif.android-gif-drawable.1.1.14.jar:pl/droidsonroids/gif/GifIOException.class */
public class GifIOException extends IOException {
    private static final long serialVersionUID = 13038402904505L;

    @NonNull
    public final GifError reason;

    private GifIOException(@NonNull GifError reason) {
        super(reason.getFormattedDescription());
        this.reason = reason;
    }

    GifIOException(int errorCode) {
        this(GifError.fromCode(errorCode));
    }

    static GifIOException fromCode(int nativeErrorCode) {
        if (nativeErrorCode == GifError.NO_ERROR.errorCode) {
            return null;
        }
        return new GifIOException(nativeErrorCode);
    }
}
