package com.afollestad.materialdialogs.simplelist;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.support.annotation.AttrRes;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.DimenRes;
import android.support.annotation.DrawableRes;
import android.support.annotation.IntRange;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.content.ContextCompat;
import android.util.TypedValue;
import com.afollestad.materialdialogs.util.DialogUtils;

/* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/simplelist/MaterialSimpleListItem.class */
public class MaterialSimpleListItem {
    private final Builder mBuilder;

    private MaterialSimpleListItem(Builder builder) {
        this.mBuilder = builder;
    }

    public Drawable getIcon() {
        return this.mBuilder.mIcon;
    }

    public CharSequence getContent() {
        return this.mBuilder.mContent;
    }

    public int getIconPadding() {
        return this.mBuilder.mIconPadding;
    }

    @ColorInt
    public int getBackgroundColor() {
        return this.mBuilder.mBackgroundColor;
    }

    public long getId() {
        return this.mBuilder.mId;
    }

    @Nullable
    public Object getTag() {
        return this.mBuilder.mTag;
    }

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/simplelist/MaterialSimpleListItem$Builder.class */
    public static class Builder {
        private final Context mContext;
        protected Drawable mIcon;
        protected CharSequence mContent;
        protected int mIconPadding;
        protected int mBackgroundColor = Color.parseColor("#BCBCBC");
        protected long mId;
        protected Object mTag;

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

        public Builder iconPadding(@IntRange(from = 0, to = 2147483647L) int padding) {
            this.mIconPadding = padding;
            return this;
        }

        public Builder iconPaddingDp(@IntRange(from = 0, to = 2147483647L) int paddingDp) {
            this.mIconPadding = (int) TypedValue.applyDimension(1, paddingDp, this.mContext.getResources().getDisplayMetrics());
            return this;
        }

        public Builder iconPaddingRes(@DimenRes int paddingRes) {
            return iconPadding(this.mContext.getResources().getDimensionPixelSize(paddingRes));
        }

        public Builder content(CharSequence content) {
            this.mContent = content;
            return this;
        }

        public Builder content(@StringRes int contentRes) {
            return content(this.mContext.getString(contentRes));
        }

        public Builder backgroundColor(@ColorInt int color) {
            this.mBackgroundColor = color;
            return this;
        }

        public Builder backgroundColorRes(@ColorRes int colorRes) {
            return backgroundColor(DialogUtils.getColor(this.mContext, colorRes));
        }

        public Builder backgroundColorAttr(@AttrRes int colorAttr) {
            return backgroundColor(DialogUtils.resolveColor(this.mContext, colorAttr));
        }

        public Builder id(long id) {
            this.mId = id;
            return this;
        }

        public Builder tag(@Nullable Object tag) {
            this.mTag = tag;
            return this;
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
