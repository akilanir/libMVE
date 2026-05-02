package com.mikepenz.materialdrawer.util;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.Log;
import android.widget.ImageView;
import com.mikepenz.materialdrawer.util.DrawerImageLoader;

/* loaded from: com.mikepenz.materialdrawer.4.3.7.jar:com/mikepenz/materialdrawer/util/AbstractDrawerImageLoader.class */
public abstract class AbstractDrawerImageLoader implements DrawerImageLoader.IDrawerImageLoader {
    @Override // com.mikepenz.materialdrawer.util.DrawerImageLoader.IDrawerImageLoader
    public void set(ImageView imageView, Uri uri, Drawable placeholder) {
        Log.i("MaterialDrawer", "you have not specified a ImageLoader implementation through the DrawerImageLoader.init(IDrawerImageLoader) method");
    }

    @Override // com.mikepenz.materialdrawer.util.DrawerImageLoader.IDrawerImageLoader
    public void cancel(ImageView imageView) {
    }

    @Override // com.mikepenz.materialdrawer.util.DrawerImageLoader.IDrawerImageLoader
    public Drawable placeholder(Context ctx) {
        return DrawerUIUtils.getPlaceHolder(ctx);
    }

    @Override // com.mikepenz.materialdrawer.util.DrawerImageLoader.IDrawerImageLoader
    public Drawable placeholder(Context ctx, String tag) {
        return placeholder(ctx);
    }
}
