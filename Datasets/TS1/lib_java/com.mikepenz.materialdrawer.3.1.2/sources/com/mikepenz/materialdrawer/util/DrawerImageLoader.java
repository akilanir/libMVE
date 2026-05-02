package com.mikepenz.materialdrawer.util;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.Log;
import android.widget.ImageView;

/* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/util/DrawerImageLoader.class */
public class DrawerImageLoader {
    private static DrawerImageLoader SINGLETON = null;
    private IDrawerImageLoader imageLoader;

    /* loaded from: com.mikepenz.materialdrawer.3.1.2.jar:com/mikepenz/materialdrawer/util/DrawerImageLoader$IDrawerImageLoader.class */
    public interface IDrawerImageLoader {
        void set(ImageView imageView, Uri uri, Drawable drawable);

        void cancel(ImageView imageView);

        Drawable placeholder(Context context);
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
            SINGLETON = new DrawerImageLoader(new IDrawerImageLoader() { // from class: com.mikepenz.materialdrawer.util.DrawerImageLoader.1
                @Override // com.mikepenz.materialdrawer.util.DrawerImageLoader.IDrawerImageLoader
                public void set(ImageView imageView, Uri uri, Drawable placeholder) {
                    Log.i("MaterialDrawer", "you have not specified a ImageLoader implementation through the DrawerImageLoader.init(IDrawerImageLoader) method");
                }

                @Override // com.mikepenz.materialdrawer.util.DrawerImageLoader.IDrawerImageLoader
                public void cancel(ImageView imageView) {
                }

                @Override // com.mikepenz.materialdrawer.util.DrawerImageLoader.IDrawerImageLoader
                public Drawable placeholder(Context ctx) {
                    return null;
                }
            });
        }
        return SINGLETON;
    }

    public void setImage(ImageView imageView, Uri uri) {
        if (this.imageLoader != null) {
            Drawable placeHolder = this.imageLoader.placeholder(imageView.getContext());
            if (placeHolder == null) {
                placeHolder = UIUtils.getPlaceHolder(imageView.getContext());
            }
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
