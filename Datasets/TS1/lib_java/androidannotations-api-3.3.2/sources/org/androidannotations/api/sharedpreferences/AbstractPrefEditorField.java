package org.androidannotations.api.sharedpreferences;

import org.androidannotations.api.sharedpreferences.EditorHelper;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/AbstractPrefEditorField.class */
public abstract class AbstractPrefEditorField<T extends EditorHelper<T>> {
    protected final T editorHelper;
    protected final String key;

    public AbstractPrefEditorField(T editorHelper, String key) {
        this.editorHelper = editorHelper;
        this.key = key;
    }

    public final T remove() {
        this.editorHelper.getEditor().remove(this.key);
        return this.editorHelper;
    }
}
