package com.nostra13.universalimageloader.core.decode;

import android.graphics.Bitmap;
import java.io.IOException;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/core/decode/ImageDecoder.class */
public interface ImageDecoder {
    Bitmap decode(ImageDecodingInfo imageDecodingInfo) throws IOException;
}
