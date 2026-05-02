package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;
import org.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/EditorHelper.class */
public abstract class EditorHelper<T extends EditorHelper<T>> {
    private final SharedPreferences.Editor editor;

    public EditorHelper(SharedPreferences sharedPreferences) {
        this.editor = sharedPreferences.edit();
    }

    protected SharedPreferences.Editor getEditor() {
        return this.editor;
    }

    public final T clear() {
        this.editor.clear();
        return (T) cast();
    }

    public final void apply() {
        SharedPreferencesCompat.apply(this.editor);
    }

    protected IntPrefEditorField<T> intField(String key) {
        return new IntPrefEditorField<>(cast(), key);
    }

    protected StringPrefEditorField<T> stringField(String key) {
        return new StringPrefEditorField<>(cast(), key);
    }

    protected StringSetPrefEditorField<T> stringSetField(String key) {
        return new StringSetPrefEditorField<>(cast(), key);
    }

    protected BooleanPrefEditorField<T> booleanField(String key) {
        return new BooleanPrefEditorField<>(cast(), key);
    }

    protected FloatPrefEditorField<T> floatField(String key) {
        return new FloatPrefEditorField<>(cast(), key);
    }

    protected LongPrefEditorField<T> longField(String key) {
        return new LongPrefEditorField<>(cast(), key);
    }

    private T cast() {
        return this;
    }
}
