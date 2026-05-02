package com.googlecode.androidannotations.api.sharedpreferences;

import com.googlecode.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/StringPrefEditorField.class */
public final class StringPrefEditorField<T extends EditorHelper<T>> extends AbstractPrefEditorField<T> {
    StringPrefEditorField(T editorHelper, String key) {
        super(editorHelper, key);
    }

    public T put(String value) {
        this.editorHelper.getEditor().putString(this.key, value);
        return this.editorHelper;
    }
}
