package uk.co.senab.photoview.scrollerproxy;

import android.annotation.TargetApi;
import android.content.Context;

@TargetApi(14)
/* loaded from: library-1.2.2.jar:uk/co/senab/photoview/scrollerproxy/IcsScroller.class */
public class IcsScroller extends GingerScroller {
    public IcsScroller(Context context) {
        super(context);
    }

    @Override // uk.co.senab.photoview.scrollerproxy.GingerScroller, uk.co.senab.photoview.scrollerproxy.ScrollerProxy
    public boolean computeScrollOffset() {
        return this.mScroller.computeScrollOffset();
    }
}
