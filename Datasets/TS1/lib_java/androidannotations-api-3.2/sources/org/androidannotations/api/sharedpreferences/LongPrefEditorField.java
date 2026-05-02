package org.androidannotations.api.sharedpreferences;

import org.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/LongPrefEditorField.class */
public final class LongPrefEditorField<T extends EditorHelper<T>> extends AbstractPrefEditorField<T> {
    LongPrefEditorField(T editorHelper, String key) {
        super(editorHelper, key);
    }

    public T put(long value) {
        this.editorHelper.getEditor().putLong(this.key, value);
        return this.editorHelper;
    }
}
