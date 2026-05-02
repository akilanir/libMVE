package android.support.v7.internal.app;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.internal.widget.ViewUtils;
import android.support.v7.widget.AppCompatAutoCompleteTextView;
import android.support.v7.widget.AppCompatButton;
import android.support.v7.widget.AppCompatCheckBox;
import android.support.v7.widget.AppCompatCheckedTextView;
import android.support.v7.widget.AppCompatEditText;
import android.support.v7.widget.AppCompatMultiAutoCompleteTextView;
import android.support.v7.widget.AppCompatRadioButton;
import android.support.v7.widget.AppCompatRatingBar;
import android.support.v7.widget.AppCompatSpinner;
import android.support.v7.widget.AppCompatTextView;
import android.util.AttributeSet;
import android.view.InflateException;
import android.view.View;
import java.lang.reflect.Constructor;
import java.util.HashMap;
import java.util.Map;

/* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/internal/app/AppCompatViewInflater.class */
public class AppCompatViewInflater {
    static final Class<?>[] sConstructorSignature = {Context.class, AttributeSet.class};
    private static final Map<String, Constructor<? extends View>> sConstructorMap = new HashMap();
    private final Context mContext;
    private final Object[] mConstructorArgs = new Object[2];

    public AppCompatViewInflater(Context context) {
        this.mContext = context;
    }

    public final View createView(View parent, String name, @NonNull Context context, @NonNull AttributeSet attrs, boolean inheritContext, boolean themeContext) {
        if (inheritContext && parent != null) {
            context = parent.getContext();
        }
        if (themeContext) {
            context = ViewUtils.themifyContext(context, attrs, true, true);
        }
        switch (name) {
            case "EditText":
                return new AppCompatEditText(context, attrs);
            case "Spinner":
                return new AppCompatSpinner(context, attrs);
            case "CheckBox":
                return new AppCompatCheckBox(context, attrs);
            case "RadioButton":
                return new AppCompatRadioButton(context, attrs);
            case "CheckedTextView":
                return new AppCompatCheckedTextView(context, attrs);
            case "AutoCompleteTextView":
                return new AppCompatAutoCompleteTextView(context, attrs);
            case "MultiAutoCompleteTextView":
                return new AppCompatMultiAutoCompleteTextView(context, attrs);
            case "RatingBar":
                return new AppCompatRatingBar(context, attrs);
            case "Button":
                return new AppCompatButton(context, attrs);
            case "TextView":
                return new AppCompatTextView(context, attrs);
            default:
                if (context != context) {
                    return createViewFromTag(context, name, attrs);
                }
                return null;
        }
    }

    private View createViewFromTag(Context context, String name, AttributeSet attrs) {
        if (name.equals("view")) {
            name = attrs.getAttributeValue(null, "class");
        }
        try {
            this.mConstructorArgs[0] = context;
            this.mConstructorArgs[1] = attrs;
            if (-1 == name.indexOf(46)) {
                View createView = createView(name, "android.widget.");
                this.mConstructorArgs[0] = null;
                this.mConstructorArgs[1] = null;
                return createView;
            }
            View createView2 = createView(name, null);
            this.mConstructorArgs[0] = null;
            this.mConstructorArgs[1] = null;
            return createView2;
        } catch (Exception e) {
            this.mConstructorArgs[0] = null;
            this.mConstructorArgs[1] = null;
            return null;
        } catch (Throwable th) {
            this.mConstructorArgs[0] = null;
            this.mConstructorArgs[1] = null;
            throw th;
        }
    }

    private View createView(String name, String prefix) throws ClassNotFoundException, InflateException {
        Constructor<? extends View> constructor = sConstructorMap.get(name);
        if (constructor == null) {
            try {
                constructor = this.mContext.getClassLoader().loadClass(prefix != null ? prefix + name : name).asSubclass(View.class).getConstructor(sConstructorSignature);
                sConstructorMap.put(name, constructor);
            } catch (Exception e) {
                return null;
            }
        }
        constructor.setAccessible(true);
        return constructor.newInstance(this.mConstructorArgs);
    }
}
