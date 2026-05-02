package org.dmfs.provider.tasks.processors.tasks;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;
import org.dmfs.rfc5545.Duration;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor.class */
public class TaskValidatorProcessor extends AbstractEntityProcessor<TaskAdapter> {
    private static final String[] TASKLIST_ID_PROJECTION = {"_id"};
    private static final String TASKLISTS_ID_SELECTION = "_id=";

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        verifyCommon(taskAdapter, z);
        Long l = (Long) taskAdapter.valueOf(TaskAdapter.LIST_ID);
        if (l == null) {
            throw new IllegalArgumentException("LIST_ID is required on INSERT");
        }
        Cursor query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.LISTS, TASKLIST_ID_PROJECTION, TASKLISTS_ID_SELECTION + l, null, null, null, null);
        if (query != null) {
            try {
                if (query.getCount() == 1) {
                    if (query != null) {
                        return;
                    } else {
                        return;
                    }
                }
            } finally {
                if (query != null) {
                    query.close();
                }
            }
        }
        throw new IllegalArgumentException("LIST_ID must refer to an existing TaskList");
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        verifyCommon(taskAdapter, z);
        if (z) {
            return;
        }
        if (taskAdapter.isUpdated(TaskAdapter.ORIGINAL_INSTANCE_ID) || taskAdapter.isUpdated(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID)) {
            throw new IllegalArgumentException("ORIGINAL_INSTANCE_SYNC_ID and ORIGINAL_INSTANCE_ID can be modified by sync adapters only");
        }
    }

    private void verifyCommon(TaskAdapter taskAdapter, boolean z) {
        Integer num;
        Integer num2;
        Integer num3;
        Integer num4;
        if (taskAdapter.isUpdated(TaskAdapter._ID)) {
            throw new IllegalArgumentException("_ID can not be set manually");
        }
        if (taskAdapter.isUpdated(TaskAdapter.ACCOUNT_NAME)) {
            throw new IllegalArgumentException("ACCOUNT_NAME can not be set on a tasks");
        }
        if (taskAdapter.isUpdated(TaskAdapter.ACCOUNT_TYPE)) {
            throw new IllegalArgumentException("ACCOUNT_TYPE can not be set on a tasks");
        }
        if (taskAdapter.isUpdated(TaskAdapter.LIST_COLOR)) {
            throw new IllegalArgumentException("LIST_COLOR can not be set on a tasks");
        }
        if (taskAdapter.isUpdated(TaskAdapter._DELETED)) {
            throw new IllegalArgumentException("modification of _DELETE is not allowed");
        }
        if (!z && taskAdapter.isUpdated(TaskAdapter._UID)) {
            throw new IllegalArgumentException("modification of _UID is not allowed");
        }
        if (!z && taskAdapter.isUpdated(TaskAdapter._DIRTY)) {
            throw new IllegalArgumentException("modification of _DIRTY is not allowed");
        }
        if (!z && taskAdapter.isUpdated(TaskAdapter.CREATED)) {
            throw new IllegalArgumentException("modification of CREATED is not allowed");
        }
        if (taskAdapter.isUpdated(TaskAdapter.IS_NEW)) {
            throw new IllegalArgumentException("modification of IS_NEW is not allowed");
        }
        if (taskAdapter.isUpdated(TaskAdapter.IS_CLOSED)) {
            throw new IllegalArgumentException("modification of IS_CLOSED is not allowed");
        }
        if (taskAdapter.isUpdated(TaskAdapter.HAS_PROPERTIES)) {
            throw new IllegalArgumentException("modification of HAS_PROPERTIES is not allowed");
        }
        if (taskAdapter.isUpdated(TaskAdapter.HAS_ALARMS)) {
            throw new IllegalArgumentException("modification of HAS_ALARMS is not allowed");
        }
        if (!z && taskAdapter.isUpdated(TaskAdapter.LAST_MODIFIED)) {
            throw new IllegalArgumentException("modification of MODIFICATION_TIME is not allowed");
        }
        if (taskAdapter.isUpdated(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID) && taskAdapter.isUpdated(TaskAdapter.ORIGINAL_INSTANCE_ID)) {
            throw new IllegalArgumentException("ORIGINAL_INSTANCE_SYNC_ID and ORIGINAL_INSTANCE_ID must not be specified at the same time");
        }
        if (taskAdapter.isUpdated(TaskAdapter.CLASSIFICATION) && (num4 = (Integer) taskAdapter.valueOf(TaskAdapter.CLASSIFICATION)) != null && (num4.intValue() < 0 || num4.intValue() > 2)) {
            throw new IllegalArgumentException("CLASSIFICATION must be an integer between 0 and 2");
        }
        if (taskAdapter.isUpdated(TaskAdapter.PRIORITY) && (num3 = (Integer) taskAdapter.valueOf(TaskAdapter.PRIORITY)) != null && (num3.intValue() < 0 || num3.intValue() > 9)) {
            throw new IllegalArgumentException("PRIORITY must be an integer between 0 and 9");
        }
        if (taskAdapter.isUpdated(TaskAdapter.PERCENT_COMPLETE) && (num2 = (Integer) taskAdapter.valueOf(TaskAdapter.PERCENT_COMPLETE)) != null && (num2.intValue() < 0 || num2.intValue() > 100)) {
            throw new IllegalArgumentException("PERCENT_COMPLETE must be null or an integer between 0 and 100");
        }
        if (taskAdapter.isUpdated(TaskAdapter.STATUS) && (num = (Integer) taskAdapter.valueOf(TaskAdapter.STATUS)) != null && (num.intValue() < 0 || num.intValue() > 3)) {
            throw new IllegalArgumentException("invalid STATUS: " + num);
        }
        Long l = (Long) taskAdapter.valueOf(TaskAdapter.DTSTART_RAW);
        Long l2 = (Long) taskAdapter.valueOf(TaskAdapter.DUE_RAW);
        Duration duration = (Duration) taskAdapter.valueOf(TaskAdapter.DURATION);
        if (l != null) {
            if (l2 != null && duration != null) {
                throw new IllegalArgumentException("Only one of DUE or DURATION must be supplied.");
            }
            if (l2 != null) {
                if (l2.longValue() < l.longValue()) {
                    throw new IllegalArgumentException("DUE must not be < DTSTART");
                }
            } else if (duration != null && duration.getSign() == -1) {
                throw new IllegalArgumentException("DURATION must not be negative");
            }
        } else if (duration != null) {
            throw new IllegalArgumentException("DURATION must not be supplied without DTSTART");
        }
        if ((l != null || l2 != null) && !((Boolean) taskAdapter.valueOf(TaskAdapter.IS_ALLDAY)).booleanValue() && taskAdapter.valueOf(TaskAdapter.TIMEZONE_RAW) == null) {
            throw new IllegalArgumentException("TIMEZONE must be supplied if one of DTSTART or DUE is not null and not all-day");
        }
    }
}
