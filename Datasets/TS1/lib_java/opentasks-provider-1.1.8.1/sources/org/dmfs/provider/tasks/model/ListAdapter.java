package org.dmfs.provider.tasks.model;

import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.model.adapters.IntegerFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.LongFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.StringFieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/ListAdapter.class */
public interface ListAdapter extends EntityAdapter<ListAdapter> {
    public static final LongFieldAdapter<ListAdapter> _ID = new LongFieldAdapter<>("_id");
    public static final StringFieldAdapter<ListAdapter> SYNC_ID = new StringFieldAdapter<>(TaskContract.CommonSyncColumns._SYNC_ID);
    public static final StringFieldAdapter<ListAdapter> SYNC_VERSION = new StringFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC_VERSION);
    public static final StringFieldAdapter<ListAdapter> ACCOUNT_NAME = new StringFieldAdapter<>("account_name");
    public static final StringFieldAdapter<ListAdapter> ACCOUNT_TYPE = new StringFieldAdapter<>("account_type");
    public static final StringFieldAdapter<ListAdapter> OWNER = new StringFieldAdapter<>("list_owner");
    public static final StringFieldAdapter<ListAdapter> LIST_NAME = new StringFieldAdapter<>("list_name");
    public static final IntegerFieldAdapter<ListAdapter> LIST_COLOR = new IntegerFieldAdapter<>("list_color");

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    EntityAdapter<ListAdapter> duplicate();
}
