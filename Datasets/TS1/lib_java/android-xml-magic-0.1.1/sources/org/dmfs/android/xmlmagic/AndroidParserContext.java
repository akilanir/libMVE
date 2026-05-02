package org.dmfs.android.xmlmagic;

import android.content.Context;
import android.content.res.Resources;
import org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver;
import org.dmfs.xmlobjects.pull.ParserContext;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/AndroidParserContext.class */
public class AndroidParserContext extends ParserContext {
    private final Context mAppContext;
    private final Resources mResources;
    private final ITokenResolver mResolver;

    public AndroidParserContext(Context context, ITokenResolver iTokenResolver) {
        this.mAppContext = context.getApplicationContext();
        this.mResources = context.getResources();
        this.mResolver = iTokenResolver;
    }

    public Resources getResources() {
        return this.mResources;
    }

    public Context getAppContext() {
        return this.mAppContext;
    }

    public ITokenResolver getResolver() {
        return this.mResolver;
    }
}
