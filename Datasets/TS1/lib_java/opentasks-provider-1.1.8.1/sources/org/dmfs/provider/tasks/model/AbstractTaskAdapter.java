package org.dmfs.provider.tasks.model;

import android.content.ContentUris;
import android.content.ContentValues;
import android.net.Uri;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.model.adapters.FieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/AbstractTaskAdapter.class */
public abstract class AbstractTaskAdapter implements TaskAdapter {
    private final ContentValues mState = new ContentValues(10);

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public Uri uri(String str) {
        return ContentUris.withAppendedId(TaskContract.Tasks.getContentUri(str), id());
    }

    @Override // org.dmfs.provider.tasks.model.TaskAdapter
    public boolean isRecurring() {
        return (valueOf(RRULE) == null && valueOf(RDATE) == null) ? false : true;
    }

    @Override // org.dmfs.provider.tasks.model.TaskAdapter
    public boolean recurrenceUpdated() {
        return isUpdated(RRULE) || isUpdated(DTSTART) || isUpdated(DUE) || isUpdated(DURATION) || isUpdated(RDATE) || isUpdated(EXDATE);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T getState(FieldAdapter<T, TaskAdapter> fieldAdapter) {
        return fieldAdapter.getFrom(this.mState);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> void setState(FieldAdapter<T, TaskAdapter> fieldAdapter, T t) {
        fieldAdapter.setIn(this.mState, t);
    }
}
