package com.koushikdutta.ion.builder;

import com.koushikdutta.ion.bitmap.PostProcess;
import com.koushikdutta.ion.bitmap.Transform;
import com.koushikdutta.ion.builder.BitmapBuilder;

/* loaded from: com.koushikdutta.ion.ion.2.1.9.jar:com/koushikdutta/ion/builder/BitmapBuilder.class */
public interface BitmapBuilder<B extends BitmapBuilder<?>> {
    B transform(Transform transform);

    B resize(int i, int i2);

    B resizeWidth(int i);

    B resizeHeight(int i);

    B centerCrop();

    B fitCenter();

    B centerInside();

    B fitXY();

    B smartSize(boolean z);

    B postProcess(PostProcess postProcess);
}
