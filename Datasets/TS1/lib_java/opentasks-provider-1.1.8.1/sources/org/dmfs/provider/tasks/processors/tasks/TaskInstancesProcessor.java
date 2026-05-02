package org.dmfs.provider.tasks.processors.tasks;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import java.util.TimeZone;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.model.adapters.BooleanFieldAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;
import org.dmfs.rfc5545.DateTime;
import org.dmfs.rfc5545.Duration;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor.class */
public class TaskInstancesProcessor extends AbstractEntityProcessor<TaskAdapter> {
    private static final BooleanFieldAdapter<TaskAdapter> UPDATE_REQUESTED = new BooleanFieldAdapter<>("org.dmfs.tasks.TaskInstanceProcessor.UPDATE_REQUESTED");

    public static void addUpdateRequest(ContentValues contentValues) {
        UPDATE_REQUESTED.setIn(contentValues, (Boolean) true);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        createInstances(sQLiteDatabase, taskAdapter);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        if (taskAdapter.isUpdated(UPDATE_REQUESTED)) {
            taskAdapter.setState(UPDATE_REQUESTED, taskAdapter.valueOf(UPDATE_REQUESTED));
            taskAdapter.unset(UPDATE_REQUESTED);
        }
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        if (taskAdapter.isUpdated(TaskAdapter.DTSTART) || taskAdapter.isUpdated(TaskAdapter.DUE) || taskAdapter.isUpdated(TaskAdapter.DURATION) || ((Boolean) taskAdapter.getState(UPDATE_REQUESTED)).booleanValue()) {
            updateInstances(sQLiteDatabase, taskAdapter);
        }
    }

    private ContentValues generateInstanceValues(TaskAdapter taskAdapter) {
        ContentValues contentValues = new ContentValues();
        DateTime dateTime = (DateTime) taskAdapter.valueOf(TaskAdapter.DTSTART);
        DateTime dateTime2 = (DateTime) taskAdapter.valueOf(TaskAdapter.DUE);
        Duration duration = (Duration) taskAdapter.valueOf(TaskAdapter.DURATION);
        TimeZone timeZone = TimeZone.getDefault();
        if (dateTime != null) {
            contentValues.put(TaskContract.InstanceColumns.INSTANCE_START, Long.valueOf(dateTime.getTimestamp()));
            contentValues.put(TaskContract.InstanceColumns.INSTANCE_START_SORTING, Long.valueOf(dateTime.isAllDay() ? dateTime.getInstance() : dateTime.shiftTimeZone(timeZone).getInstance()));
        } else {
            contentValues.putNull(TaskContract.InstanceColumns.INSTANCE_START);
            contentValues.putNull(TaskContract.InstanceColumns.INSTANCE_START_SORTING);
        }
        if (dateTime2 != null) {
            contentValues.put(TaskContract.InstanceColumns.INSTANCE_DUE, Long.valueOf(dateTime2.getTimestamp()));
            contentValues.put("instance_due_sorting", Long.valueOf(dateTime2.isAllDay() ? dateTime2.getInstance() : dateTime2.shiftTimeZone(timeZone).getInstance()));
            if (dateTime != null) {
                contentValues.put(TaskContract.InstanceColumns.INSTANCE_DURATION, Long.valueOf(dateTime2.getTimestamp() - dateTime.getTimestamp()));
            } else {
                contentValues.putNull(TaskContract.InstanceColumns.INSTANCE_DURATION);
            }
        } else if (duration == null || dateTime == null) {
            contentValues.putNull(TaskContract.InstanceColumns.INSTANCE_DURATION);
            contentValues.putNull(TaskContract.InstanceColumns.INSTANCE_DUE);
            contentValues.putNull("instance_due_sorting");
        } else {
            DateTime addDuration = dateTime.addDuration(duration);
            contentValues.put(TaskContract.InstanceColumns.INSTANCE_DUE, Long.valueOf(addDuration.getTimestamp()));
            contentValues.put("instance_due_sorting", Long.valueOf(addDuration.isAllDay() ? addDuration.getInstance() : addDuration.shiftTimeZone(timeZone).getInstance()));
            contentValues.put(TaskContract.InstanceColumns.INSTANCE_DURATION, Long.valueOf(addDuration.getTimestamp() - dateTime.getTimestamp()));
        }
        return contentValues;
    }

    private void createInstances(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter) {
        ContentValues generateInstanceValues = generateInstanceValues(taskAdapter);
        generateInstanceValues.put("task_id", Long.valueOf(taskAdapter.id()));
        sQLiteDatabase.insert(TaskDatabaseHelper.Tables.INSTANCES, null, generateInstanceValues);
    }

    private void updateInstances(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter) {
        sQLiteDatabase.update(TaskDatabaseHelper.Tables.INSTANCES, generateInstanceValues(taskAdapter), "task_id = " + taskAdapter.id(), null);
    }
}
