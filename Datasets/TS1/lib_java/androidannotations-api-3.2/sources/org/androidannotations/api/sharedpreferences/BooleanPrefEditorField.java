package org.androidannotations.api.sharedpreferences;

import org.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/BooleanPrefEditorField.class */
public final class BooleanPrefEditorField<T extends EditorHelper<T>> extends AbstractPrefEditorField<T> {
    BooleanPrefEditorField(T editorHelper, String key) {
        super(editorHelper, key);
    }

    public T put(boolean value) {
        this.editorHelper.getEditor().putBoolean(this.key, value);
        return this.editorHelper;
    }
}
