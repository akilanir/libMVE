package com.mikepenz.materialdrawer.util;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.widget.ImageView;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/util/DrawerImageLoader.class */
public class DrawerImageLoader {
    private static DrawerImageLoader SINGLETON = null;
    private IDrawerImageLoader imageLoader;

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader.class */
    public interface IDrawerImageLoader {
        void set(ImageView imageView, Uri uri, Drawable drawable);

        void cancel(ImageView imageView);

        Drawable placeholder(Context context);

        Drawable placeholder(Context context, String str);
    }

    /* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/util/DrawerImageLoader$Tags.class */
    public enum Tags {
        PROFILE,
        PROFILE_DRAWER_ITEM,
        ACCOUNT_HEADER
    }

    private DrawerImageLoader(IDrawerImageLoader loaderImpl) {
        this.imageLoader = loaderImpl;
    }

    public static DrawerImageLoader init(IDrawerImageLoader loaderImpl) {
        SINGLETON = new DrawerImageLoader(loaderImpl);
        return SINGLETON;
    }

    public static DrawerImageLoader getInstance() {
        if (SINGLETON == null) {
            SINGLETON = new DrawerImageLoader(new AbstractDrawerImageLoader() { // from class: com.mikepenz.materialdrawer.util.DrawerImageLoader.1
            });
        }
        return SINGLETON;
    }

    public void setImage(ImageView imageView, Uri uri, String tag) {
        if (this.imageLoader != null) {
            Drawable placeHolder = this.imageLoader.placeholder(imageView.getContext(), tag);
            this.imageLoader.set(imageView, uri, placeHolder);
        }
    }

    public void cancelImage(ImageView imageView) {
        if (this.imageLoader != null) {
            this.imageLoader.cancel(imageView);
        }
    }

    public IDrawerImageLoader getImageLoader() {
        return this.imageLoader;
    }

    public void setImageLoader(IDrawerImageLoader imageLoader) {
        this.imageLoader = imageLoader;
    }
}
