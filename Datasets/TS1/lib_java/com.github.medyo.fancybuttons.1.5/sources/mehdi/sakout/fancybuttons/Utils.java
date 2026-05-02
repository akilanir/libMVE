package mehdi.sakout.fancybuttons;

import android.content.Context;

/* loaded from: com.github.medyo.fancybuttons.1.5.jar:mehdi/sakout/fancybuttons/Utils.class */
public class Utils {
    public static int pxToSp(Context context, float px) {
        return Math.round(px / context.getResources().getDisplayMetrics().scaledDensity);
    }

    public static int spToPx(Context context, float sp) {
        return Math.round(sp * context.getResources().getDisplayMetrics().scaledDensity);
    }
}
