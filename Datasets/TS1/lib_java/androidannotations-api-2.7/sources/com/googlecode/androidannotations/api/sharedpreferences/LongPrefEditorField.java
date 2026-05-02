package com.googlecode.androidannotations.api.sharedpreferences;

import com.googlecode.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/LongPrefEditorField.class */
public final class LongPrefEditorField<T extends EditorHelper<T>> extends AbstractPrefEditorField<T> {
    LongPrefEditorField(T editorHelper, String key) {
        super(editorHelper, key);
    }

    public T put(long value) {
        this.editorHelper.getEditor().putLong(this.key, value);
        return this.editorHelper;
    }
}
