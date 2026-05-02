package com.mikepenz.materialdrawer.holder;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.DrawableRes;
import android.widget.ImageView;
import com.mikepenz.iconics.IconicsDrawable;
import com.mikepenz.iconics.typeface.IIcon;
import com.mikepenz.materialdrawer.util.DrawerImageLoader;
import com.mikepenz.materialdrawer.util.DrawerUIUtils;
import com.mikepenz.materialdrawer.util.PressedEffectStateListDrawable;
import com.mikepenz.materialize.util.UIUtils;
import java.io.FileNotFoundException;
import java.io.InputStream;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/holder/ImageHolder.class */
public class ImageHolder {
    private Uri mUri;
    private Drawable mIcon;
    private Bitmap mBitmap;
    private int mIconRes;
    private IIcon mIIcon;

    public ImageHolder(String url) {
        this.mIconRes = -1;
        this.mUri = Uri.parse(url);
    }

    public ImageHolder(Uri uri) {
        this.mIconRes = -1;
        this.mUri = uri;
    }

    public ImageHolder(Drawable icon) {
        this.mIconRes = -1;
        this.mIcon = icon;
    }

    public ImageHolder(Bitmap bitmap) {
        this.mIconRes = -1;
        this.mBitmap = bitmap;
    }

    public ImageHolder(@DrawableRes int iconRes) {
        this.mIconRes = -1;
        this.mIconRes = iconRes;
    }

    public ImageHolder(IIcon iicon) {
        this.mIconRes = -1;
        this.mIIcon = iicon;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public Drawable getIcon() {
        return this.mIcon;
    }

    public Bitmap getBitmap() {
        return this.mBitmap;
    }

    public int getIconRes() {
        return this.mIconRes;
    }

    public IIcon getIIcon() {
        return this.mIIcon;
    }

    public boolean applyTo(ImageView imageView) {
        return applyTo(imageView, (String) null);
    }

    public boolean applyTo(ImageView imageView, String tag) {
        if (this.mUri != null) {
            if ("http".equals(this.mUri.getScheme()) || "https".equals(this.mUri.getScheme())) {
                DrawerImageLoader.getInstance().setImage(imageView, this.mUri, tag);
                return true;
            }
            imageView.setImageURI(this.mUri);
            return true;
        }
        if (this.mIcon != null) {
            imageView.setImageDrawable(this.mIcon);
            return true;
        }
        if (this.mBitmap != null) {
            imageView.setImageBitmap(this.mBitmap);
            return true;
        }
        if (this.mIconRes != -1) {
            imageView.setImageResource(this.mIconRes);
            return true;
        }
        if (this.mIIcon != null) {
            imageView.setImageDrawable(new IconicsDrawable(imageView.getContext(), this.mIIcon).actionBar());
            return true;
        }
        imageView.setImageBitmap(null);
        return false;
    }

    public Drawable decideIcon(Context ctx, int iconColor, boolean tint, int paddingDp) {
        Drawable icon = this.mIcon;
        if (this.mIIcon != null) {
            icon = new IconicsDrawable(ctx, this.mIIcon).color(iconColor).sizeDp(24).paddingDp(paddingDp);
        } else if (this.mIconRes != -1) {
            icon = UIUtils.getCompatDrawable(ctx, this.mIconRes);
        } else if (this.mUri != null) {
            try {
                InputStream inputStream = ctx.getContentResolver().openInputStream(this.mUri);
                icon = Drawable.createFromStream(inputStream, this.mUri.toString());
            } catch (FileNotFoundException e) {
            }
        }
        if (icon != null && tint && this.mIIcon == null) {
            icon = icon.mutate();
            icon.setColorFilter(iconColor, PorterDuff.Mode.SRC_IN);
        }
        return icon;
    }

    public static boolean applyTo(ImageHolder imageHolder, ImageView imageView) {
        return applyTo(imageHolder, imageView, null);
    }

    public static boolean applyTo(ImageHolder imageHolder, ImageView imageView, String tag) {
        if (imageHolder != null && imageView != null) {
            return imageHolder.applyTo(imageView, tag);
        }
        return false;
    }

    public static void applyToOrSetInvisible(ImageHolder imageHolder, ImageView imageView) {
        applyToOrSetInvisible(imageHolder, imageView, null);
    }

    public static void applyToOrSetInvisible(ImageHolder imageHolder, ImageView imageView, String tag) {
        boolean imageSet = applyTo(imageHolder, imageView, tag);
        if (imageView != null) {
            if (imageSet) {
                imageView.setVisibility(0);
            } else {
                imageView.setVisibility(4);
            }
        }
    }

    public static void applyToOrSetGone(ImageHolder imageHolder, ImageView imageView) {
        applyToOrSetGone(imageHolder, imageView, null);
    }

    public static void applyToOrSetGone(ImageHolder imageHolder, ImageView imageView, String tag) {
        boolean imageSet = applyTo(imageHolder, imageView, tag);
        if (imageView != null) {
            if (imageSet) {
                imageView.setVisibility(0);
            } else {
                imageView.setVisibility(8);
            }
        }
    }

    public static Drawable decideIcon(ImageHolder imageHolder, Context ctx, int iconColor, boolean tint, int paddingDp) {
        if (imageHolder == null) {
            return null;
        }
        return imageHolder.decideIcon(ctx, iconColor, tint, paddingDp);
    }

    public static void applyDecidedIconOrSetGone(ImageHolder imageHolder, ImageView imageView, int iconColor, boolean tint, int paddingDp) {
        if (imageHolder == null || imageView == null) {
            if (imageView != null) {
                imageView.setVisibility(8);
                return;
            }
            return;
        }
        Drawable drawable = decideIcon(imageHolder, imageView.getContext(), iconColor, tint, paddingDp);
        if (drawable != null) {
            imageView.setImageDrawable(drawable);
            imageView.setVisibility(0);
        } else if (imageHolder.getBitmap() != null) {
            imageView.setImageBitmap(imageHolder.getBitmap());
            imageView.setVisibility(0);
        } else {
            imageView.setVisibility(8);
        }
    }

    public static void applyMultiIconTo(Drawable icon, int iconColor, Drawable selectedIcon, int selectedIconColor, boolean tinted, ImageView imageView) {
        if (icon != null) {
            if (selectedIcon != null) {
                imageView.setImageDrawable(DrawerUIUtils.getIconStateList(icon, selectedIcon));
            } else if (tinted) {
                imageView.setImageDrawable(new PressedEffectStateListDrawable(icon, iconColor, selectedIconColor));
            } else {
                imageView.setImageDrawable(icon);
            }
            imageView.setVisibility(0);
            return;
        }
        imageView.setVisibility(8);
    }
}
