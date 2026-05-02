package org.dmfs.provider.tasks.model;

import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import org.dmfs.provider.tasks.model.adapters.FieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/EntityAdapter.class */
public interface EntityAdapter<EntityType> {
    long id();

    Uri uri(String str);

    <T> T valueOf(FieldAdapter<T, EntityType> fieldAdapter);

    <T> T oldValueOf(FieldAdapter<T, EntityType> fieldAdapter);

    <T> boolean isUpdated(FieldAdapter<T, EntityType> fieldAdapter);

    boolean isWriteable();

    boolean hasUpdates();

    <T> void set(FieldAdapter<T, EntityType> fieldAdapter, T t);

    <T> void unset(FieldAdapter<T, EntityType> fieldAdapter);

    int commit(SQLiteDatabase sQLiteDatabase);

    <T> T getState(FieldAdapter<T, EntityType> fieldAdapter);

    <T> void setState(FieldAdapter<T, EntityType> fieldAdapter, T t);

    EntityAdapter<EntityType> duplicate();
}
