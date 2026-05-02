package com.googlecode.androidannotations.api.sharedpreferences;

import com.googlecode.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/FloatPrefEditorField.class */
public final class FloatPrefEditorField<T extends EditorHelper<T>> extends AbstractPrefEditorField<T> {
    FloatPrefEditorField(T editorHelper, String key) {
        super(editorHelper, key);
    }

    public T put(float value) {
        this.editorHelper.getEditor().putFloat(this.key, value);
        return this.editorHelper;
    }
}
