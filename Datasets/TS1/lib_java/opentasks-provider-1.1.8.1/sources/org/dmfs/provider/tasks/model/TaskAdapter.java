package org.dmfs.provider.tasks.model;

import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.model.adapters.BinaryFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.BooleanFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.DateTimeArrayFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.DateTimeFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.DurationFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.IntegerFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.LongFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.RRuleFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.StringFieldAdapter;
import org.dmfs.provider.tasks.model.adapters.UrlFieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/TaskAdapter.class */
public interface TaskAdapter extends EntityAdapter<TaskAdapter> {
    public static final LongFieldAdapter<TaskAdapter> _ID = new LongFieldAdapter<>("_id");
    public static final LongFieldAdapter<TaskAdapter> INSTANCE_TASK_ID = new LongFieldAdapter<>("task_id");
    public static final LongFieldAdapter<TaskAdapter> LIST_ID = new LongFieldAdapter<>(TaskContract.TaskColumns.LIST_ID);
    public static final StringFieldAdapter<TaskAdapter> LIST_OWNER = new StringFieldAdapter<>("list_owner");
    public static final LongFieldAdapter<TaskAdapter> ORIGINAL_INSTANCE_ID = new LongFieldAdapter<>(TaskContract.TaskColumns.ORIGINAL_INSTANCE_ID);
    public static final StringFieldAdapter<TaskAdapter> ORIGINAL_INSTANCE_SYNC_ID = new StringFieldAdapter<>(TaskContract.TaskColumns.ORIGINAL_INSTANCE_SYNC_ID);
    public static final BooleanFieldAdapter<TaskAdapter> IS_ALLDAY = new BooleanFieldAdapter<>(TaskContract.TaskColumns.IS_ALLDAY);
    public static final IntegerFieldAdapter<TaskAdapter> PERCENT_COMPLETE = new IntegerFieldAdapter<>(TaskContract.TaskColumns.PERCENT_COMPLETE);
    public static final IntegerFieldAdapter<TaskAdapter> STATUS = new IntegerFieldAdapter<>(TaskContract.TaskColumns.STATUS);
    public static final IntegerFieldAdapter<TaskAdapter> PRIORITY = new IntegerFieldAdapter<>(TaskContract.TaskColumns.PRIORITY);
    public static final IntegerFieldAdapter<TaskAdapter> CLASSIFICATION = new IntegerFieldAdapter<>(TaskContract.TaskColumns.CLASSIFICATION);
    public static final StringFieldAdapter<TaskAdapter> LIST_NAME = new StringFieldAdapter<>("list_name");
    public static final StringFieldAdapter<TaskAdapter> ACCOUNT_NAME = new StringFieldAdapter<>("account_name");
    public static final StringFieldAdapter<TaskAdapter> ACCOUNT_TYPE = new StringFieldAdapter<>("account_type");
    public static final StringFieldAdapter<TaskAdapter> TITLE = new StringFieldAdapter<>(TaskContract.TaskColumns.TITLE);
    public static final StringFieldAdapter<TaskAdapter> LOCATION = new StringFieldAdapter<>(TaskContract.TaskColumns.LOCATION);
    public static final StringFieldAdapter<TaskAdapter> DESCRIPTION = new StringFieldAdapter<>(TaskContract.TaskColumns.DESCRIPTION);
    public static final DateTimeFieldAdapter<TaskAdapter> DTSTART = new DateTimeFieldAdapter<>(TaskContract.TaskColumns.DTSTART, TaskContract.TaskColumns.TZ, TaskContract.TaskColumns.IS_ALLDAY);
    public static final LongFieldAdapter<TaskAdapter> DTSTART_RAW = new LongFieldAdapter<>(TaskContract.TaskColumns.DTSTART);
    public static final DateTimeFieldAdapter<TaskAdapter> DUE = new DateTimeFieldAdapter<>("due", TaskContract.TaskColumns.TZ, TaskContract.TaskColumns.IS_ALLDAY);
    public static final LongFieldAdapter<TaskAdapter> DUE_RAW = new LongFieldAdapter<>("due");
    public static final DurationFieldAdapter<TaskAdapter> DURATION = new DurationFieldAdapter<>(TaskContract.TaskColumns.DURATION);
    public static final BooleanFieldAdapter<TaskAdapter> _DIRTY = new BooleanFieldAdapter<>(TaskContract.CommonSyncColumns._DIRTY);
    public static final BooleanFieldAdapter<TaskAdapter> _DELETED = new BooleanFieldAdapter<>(TaskContract.TaskSyncColumns._DELETED);
    public static final DateTimeFieldAdapter<TaskAdapter> COMPLETED = new DateTimeFieldAdapter<>(TaskContract.TaskColumns.COMPLETED, null, null);
    public static final DateTimeFieldAdapter<TaskAdapter> CREATED = new DateTimeFieldAdapter<>(TaskContract.TaskColumns.CREATED, null, null);
    public static final DateTimeFieldAdapter<TaskAdapter> LAST_MODIFIED = new DateTimeFieldAdapter<>(TaskContract.TaskColumns.LAST_MODIFIED, null, null);
    public static final UrlFieldAdapter<TaskAdapter> URL = new UrlFieldAdapter<>(TaskContract.TaskColumns.URL);
    public static final StringFieldAdapter<TaskAdapter> _UID = new StringFieldAdapter<>(TaskContract.TaskSyncColumns._UID);
    public static final StringFieldAdapter<TaskAdapter> TIMEZONE_RAW = new StringFieldAdapter<>(TaskContract.TaskColumns.TZ);
    public static final IntegerFieldAdapter<TaskAdapter> LIST_COLOR = new IntegerFieldAdapter<>("list_color");
    public static final IntegerFieldAdapter<TaskAdapter> LIST_ACCESS_LEVEL = new IntegerFieldAdapter<>("list_access_level");
    public static final BooleanFieldAdapter<TaskAdapter> LIST_VISIBLE = new BooleanFieldAdapter<>("visible");
    public static final IntegerFieldAdapter<TaskAdapter> TASK_ID = new IntegerFieldAdapter<>("_id");
    public static final BooleanFieldAdapter<TaskAdapter> IS_CLOSED = new BooleanFieldAdapter<>(TaskContract.TaskColumns.IS_CLOSED);
    public static final BooleanFieldAdapter<TaskAdapter> IS_NEW = new BooleanFieldAdapter<>(TaskContract.TaskColumns.IS_NEW);
    public static final BooleanFieldAdapter<TaskAdapter> PINNED = new BooleanFieldAdapter<>(TaskContract.TaskColumns.PINNED);
    public static final BooleanFieldAdapter<TaskAdapter> HAS_ALARMS = new BooleanFieldAdapter<>(TaskContract.TaskColumns.HAS_ALARMS);
    public static final BooleanFieldAdapter<TaskAdapter> HAS_PROPERTIES = new BooleanFieldAdapter<>(TaskContract.TaskColumns.HAS_PROPERTIES);
    public static final RRuleFieldAdapter<TaskAdapter> RRULE = new RRuleFieldAdapter<>(TaskContract.TaskColumns.RRULE);
    public static final DateTimeArrayFieldAdapter<TaskAdapter> RDATE = new DateTimeArrayFieldAdapter<>(TaskContract.TaskColumns.RDATE, TaskContract.TaskColumns.TZ);
    public static final DateTimeArrayFieldAdapter<TaskAdapter> EXDATE = new DateTimeArrayFieldAdapter<>(TaskContract.TaskColumns.EXDATE, TaskContract.TaskColumns.TZ);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC1 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC1);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC2 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC2);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC3 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC3);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC4 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC4);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC5 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC5);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC6 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC6);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC7 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC7);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC8 = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC8);
    public static final BinaryFieldAdapter<TaskAdapter> SYNC_VERSION = new BinaryFieldAdapter<>(TaskContract.CommonSyncColumns.SYNC_VERSION);
    public static final StringFieldAdapter<TaskAdapter> SYNC_ID = new StringFieldAdapter<>(TaskContract.CommonSyncColumns._SYNC_ID);
    public static final DateTimeFieldAdapter<TaskAdapter> INSTANCE_DUE = new DateTimeFieldAdapter<>(TaskContract.InstanceColumns.INSTANCE_DUE, TaskContract.TaskColumns.TZ, TaskContract.TaskColumns.IS_ALLDAY);
    public static final DateTimeFieldAdapter<TaskAdapter> INSTANCE_START = new DateTimeFieldAdapter<>(TaskContract.InstanceColumns.INSTANCE_START, TaskContract.TaskColumns.TZ, TaskContract.TaskColumns.IS_ALLDAY);

    boolean isRecurring();

    boolean recurrenceUpdated();

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    /* renamed from: duplicate */
    EntityAdapter<TaskAdapter> duplicate2();
}
