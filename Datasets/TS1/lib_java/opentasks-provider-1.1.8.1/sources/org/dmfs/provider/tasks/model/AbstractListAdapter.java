package org.dmfs.provider.tasks.model;

import android.content.ContentUris;
import android.content.ContentValues;
import android.net.Uri;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.model.adapters.FieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/AbstractListAdapter.class */
public abstract class AbstractListAdapter implements ListAdapter {
    private final ContentValues mState = new ContentValues(10);

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public Uri uri(String str) {
        return ContentUris.withAppendedId(TaskContract.TaskLists.getContentUri(str), id());
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T getState(FieldAdapter<T, ListAdapter> fieldAdapter) {
        return fieldAdapter.getFrom(this.mState);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> void setState(FieldAdapter<T, ListAdapter> fieldAdapter, T t) {
        fieldAdapter.setIn(this.mState, t);
    }
}
