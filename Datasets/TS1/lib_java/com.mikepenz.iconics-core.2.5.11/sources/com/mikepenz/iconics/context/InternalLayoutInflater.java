package com.mikepenz.iconics.context;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/context/InternalLayoutInflater.class */
class InternalLayoutInflater extends LayoutInflater {
    private static final String[] sClassPrefixList = {"android.widget.", "android.webkit."};
    private final IconicsFactory mIconicsFactory;
    private boolean mSetPrivateFactory;
    private Field mConstructorArgs;

    protected InternalLayoutInflater(Context context) {
        super(context);
        this.mSetPrivateFactory = false;
        this.mConstructorArgs = null;
        this.mIconicsFactory = new IconicsFactory();
        setUpLayoutFactories(false);
    }

    protected InternalLayoutInflater(LayoutInflater original, Context newContext, boolean cloned) {
        super(original, newContext);
        this.mSetPrivateFactory = false;
        this.mConstructorArgs = null;
        this.mIconicsFactory = new IconicsFactory();
        setUpLayoutFactories(cloned);
    }

    @Override // android.view.LayoutInflater
    public LayoutInflater cloneInContext(Context newContext) {
        return new InternalLayoutInflater(this, newContext, true);
    }

    @Override // android.view.LayoutInflater
    protected View onCreateView(String name, AttributeSet attrs) throws ClassNotFoundException {
        View view = null;
        for (String prefix : sClassPrefixList) {
            try {
                view = createView(name, prefix, attrs);
            } catch (ClassNotFoundException e) {
            }
        }
        if (view == null) {
            view = super.onCreateView(name, attrs);
        }
        return this.mIconicsFactory.onViewCreated(view, view.getContext(), attrs);
    }

    @Override // android.view.LayoutInflater
    protected View onCreateView(View parent, String name, AttributeSet attrs) throws ClassNotFoundException {
        return this.mIconicsFactory.onViewCreated(super.onCreateView(parent, name, attrs), getContext(), attrs);
    }

    @Override // android.view.LayoutInflater
    public View inflate(XmlPullParser parser, ViewGroup root, boolean attachToRoot) {
        setPrivateFactoryInternal();
        return super.inflate(parser, root, attachToRoot);
    }

    private void setUpLayoutFactories(boolean cloned) {
        if (cloned) {
            return;
        }
        if (Build.VERSION.SDK_INT >= 11 && getFactory2() != null && !(getFactory2() instanceof WrapperFactory2)) {
            setFactory2(getFactory2());
        }
        if (getFactory() != null && !(getFactory() instanceof WrapperFactory)) {
            setFactory(getFactory());
        }
    }

    @Override // android.view.LayoutInflater
    public void setFactory(LayoutInflater.Factory factory) {
        if (!(factory instanceof WrapperFactory)) {
            super.setFactory(new WrapperFactory(factory, this, this.mIconicsFactory));
        } else {
            super.setFactory(factory);
        }
    }

    @Override // android.view.LayoutInflater
    @TargetApi(11)
    public void setFactory2(LayoutInflater.Factory2 factory2) {
        if (!(factory2 instanceof WrapperFactory2)) {
            super.setFactory2(new WrapperFactory2(factory2, this.mIconicsFactory));
        } else {
            super.setFactory2(factory2);
        }
    }

    private void setPrivateFactoryInternal() {
        if (this.mSetPrivateFactory) {
            return;
        }
        boolean reflection = Build.VERSION.SDK_INT >= 11;
        if (!reflection) {
            return;
        }
        if (!(getContext() instanceof LayoutInflater.Factory2)) {
            this.mSetPrivateFactory = true;
            return;
        }
        Method setPrivateFactoryMethod = ReflectionUtils.getMethod(LayoutInflater.class, "setPrivateFactory");
        if (setPrivateFactoryMethod != null) {
            ReflectionUtils.invokeMethod(this, setPrivateFactoryMethod, new PrivateWrapperFactory2((LayoutInflater.Factory2) getContext(), this, this.mIconicsFactory));
        }
        this.mSetPrivateFactory = true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public View createCustomViewInternal(View parent, View view, String name, Context viewContext, AttributeSet attrs) {
        if (1 == 0) {
            return view;
        }
        if (view == null && name.indexOf(46) > -1) {
            if (this.mConstructorArgs == null) {
                this.mConstructorArgs = ReflectionUtils.getField(LayoutInflater.class, "mConstructorArgs");
            }
            Object[] mConstructorArgsArr = (Object[]) ReflectionUtils.getValue(this.mConstructorArgs, this);
            Object lastContext = mConstructorArgsArr[0];
            mConstructorArgsArr[0] = viewContext;
            ReflectionUtils.setValue(this.mConstructorArgs, this, mConstructorArgsArr);
            try {
                view = createView(name, null, attrs);
                mConstructorArgsArr[0] = lastContext;
                ReflectionUtils.setValue(this.mConstructorArgs, this, mConstructorArgsArr);
            } catch (ClassNotFoundException e) {
                mConstructorArgsArr[0] = lastContext;
                ReflectionUtils.setValue(this.mConstructorArgs, this, mConstructorArgsArr);
            } catch (Throwable th) {
                mConstructorArgsArr[0] = lastContext;
                ReflectionUtils.setValue(this.mConstructorArgs, this, mConstructorArgsArr);
                throw th;
            }
        }
        return view;
    }

    /* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory.class */
    private static class WrapperFactory implements LayoutInflater.Factory {
        private final LayoutInflater.Factory mFactory;
        private final InternalLayoutInflater mInflater;
        private final IconicsFactory mIconicsFactory;

        public WrapperFactory(LayoutInflater.Factory factory, InternalLayoutInflater inflater, IconicsFactory iconicsFactory) {
            this.mFactory = factory;
            this.mInflater = inflater;
            this.mIconicsFactory = iconicsFactory;
        }

        @Override // android.view.LayoutInflater.Factory
        public View onCreateView(String name, Context context, AttributeSet attrs) {
            if (Build.VERSION.SDK_INT < 11) {
                return this.mIconicsFactory.onViewCreated(this.mInflater.createCustomViewInternal(null, this.mFactory.onCreateView(name, context, attrs), name, context, attrs), context, attrs);
            }
            return this.mIconicsFactory.onViewCreated(this.mFactory.onCreateView(name, context, attrs), context, attrs);
        }
    }

    @TargetApi(11)
    /* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/context/InternalLayoutInflater$WrapperFactory2.class */
    private static class WrapperFactory2 implements LayoutInflater.Factory2 {
        protected final LayoutInflater.Factory2 mFactory2;
        protected final IconicsFactory mIconicsFactory;

        public WrapperFactory2(LayoutInflater.Factory2 factory2, IconicsFactory iconicsFactory) {
            this.mFactory2 = factory2;
            this.mIconicsFactory = iconicsFactory;
        }

        @Override // android.view.LayoutInflater.Factory
        public View onCreateView(String name, Context context, AttributeSet attrs) {
            return this.mIconicsFactory.onViewCreated(this.mFactory2.onCreateView(name, context, attrs), context, attrs);
        }

        @Override // android.view.LayoutInflater.Factory2
        public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
            return this.mIconicsFactory.onViewCreated(this.mFactory2.onCreateView(parent, name, context, attrs), context, attrs);
        }
    }

    @TargetApi(11)
    /* loaded from: com.mikepenz.iconics-core.2.5.11.jar:com/mikepenz/iconics/context/InternalLayoutInflater$PrivateWrapperFactory2.class */
    private static class PrivateWrapperFactory2 extends WrapperFactory2 {
        private final InternalLayoutInflater mInflater;

        public PrivateWrapperFactory2(LayoutInflater.Factory2 factory2, InternalLayoutInflater inflater, IconicsFactory iconicsFactory) {
            super(factory2, iconicsFactory);
            this.mInflater = inflater;
        }

        @Override // com.mikepenz.iconics.context.InternalLayoutInflater.WrapperFactory2, android.view.LayoutInflater.Factory2
        public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
            return this.mIconicsFactory.onViewCreated(this.mInflater.createCustomViewInternal(parent, this.mFactory2.onCreateView(parent, name, context, attrs), name, context, attrs), context, attrs);
        }
    }
}
