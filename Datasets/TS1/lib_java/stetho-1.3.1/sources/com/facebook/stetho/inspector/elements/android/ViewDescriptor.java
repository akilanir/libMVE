package com.facebook.stetho.inspector.elements.android;

import android.view.View;
import android.view.ViewDebug;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.StringUtil;
import com.facebook.stetho.common.android.ResourcesUtil;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.AttributeAccumulator;
import com.facebook.stetho.inspector.elements.StyleAccumulator;
import com.facebook.stetho.inspector.helper.IntegerFormatter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ViewDescriptor.class */
final class ViewDescriptor extends AbstractChainedDescriptor<View> implements HighlightableDescriptor {
    private static final String ID_NAME = "id";
    private static final String NONE_VALUE = "(none)";
    private static final String NONE_MAPPING = "<no mapping>";
    private final MethodInvoker mMethodInvoker;

    @Nullable
    private Pattern mWordBoundaryPattern;

    @GuardedBy("this")
    @Nullable
    private volatile List<ViewCSSProperty> mViewProperties;

    private Pattern getWordBoundaryPattern() {
        if (this.mWordBoundaryPattern == null) {
            this.mWordBoundaryPattern = Pattern.compile("(?<=\\p{Lower})(?=\\p{Upper})");
        }
        return this.mWordBoundaryPattern;
    }

    private List<ViewCSSProperty> getViewProperties() {
        if (this.mViewProperties == null) {
            synchronized (this) {
                if (this.mViewProperties == null) {
                    List<ViewCSSProperty> props = new ArrayList<>();
                    for (Method method : View.class.getDeclaredMethods()) {
                        ViewDebug.ExportedProperty annotation = (ViewDebug.ExportedProperty) method.getAnnotation(ViewDebug.ExportedProperty.class);
                        if (annotation != null) {
                            props.add(new MethodBackedCSSProperty(method, convertViewPropertyNameToCSSName(method.getName()), annotation));
                        }
                    }
                    for (Field field : View.class.getDeclaredFields()) {
                        ViewDebug.ExportedProperty annotation2 = (ViewDebug.ExportedProperty) field.getAnnotation(ViewDebug.ExportedProperty.class);
                        if (annotation2 != null) {
                            props.add(new FieldBackedCSSProperty(field, convertViewPropertyNameToCSSName(field.getName()), annotation2));
                        }
                    }
                    Collections.sort(props, new Comparator<ViewCSSProperty>() { // from class: com.facebook.stetho.inspector.elements.android.ViewDescriptor.1
                        @Override // java.util.Comparator
                        public int compare(ViewCSSProperty lhs, ViewCSSProperty rhs) {
                            return lhs.getCSSName().compareTo(rhs.getCSSName());
                        }
                    });
                    this.mViewProperties = Collections.unmodifiableList(props);
                }
            }
        }
        return this.mViewProperties;
    }

    public ViewDescriptor() {
        this(new MethodInvoker());
    }

    public ViewDescriptor(MethodInvoker methodInvoker) {
        this.mMethodInvoker = methodInvoker;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public String onGetNodeName(View element) {
        String className = element.getClass().getName();
        return StringUtil.removePrefix(className, "android.view.", StringUtil.removePrefix(className, "android.widget."));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onGetAttributes(View element, AttributeAccumulator attributes) {
        String id = getIdAttribute(element);
        if (id != null) {
            attributes.store(ID_NAME, id);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onSetAttributesAsText(View element, String text) {
        Map<String, String> attributeToValueMap = parseSetAttributesAsTextArg(text);
        for (Map.Entry<String, String> entry : attributeToValueMap.entrySet()) {
            String methodName = "set" + capitalize(entry.getKey());
            String propertyValue = entry.getValue();
            this.mMethodInvoker.invoke(element, methodName, propertyValue);
        }
    }

    @Nullable
    private static String getIdAttribute(View element) {
        int id = element.getId();
        if (id == -1) {
            return null;
        }
        return ResourcesUtil.getIdStringQuietly(element, element.getResources(), id);
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    public View getViewForHighlighting(Object element) {
        return (View) element;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onGetStyles(View element, StyleAccumulator styles) {
        List<ViewCSSProperty> properties = getViewProperties();
        int size = properties.size();
        for (int i = 0; i < size; i++) {
            ViewCSSProperty property = properties.get(i);
            try {
                getStyleFromValue(element, property.getCSSName(), property.getValue(element), property.getAnnotation(), styles);
            } catch (IllegalAccessException | InvocationTargetException e) {
                LogUtil.e(e, "failed to get style property " + property.getCSSName() + " of element= " + element.toString());
            }
        }
    }

    private static boolean canIntBeMappedToString(@Nullable ViewDebug.ExportedProperty annotation) {
        return (annotation == null || annotation.mapping() == null || annotation.mapping().length <= 0) ? false : true;
    }

    private static String mapIntToStringUsingAnnotation(int value, @Nullable ViewDebug.ExportedProperty annotation) {
        if (!canIntBeMappedToString(annotation)) {
            throw new IllegalStateException("Cannot map using this annotation");
        }
        for (ViewDebug.IntToString map : annotation.mapping()) {
            if (map.from() == value) {
                return map.to();
            }
        }
        return NONE_MAPPING;
    }

    private static boolean canFlagsBeMappedToString(@Nullable ViewDebug.ExportedProperty annotation) {
        return (annotation == null || annotation.flagMapping() == null || annotation.flagMapping().length <= 0) ? false : true;
    }

    private static String mapFlagsToStringUsingAnnotation(int value, @Nullable ViewDebug.ExportedProperty annotation) {
        if (!canFlagsBeMappedToString(annotation)) {
            throw new IllegalStateException("Cannot map using this annotation");
        }
        StringBuilder stringBuilder = null;
        boolean atLeastOneFlag = false;
        for (ViewDebug.FlagToString flagToString : annotation.flagMapping()) {
            if (flagToString.outputIf() == ((value & flagToString.mask()) == flagToString.equals())) {
                if (stringBuilder == null) {
                    stringBuilder = new StringBuilder();
                }
                if (atLeastOneFlag) {
                    stringBuilder.append(" | ");
                }
                stringBuilder.append(flagToString.name());
                atLeastOneFlag = true;
            }
        }
        if (atLeastOneFlag) {
            return stringBuilder.toString();
        }
        return NONE_MAPPING;
    }

    private static boolean isDefaultValue(Float value) {
        return value.floatValue() == 0.0f;
    }

    private static boolean isDefaultValue(Integer value, @Nullable ViewDebug.ExportedProperty annotation) {
        return (canFlagsBeMappedToString(annotation) || canIntBeMappedToString(annotation) || value.intValue() != 0) ? false : true;
    }

    private String convertViewPropertyNameToCSSName(String getterName) {
        String[] words = getWordBoundaryPattern().split(getterName);
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            if (!words[i].equals("get") && !words[i].equals("m")) {
                result.append(words[i].toLowerCase());
                if (i < words.length - 1) {
                    result.append('-');
                }
            }
        }
        return result.toString();
    }

    private void getStyleFromValue(View element, String name, Object value, @Nullable ViewDebug.ExportedProperty annotation, StyleAccumulator styles) {
        if (name.equals(ID_NAME)) {
            getIdStyle(element, styles);
            return;
        }
        if (value instanceof Integer) {
            getStyleFromInteger(name, (Integer) value, annotation, styles);
        } else if (value instanceof Float) {
            getStyleFromFloat(name, (Float) value, annotation, styles);
        } else {
            getStylesFromObject(element, name, value, annotation, styles);
        }
    }

    private void getIdStyle(View element, StyleAccumulator styles) {
        String id = getIdAttribute(element);
        if (id == null) {
            styles.store(ID_NAME, NONE_VALUE, false);
        } else {
            styles.store(ID_NAME, id, false);
        }
    }

    private void getStyleFromInteger(String name, Integer value, @Nullable ViewDebug.ExportedProperty annotation, StyleAccumulator styles) {
        String intValueStr = IntegerFormatter.getInstance().format(value, annotation);
        if (canIntBeMappedToString(annotation)) {
            styles.store(name, intValueStr + " (" + mapIntToStringUsingAnnotation(value.intValue(), annotation) + ")", false);
        } else if (canFlagsBeMappedToString(annotation)) {
            styles.store(name, intValueStr + " (" + mapFlagsToStringUsingAnnotation(value.intValue(), annotation) + ")", false);
        } else {
            styles.store(name, intValueStr, isDefaultValue(value, annotation));
        }
    }

    private void getStyleFromFloat(String name, Float value, @Nullable ViewDebug.ExportedProperty annotation, StyleAccumulator styles) {
        styles.store(name, String.valueOf(value), isDefaultValue(value));
    }

    private void getStylesFromObject(View view, String name, Object value, @Nullable ViewDebug.ExportedProperty annotation, StyleAccumulator styles) {
        String propertyName;
        String propertyName2;
        if (annotation == null || !annotation.deepExport() || value == null) {
            return;
        }
        Field[] fields = value.getClass().getFields();
        for (Field field : fields) {
            int modifiers = field.getModifiers();
            if (!Modifier.isStatic(modifiers)) {
                try {
                    field.setAccessible(true);
                    Object propertyValue = field.get(value);
                    propertyName = field.getName();
                    switch (propertyName) {
                        case "bottomMargin":
                            propertyName2 = "margin-bottom";
                            break;
                        case "topMargin":
                            propertyName2 = "margin-top";
                            break;
                        case "leftMargin":
                            propertyName2 = "margin-left";
                            break;
                        case "rightMargin":
                            propertyName2 = "margin-right";
                            break;
                        default:
                            String annotationPrefix = annotation.prefix();
                            propertyName2 = convertViewPropertyNameToCSSName(annotationPrefix == null ? propertyName : annotationPrefix + propertyName);
                            break;
                    }
                    ViewDebug.ExportedProperty subAnnotation = (ViewDebug.ExportedProperty) field.getAnnotation(ViewDebug.ExportedProperty.class);
                    getStyleFromValue(view, propertyName2, propertyValue, subAnnotation, styles);
                } catch (IllegalAccessException e) {
                    LogUtil.e(e, "failed to get property of name: \"" + name + "\" of object: " + String.valueOf(value));
                    return;
                }
            }
        }
    }

    private static String capitalize(String str) {
        if (str == null || str.length() == 0 || Character.isTitleCase(str.charAt(0))) {
            return str;
        }
        StringBuilder buffer = new StringBuilder(str);
        buffer.setCharAt(0, Character.toTitleCase(buffer.charAt(0)));
        return buffer.toString();
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ViewDescriptor$FieldBackedCSSProperty.class */
    private final class FieldBackedCSSProperty extends ViewCSSProperty {
        private final Field mField;

        public FieldBackedCSSProperty(Field field, String cssName, @Nullable ViewDebug.ExportedProperty annotation) {
            super(cssName, annotation);
            this.mField = field;
            this.mField.setAccessible(true);
        }

        @Override // com.facebook.stetho.inspector.elements.android.ViewDescriptor.ViewCSSProperty
        public Object getValue(View view) throws InvocationTargetException, IllegalAccessException {
            return this.mField.get(view);
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ViewDescriptor$MethodBackedCSSProperty.class */
    private final class MethodBackedCSSProperty extends ViewCSSProperty {
        private final Method mMethod;

        public MethodBackedCSSProperty(Method method, String cssName, @Nullable ViewDebug.ExportedProperty annotation) {
            super(cssName, annotation);
            this.mMethod = method;
            this.mMethod.setAccessible(true);
        }

        @Override // com.facebook.stetho.inspector.elements.android.ViewDescriptor.ViewCSSProperty
        public Object getValue(View view) throws InvocationTargetException, IllegalAccessException {
            return this.mMethod.invoke(view, new Object[0]);
        }
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty.class */
    private abstract class ViewCSSProperty {
        private final String mCSSName;
        private final ViewDebug.ExportedProperty mAnnotation;

        public abstract Object getValue(View view) throws InvocationTargetException, IllegalAccessException;

        public ViewCSSProperty(String cssName, @Nullable ViewDebug.ExportedProperty annotation) {
            this.mCSSName = cssName;
            this.mAnnotation = annotation;
        }

        public final String getCSSName() {
            return this.mCSSName;
        }

        @Nullable
        public final ViewDebug.ExportedProperty getAnnotation() {
            return this.mAnnotation;
        }
    }
}
