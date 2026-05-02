package uk.co.chrisjenx.calligraphy;

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

/* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyLayoutInflater.class */
class CalligraphyLayoutInflater extends LayoutInflater implements CalligraphyActivityFactory {
    private static final String[] sClassPrefixList = {"android.widget.", "android.webkit."};
    private final int mAttributeId;
    private final CalligraphyFactory mCalligraphyFactory;
    private boolean mSetPrivateFactory;
    private Field mConstructorArgs;

    protected CalligraphyLayoutInflater(Context context, int attributeId) {
        super(context);
        this.mSetPrivateFactory = false;
        this.mConstructorArgs = null;
        this.mAttributeId = attributeId;
        this.mCalligraphyFactory = new CalligraphyFactory(attributeId);
        setUpLayoutFactories(false);
    }

    protected CalligraphyLayoutInflater(LayoutInflater original, Context newContext, int attributeId, boolean cloned) {
        super(original, newContext);
        this.mSetPrivateFactory = false;
        this.mConstructorArgs = null;
        this.mAttributeId = attributeId;
        this.mCalligraphyFactory = new CalligraphyFactory(attributeId);
        setUpLayoutFactories(cloned);
    }

    @Override // android.view.LayoutInflater
    public LayoutInflater cloneInContext(Context newContext) {
        return new CalligraphyLayoutInflater(this, newContext, this.mAttributeId, true);
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
            super.setFactory(new WrapperFactory(factory, this, this.mCalligraphyFactory));
        } else {
            super.setFactory(factory);
        }
    }

    @Override // android.view.LayoutInflater
    @TargetApi(11)
    public void setFactory2(LayoutInflater.Factory2 factory2) {
        if (!(factory2 instanceof WrapperFactory2)) {
            super.setFactory2(new WrapperFactory2(factory2, this.mCalligraphyFactory));
        } else {
            super.setFactory2(factory2);
        }
    }

    private void setPrivateFactoryInternal() {
        if (!this.mSetPrivateFactory && CalligraphyConfig.get().isReflection()) {
            if (!(getContext() instanceof LayoutInflater.Factory2)) {
                this.mSetPrivateFactory = true;
                return;
            }
            Method setPrivateFactoryMethod = ReflectionUtils.getMethod(LayoutInflater.class, "setPrivateFactory");
            if (setPrivateFactoryMethod != null) {
                ReflectionUtils.invokeMethod(this, setPrivateFactoryMethod, new PrivateWrapperFactory2((LayoutInflater.Factory2) getContext(), this, this.mCalligraphyFactory));
            }
            this.mSetPrivateFactory = true;
        }
    }

    @Override // uk.co.chrisjenx.calligraphy.CalligraphyActivityFactory
    @TargetApi(11)
    public View onActivityCreateView(View parent, View view, String name, Context context, AttributeSet attrs) {
        return this.mCalligraphyFactory.onViewCreated(createCustomViewInternal(parent, view, name, context, attrs), context, attrs);
    }

    @Override // android.view.LayoutInflater
    @TargetApi(11)
    protected View onCreateView(View parent, String name, AttributeSet attrs) throws ClassNotFoundException {
        return this.mCalligraphyFactory.onViewCreated(super.onCreateView(parent, name, attrs), getContext(), attrs);
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
        return this.mCalligraphyFactory.onViewCreated(view, view.getContext(), attrs);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public View createCustomViewInternal(View parent, View view, String name, Context viewContext, AttributeSet attrs) {
        if (!CalligraphyConfig.get().isCustomViewCreation()) {
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

    /* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyLayoutInflater$WrapperFactory.class */
    private static class WrapperFactory implements LayoutInflater.Factory {
        private final LayoutInflater.Factory mFactory;
        private final CalligraphyLayoutInflater mInflater;
        private final CalligraphyFactory mCalligraphyFactory;

        public WrapperFactory(LayoutInflater.Factory factory, CalligraphyLayoutInflater inflater, CalligraphyFactory calligraphyFactory) {
            this.mFactory = factory;
            this.mInflater = inflater;
            this.mCalligraphyFactory = calligraphyFactory;
        }

        @Override // android.view.LayoutInflater.Factory
        public View onCreateView(String name, Context context, AttributeSet attrs) {
            if (Build.VERSION.SDK_INT < 11) {
                return this.mCalligraphyFactory.onViewCreated(this.mInflater.createCustomViewInternal(null, this.mFactory.onCreateView(name, context, attrs), name, context, attrs), context, attrs);
            }
            return this.mCalligraphyFactory.onViewCreated(this.mFactory.onCreateView(name, context, attrs), context, attrs);
        }
    }

    @TargetApi(11)
    /* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyLayoutInflater$WrapperFactory2.class */
    private static class WrapperFactory2 implements LayoutInflater.Factory2 {
        protected final LayoutInflater.Factory2 mFactory2;
        protected final CalligraphyFactory mCalligraphyFactory;

        public WrapperFactory2(LayoutInflater.Factory2 factory2, CalligraphyFactory calligraphyFactory) {
            this.mFactory2 = factory2;
            this.mCalligraphyFactory = calligraphyFactory;
        }

        @Override // android.view.LayoutInflater.Factory
        public View onCreateView(String name, Context context, AttributeSet attrs) {
            return this.mCalligraphyFactory.onViewCreated(this.mFactory2.onCreateView(name, context, attrs), context, attrs);
        }

        @Override // android.view.LayoutInflater.Factory2
        public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
            return this.mCalligraphyFactory.onViewCreated(this.mFactory2.onCreateView(parent, name, context, attrs), context, attrs);
        }
    }

    @TargetApi(11)
    /* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyLayoutInflater$PrivateWrapperFactory2.class */
    private static class PrivateWrapperFactory2 extends WrapperFactory2 {
        private final CalligraphyLayoutInflater mInflater;

        public PrivateWrapperFactory2(LayoutInflater.Factory2 factory2, CalligraphyLayoutInflater inflater, CalligraphyFactory calligraphyFactory) {
            super(factory2, calligraphyFactory);
            this.mInflater = inflater;
        }

        @Override // uk.co.chrisjenx.calligraphy.CalligraphyLayoutInflater.WrapperFactory2, android.view.LayoutInflater.Factory2
        public View onCreateView(View parent, String name, Context context, AttributeSet attrs) {
            return this.mCalligraphyFactory.onViewCreated(this.mInflater.createCustomViewInternal(parent, this.mFactory2.onCreateView(parent, name, context, attrs), name, context, attrs), context, attrs);
        }
    }
}
