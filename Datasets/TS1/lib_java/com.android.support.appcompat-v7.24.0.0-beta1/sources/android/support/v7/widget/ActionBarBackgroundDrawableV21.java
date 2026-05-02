package android.support.v7.widget;

import android.graphics.Outline;
import android.support.annotation.NonNull;

/* loaded from: com.android.support.appcompat-v7.24.0.0-beta1.jar:android/support/v7/widget/ActionBarBackgroundDrawableV21.class */
class ActionBarBackgroundDrawableV21 extends ActionBarBackgroundDrawable {
    public ActionBarBackgroundDrawableV21(ActionBarContainer container) {
        super(container);
    }

    @Override // android.graphics.drawable.Drawable
    public void getOutline(@NonNull Outline outline) {
        if (this.mContainer.mIsSplit) {
            if (this.mContainer.mSplitBackground != null) {
                this.mContainer.mSplitBackground.getOutline(outline);
            }
        } else if (this.mContainer.mBackground != null) {
            this.mContainer.mBackground.getOutline(outline);
        }
    }
}
