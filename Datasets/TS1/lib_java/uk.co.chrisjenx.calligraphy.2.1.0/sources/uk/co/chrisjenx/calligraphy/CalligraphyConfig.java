package uk.co.chrisjenx.calligraphy;

import android.R;
import android.os.Build;
import android.text.TextUtils;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.MultiAutoCompleteTextView;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.ToggleButton;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyConfig.class */
public class CalligraphyConfig {
    private static final Map<Class<? extends TextView>, Integer> DEFAULT_STYLES = new HashMap();
    private static CalligraphyConfig sInstance;
    private final boolean mIsFontSet;
    private final String mFontPath;
    private final int mAttrId;
    private final boolean mReflection;
    private final boolean mCustomViewCreation;
    private final Map<Class<? extends TextView>, Integer> mClassStyleAttributeMap;

    static {
        DEFAULT_STYLES.put(TextView.class, Integer.valueOf(R.attr.textViewStyle));
        DEFAULT_STYLES.put(Button.class, Integer.valueOf(R.attr.buttonStyle));
        DEFAULT_STYLES.put(EditText.class, Integer.valueOf(R.attr.editTextStyle));
        DEFAULT_STYLES.put(AutoCompleteTextView.class, Integer.valueOf(R.attr.autoCompleteTextViewStyle));
        DEFAULT_STYLES.put(MultiAutoCompleteTextView.class, Integer.valueOf(R.attr.autoCompleteTextViewStyle));
        DEFAULT_STYLES.put(CheckBox.class, Integer.valueOf(R.attr.checkboxStyle));
        DEFAULT_STYLES.put(RadioButton.class, Integer.valueOf(R.attr.radioButtonStyle));
        DEFAULT_STYLES.put(ToggleButton.class, Integer.valueOf(R.attr.buttonStyleToggle));
    }

    public static void initDefault(CalligraphyConfig calligraphyConfig) {
        sInstance = calligraphyConfig;
    }

    public static CalligraphyConfig get() {
        if (sInstance == null) {
            sInstance = new CalligraphyConfig(new Builder());
        }
        return sInstance;
    }

    protected CalligraphyConfig(Builder builder) {
        this.mIsFontSet = builder.isFontSet;
        this.mFontPath = builder.fontAssetPath;
        this.mAttrId = builder.attrId;
        this.mReflection = builder.reflection;
        this.mCustomViewCreation = builder.customViewCreation;
        Map<Class<? extends TextView>, Integer> tempMap = new HashMap<>(DEFAULT_STYLES);
        tempMap.putAll(builder.mStyleClassMap);
        this.mClassStyleAttributeMap = Collections.unmodifiableMap(tempMap);
    }

    public String getFontPath() {
        return this.mFontPath;
    }

    boolean isFontSet() {
        return this.mIsFontSet;
    }

    public boolean isReflection() {
        return this.mReflection;
    }

    public boolean isCustomViewCreation() {
        return this.mCustomViewCreation;
    }

    Map<Class<? extends TextView>, Integer> getClassStyles() {
        return this.mClassStyleAttributeMap;
    }

    public int getAttrId() {
        return this.mAttrId;
    }

    /* loaded from: uk.co.chrisjenx.calligraphy.2.1.0.jar:uk/co/chrisjenx/calligraphy/CalligraphyConfig$Builder.class */
    public static class Builder {
        public static final int INVALID_ATTR_ID = -1;
        private boolean reflection;
        private boolean customViewCreation;
        private int attrId;
        private boolean isFontSet;
        private String fontAssetPath;
        private Map<Class<? extends TextView>, Integer> mStyleClassMap;

        public Builder() {
            this.reflection = Build.VERSION.SDK_INT >= 11;
            this.customViewCreation = true;
            this.attrId = R.attr.fontPath;
            this.isFontSet = false;
            this.fontAssetPath = null;
            this.mStyleClassMap = new HashMap();
        }

        public Builder setFontAttrId(int fontAssetAttrId) {
            this.attrId = fontAssetAttrId != -1 ? fontAssetAttrId : -1;
            return this;
        }

        public Builder setDefaultFontPath(String defaultFontAssetPath) {
            this.isFontSet = !TextUtils.isEmpty(defaultFontAssetPath);
            this.fontAssetPath = defaultFontAssetPath;
            return this;
        }

        public Builder disablePrivateFactoryInjection() {
            this.reflection = false;
            return this;
        }

        public Builder disableCustomViewInflation() {
            this.customViewCreation = false;
            return this;
        }

        public Builder addCustomStyle(Class<? extends TextView> styleClass, int styleResourceAttribute) {
            if (styleClass == null || styleResourceAttribute == 0) {
                return this;
            }
            this.mStyleClassMap.put(styleClass, Integer.valueOf(styleResourceAttribute));
            return this;
        }

        public CalligraphyConfig build() {
            this.isFontSet = !TextUtils.isEmpty(this.fontAssetPath);
            return new CalligraphyConfig(this);
        }
    }
}
