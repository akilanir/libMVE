package jp.wasabeef.glide.transformations.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.renderscript.Allocation;
import android.renderscript.Element;
import android.renderscript.RSRuntimeException;
import android.renderscript.RenderScript;
import android.renderscript.ScriptIntrinsicBlur;

/* loaded from: jp.wasabeef.glide-transformations.2.0.1.jar:jp/wasabeef/glide/transformations/internal/RSBlur.class */
public class RSBlur {
    @TargetApi(18)
    public static Bitmap blur(Context context, Bitmap bitmap, int radius) throws RSRuntimeException {
        RenderScript rs = null;
        try {
            rs = RenderScript.create(context);
            rs.setMessageHandler(new RenderScript.RSMessageHandler());
            Allocation input = Allocation.createFromBitmap(rs, bitmap, Allocation.MipmapControl.MIPMAP_NONE, 1);
            Allocation output = Allocation.createTyped(rs, input.getType());
            ScriptIntrinsicBlur blur = ScriptIntrinsicBlur.create(rs, Element.U8_4(rs));
            blur.setInput(input);
            blur.setRadius(radius);
            blur.forEach(output);
            output.copyTo(bitmap);
            if (rs != null) {
                rs.destroy();
            }
            return bitmap;
        } catch (Throwable th) {
            if (rs != null) {
                rs.destroy();
            }
            throw th;
        }
    }
}
