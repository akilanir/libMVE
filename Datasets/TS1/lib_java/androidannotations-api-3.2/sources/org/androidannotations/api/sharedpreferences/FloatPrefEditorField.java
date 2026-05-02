package org.androidannotations.api.sharedpreferences;

import org.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/FloatPrefEditorField.class */
public final class FloatPrefEditorField<T extends EditorHelper<T>> extends AbstractPrefEditorField<T> {
    FloatPrefEditorField(T editorHelper, String key) {
        super(editorHelper, key);
    }

    public T put(float value) {
        this.editorHelper.getEditor().putFloat(this.key, value);
        return this.editorHelper;
    }
}
