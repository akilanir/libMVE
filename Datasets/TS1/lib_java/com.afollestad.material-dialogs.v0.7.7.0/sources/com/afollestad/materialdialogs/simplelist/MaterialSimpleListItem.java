package com.afollestad.materialdialogs.simplelist;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.StringRes;
import android.support.v4.content.ContextCompat;

/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/simplelist/MaterialSimpleListItem.class */
public class MaterialSimpleListItem {
    private Builder mBuilder;

    private MaterialSimpleListItem(Builder builder) {
        this.mBuilder = builder;
    }

    public Drawable getIcon() {
        return this.mBuilder.mIcon;
    }

    public CharSequence getContent() {
        return this.mBuilder.mContent;
    }

    /* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder.class */
    public static class Builder {
        private Context mContext;
        protected Drawable mIcon;
        protected CharSequence mContent;

        public Builder(Context context) {
            this.mContext = context;
        }

        public Builder icon(Drawable icon) {
            this.mIcon = icon;
            return this;
        }

        public Builder icon(@DrawableRes int iconRes) {
            return icon(ContextCompat.getDrawable(this.mContext, iconRes));
        }

        public Builder content(CharSequence content) {
            this.mContent = content;
            return this;
        }

        public Builder content(@StringRes int contentRes) {
            return content(this.mContext.getString(contentRes));
        }

        public MaterialSimpleListItem build() {
            return new MaterialSimpleListItem(this);
        }
    }

    public String toString() {
        if (getContent() != null) {
            return getContent().toString();
        }
        return "(no content)";
    }
}
