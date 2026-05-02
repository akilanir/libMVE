package com.koushikdutta.ion.builder;

import android.graphics.Bitmap;
import com.koushikdutta.ion.bitmap.BitmapInfo;

/* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders.class */
public interface Builders {

    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$Any.class */
    public interface Any {

        /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$Any$B.class */
        public interface B extends RequestBuilder<F, B, M, U>, F {
        }

        /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$Any$BF.class */
        public interface BF<A extends BF<?>> extends BitmapBuilder<A>, BitmapFutureBuilder, IF<A> {
        }

        /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$Any$F.class */
        public interface F extends FutureBuilder, ImageViewFutureBuilder {
        }

        /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$Any$IF.class */
        public interface IF<A extends IF<?>> extends ImageViewBuilder<A>, ImageViewFutureBuilder {
        }

        /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$Any$M.class */
        public interface M extends MultipartBodyBuilder<M>, F {
        }

        /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$Any$U.class */
        public interface U extends UrlEncodedBuilder<U>, F {
        }
    }

    /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$IV.class */
    public interface IV {

        /* loaded from: com.koushikdutta.ion.ion.2.1.7.jar:com/koushikdutta/ion/builder/Builders$IV$F.class */
        public interface F<A extends F<?>> extends ImageViewBuilder<A>, BitmapBuilder<A>, LoadImageViewFutureBuilder {
            BitmapInfo getBitmapInfo();

            Bitmap getBitmap();
        }
    }
}
