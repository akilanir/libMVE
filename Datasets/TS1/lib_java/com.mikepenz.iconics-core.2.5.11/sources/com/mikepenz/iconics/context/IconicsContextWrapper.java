package com.mikepenz.iconics.context;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.view.LayoutInflater;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/context/IconicsContextWrapper.class */
public class IconicsContextWrapper extends ContextWrapper {
    private LayoutInflater mInflater;

    private IconicsContextWrapper(Context base) {
        super(base);
    }

    public static ContextWrapper wrap(Context base) {
        return new IconicsContextWrapper(base);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public Resources getResources() {
        return super.getResources();
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public Object getSystemService(String name) {
        if ("layout_inflater".equals(name)) {
            if (this.mInflater == null) {
                this.mInflater = new InternalLayoutInflater(LayoutInflater.from(getBaseContext()), this, false);
            }
            return this.mInflater;
        }
        return super.getSystemService(name);
    }
}
