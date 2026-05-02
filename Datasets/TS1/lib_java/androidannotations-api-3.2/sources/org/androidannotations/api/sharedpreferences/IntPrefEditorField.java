package org.androidannotations.api.sharedpreferences;

import org.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/IntPrefEditorField.class */
public final class IntPrefEditorField<T extends EditorHelper<T>> extends AbstractPrefEditorField<T> {
    IntPrefEditorField(T editorHelper, String key) {
        super(editorHelper, key);
    }

    public T put(int value) {
        this.editorHelper.getEditor().putInt(this.key, value);
        return this.editorHelper;
    }
}
