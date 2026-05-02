package org.dmfs.provider.tasks;

import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.net.Uri;
import android.provider.BaseColumns;
import android.provider.SyncStateContract;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract.class */
public final class TaskContract {
    private static Map<String, String> sAuthorities = Collections.synchronizedMap(new HashMap(4));
    private static Map<String, UriFactory> sUriFactories = new HashMap(4);
    public static final String CALLER_IS_SYNCADAPTER = "caller_is_syncadapter";
    public static final String LOAD_PROPERTIES = "load_properties";
    public static final String ACCOUNT_NAME = "account_name";
    public static final String ACCOUNT_TYPE = "account_type";
    public static final String LOCAL_ACCOUNT_NAME = "Local";
    public static final String LOCAL_ACCOUNT_TYPE = "org.dmfs.account.LOCAL";
    public static final String ACTION_DATABASE_INITIALIZED = "org.dmfs.tasks.DATABASE_INITIALIZED";
    public static final String MIMETYPE_AUTHORITY = "vnd.android.cursor.dir/vnd.org.dmfs.authority.mimetype";
    public static final String ACTION_BROADCAST_TASK_DUE = "org.dmfs.android.tasks.TASK_DUE";
    public static final String ACTION_BROADCAST_TASK_STARTING = "org.dmfs.android.tasks.TASK_START";
    public static final String EXTRA_TASK_TIMESTAMP = "org.dmfs.provider.tasks.extra.TIMESTAMP";
    public static final String EXTRA_TASK_ALLDAY = "org.dmfs.provider.tasks.extra.ALLDAY";
    public static final String EXTRA_TASK_TIMEZONE = "org.dmfs.provider.tasks.extra.TIMEZONE";
    public static final String EXTRA_TASK_TITLE = "org.dmfs.provider.tasks.extra.TITLE";
    public static final String EXTRA_OPERATIONS_URIS = "org.dmfs.tasks.OPERATIONS_URIS";
    public static final String EXTRA_OPERATIONS = "org.dmfs.tasks.OPERATIONS";

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Alarms.class */
    public static final class Alarms implements AlarmsColumns {
        static final String CONTENT_URI_PATH = "alarms";

        public static final Uri getContentUri(String str) {
            return TaskContract.getUriFactory(str).getUri(CONTENT_URI_PATH);
        }
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$AlarmsColumns.class */
    public interface AlarmsColumns {
        public static final String ALARM_ID = "alarm_id";
        public static final String LAST_TRIGGER = "last_trigger";
        public static final String NEXT_TRIGGER = "next_trigger";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Categories.class */
    public static final class Categories implements CategoriesColumns {
        static final String CONTENT_URI_PATH = "categories";
        public static final String DEFAULT_SORT_ORDER = "name";

        public static final Uri getContentUri(String str) {
            return TaskContract.getUriFactory(str).getUri(CONTENT_URI_PATH);
        }
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$CategoriesColumns.class */
    public interface CategoriesColumns {
        public static final String _ID = "_id";
        public static final String ACCOUNT_NAME = "account_name";
        public static final String ACCOUNT_TYPE = "account_type";
        public static final String NAME = "name";
        public static final String COLOR = "color";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$CommonSyncColumns.class */
    public interface CommonSyncColumns {
        public static final String _SYNC_ID = "_sync_id";
        public static final String SYNC_VERSION = "sync_version";
        public static final String _DIRTY = "_dirty";
        public static final String SYNC1 = "sync1";
        public static final String SYNC2 = "sync2";
        public static final String SYNC3 = "sync3";
        public static final String SYNC4 = "sync4";
        public static final String SYNC5 = "sync5";
        public static final String SYNC6 = "sync6";
        public static final String SYNC7 = "sync7";
        public static final String SYNC8 = "sync8";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$InstanceColumns.class */
    public interface InstanceColumns {
        public static final String TASK_ID = "task_id";
        public static final String INSTANCE_START = "instance_start";
        public static final String INSTANCE_DUE = "instance_due";
        public static final String INSTANCE_START_SORTING = "instance_start_sorting";
        public static final String INSTANCE_DUE_SORTING = "instance_due_sorting";
        public static final String INSTANCE_DURATION = "instance_duration";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Instances.class */
    public static final class Instances implements TaskColumns, InstanceColumns {
        public static final String ACCOUNT_NAME = "account_name";
        public static final String ACCOUNT_TYPE = "account_type";
        public static final String LIST_NAME = "list_name";
        public static final String LIST_COLOR = "list_color";
        public static final String LIST_OWNER = "list_owner";
        public static final String LIST_ACCESS_LEVEL = "list_access_level";
        public static final String VISIBLE = "visible";
        static final String CONTENT_URI_PATH = "instances";
        public static final String DEFAULT_SORT_ORDER = "instance_due_sorting";

        public static final Uri getContentUri(String str) {
            return TaskContract.getUriFactory(str).getUri(CONTENT_URI_PATH);
        }
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Properties.class */
    public static final class Properties implements PropertySyncColumns, PropertyColumns {
        static final String CONTENT_URI_PATH = "properties";
        public static final String DEFAULT_SORT_ORDER = "data0";

        public static final Uri getContentUri(String str) {
            return TaskContract.getUriFactory(str).getUri(CONTENT_URI_PATH);
        }
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property.class */
    public interface Property {

        /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Alarm.class */
        public interface Alarm extends PropertyColumns {
            public static final int ALARM_TYPE_NOTHING = 0;
            public static final int ALARM_TYPE_MESSAGE = 1;
            public static final int ALARM_TYPE_EMAIL = 2;
            public static final int ALARM_TYPE_SMS = 3;
            public static final int ALARM_TYPE_SOUND = 4;
            public static final int ALARM_REFERENCE_DUE_DATE = 1;
            public static final int ALARM_REFERENCE_START_DATE = 2;
            public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/alarm";
            public static final String MINUTES_BEFORE = "data0";
            public static final String REFERENCE = "data1";
            public static final String MESSAGE = "data2";
            public static final String ALARM_TYPE = "data3";
        }

        /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Attachment.class */
        public interface Attachment extends PropertyColumns {
            public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/attachment";
            public static final String URL = "data1";
            public static final String DISPLAY_NAME = "data2";
            public static final String FORMAT = "data3";
            public static final String SIZE = "data4";
            public static final String CONTENT_URI = "data5";
        }

        /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Attendee.class */
        public interface Attendee extends PropertyColumns {
            public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/attendee";
            public static final String NAME = "data0";
            public static final String EMAIL = "data1";
            public static final String ROLE = "data2";
            public static final String STATUS = "data3";
            public static final String RSVP = "data4";
        }

        /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Category.class */
        public interface Category extends PropertyColumns {
            public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/category";
            public static final String CATEGORY_ID = "data0";
            public static final String CATEGORY_NAME = "data1";
            public static final String CATEGORY_COLOR = "data2";
        }

        /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Comment.class */
        public interface Comment extends PropertyColumns {
            public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/comment";
            public static final String COMMENT = "data0";
            public static final String LANGUAGE = "data1";
        }

        /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Contact.class */
        public interface Contact extends PropertyColumns {
            public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/contact";
            public static final String NAME = "data0";
            public static final String LANGUAGE = "data1";
        }

        /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Relation.class */
        public interface Relation extends PropertyColumns {
            public static final String CONTENT_ITEM_TYPE = "vnd.android.cursor.item/relation";
            public static final String RELATED_ID = "data1";
            public static final String RELATED_TYPE = "data2";
            public static final String RELATED_UID = "data3";
            public static final String RELATED_URI = "data4";
            public static final String RELATED_CONTENT_URI = "data5";
            public static final String GAP = "data6";

            /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Property$Relation$RelType.class */
            public enum RelType {
                PARENT,
                CHILD,
                SIBLING,
                DEPENDS_ON,
                REFID,
                STRUCTURED_CATEGORY,
                FINISHTOSTART,
                FINISHTOFINISH,
                STARTTOFINISH,
                STARTTOSTART
            }
        }
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$PropertyColumns.class */
    public interface PropertyColumns {
        public static final String PROPERTY_ID = "property_id";
        public static final String TASK_ID = "task_id";
        public static final String MIMETYPE = "mimetype";
        public static final String VERSION = "prop_version";
        public static final String DATA0 = "data0";
        public static final String DATA1 = "data1";
        public static final String DATA2 = "data2";
        public static final String DATA3 = "data3";
        public static final String DATA4 = "data4";
        public static final String DATA5 = "data5";
        public static final String DATA6 = "data6";
        public static final String DATA7 = "data7";
        public static final String DATA8 = "data8";
        public static final String DATA9 = "data9";
        public static final String DATA10 = "data10";
        public static final String DATA11 = "data11";
        public static final String DATA12 = "data12";
        public static final String DATA13 = "data13";
        public static final String DATA14 = "data14";
        public static final String DATA15 = "data15";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$PropertySyncColumns.class */
    public interface PropertySyncColumns {
        public static final String SYNC1 = "prop_sync1";
        public static final String SYNC2 = "prop_sync2";
        public static final String SYNC3 = "prop_sync3";
        public static final String SYNC4 = "prop_sync4";
        public static final String SYNC5 = "prop_sync5";
        public static final String SYNC6 = "prop_sync6";
        public static final String SYNC7 = "prop_sync7";
        public static final String SYNC8 = "prop_sync8";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$SyncState.class */
    public static class SyncState implements SyncStateContract.Columns, BaseColumns {
        static final String CONTENT_URI_PATH = "syncstate";

        public static final Uri getContentUri(String str) {
            return TaskContract.getUriFactory(str).getUri(CONTENT_URI_PATH);
        }
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$TaskColumns.class */
    public interface TaskColumns {
        public static final String _ID = "_id";
        public static final String LIST_ID = "list_id";
        public static final String TITLE = "title";
        public static final String LOCATION = "location";
        public static final String GEO = "geo";
        public static final String DESCRIPTION = "description";
        public static final String URL = "url";
        public static final String ORGANIZER = "organizer";
        public static final String PRIORITY = "priority";
        public static final int PRIORITY_DEFAULT = 0;
        public static final String CLASSIFICATION = "class";
        public static final int CLASSIFICATION_PUBLIC = 0;
        public static final int CLASSIFICATION_PRIVATE = 1;
        public static final int CLASSIFICATION_CONFIDENTIAL = 2;
        public static final Integer CLASSIFICATION_DEFAULT = null;
        public static final String COMPLETED = "completed";
        public static final String COMPLETED_IS_ALLDAY = "completed_is_allday";
        public static final String PERCENT_COMPLETE = "percent_complete";
        public static final String STATUS = "status";
        public static final int STATUS_NEEDS_ACTION = 0;
        public static final int STATUS_IN_PROCESS = 1;
        public static final int STATUS_COMPLETED = 2;
        public static final int STATUS_CANCELLED = 3;
        public static final int STATUS_DEFAULT = 0;
        public static final String IS_NEW = "is_new";
        public static final String IS_CLOSED = "is_closed";
        public static final String TASK_COLOR = "task_color";
        public static final String DTSTART = "dtstart";
        public static final String IS_ALLDAY = "is_allday";
        public static final String CREATED = "created";
        public static final String LAST_MODIFIED = "last_modified";
        public static final String TZ = "tz";
        public static final String DUE = "due";
        public static final String DURATION = "duration";
        public static final String RDATE = "rdate";
        public static final String EXDATE = "exdate";
        public static final String RRULE = "rrule";
        public static final String ORIGINAL_INSTANCE_SYNC_ID = "original_instance_sync_id";
        public static final String ORIGINAL_INSTANCE_ID = "original_instance_id";
        public static final String ORIGINAL_INSTANCE_TIME = "original_instance_time";
        public static final String ORIGINAL_INSTANCE_ALLDAY = "original_instance_allday";
        public static final String PARENT_ID = "parent_id";
        public static final String SORTING = "sorting";
        public static final String HAS_ALARMS = "has_alarms";
        public static final String HAS_PROPERTIES = "has_properties";
        public static final String PINNED = "pinned";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$TaskListColumns.class */
    public interface TaskListColumns {
        public static final String _ID = "_id";
        public static final String LIST_NAME = "list_name";
        public static final String LIST_COLOR = "list_color";
        public static final String ACCESS_LEVEL = "list_access_level";
        public static final String VISIBLE = "visible";
        public static final String SYNC_ENABLED = "sync_enabled";
        public static final String OWNER = "list_owner";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$TaskListSyncColumns.class */
    public interface TaskListSyncColumns {
        public static final String ACCOUNT_NAME = "account_name";
        public static final String ACCOUNT_TYPE = "account_type";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$TaskLists.class */
    public static final class TaskLists implements TaskListColumns, TaskListSyncColumns, CommonSyncColumns {
        static final String CONTENT_URI_PATH = "tasklists";
        public static final String DEFAULT_SORT_ORDER = "account_name, list_name";
        public static final String[] SYNC_ADAPTER_COLUMNS = {"list_access_level", CommonSyncColumns._DIRTY, "list_owner", CommonSyncColumns.SYNC1, CommonSyncColumns.SYNC2, CommonSyncColumns.SYNC3, CommonSyncColumns.SYNC4, CommonSyncColumns.SYNC5, CommonSyncColumns.SYNC6, CommonSyncColumns.SYNC7, CommonSyncColumns.SYNC8, CommonSyncColumns._SYNC_ID, CommonSyncColumns.SYNC_VERSION};

        public static final Uri getContentUri(String str) {
            return TaskContract.getUriFactory(str).getUri(CONTENT_URI_PATH);
        }
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$TaskSearchColumns.class */
    public interface TaskSearchColumns {
        public static final String SCORE = "score";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$TaskSyncColumns.class */
    public interface TaskSyncColumns {
        public static final String _UID = "_uid";
        public static final String _DELETED = "_deleted";
    }

    /* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/TaskContract$Tasks.class */
    public static final class Tasks implements TaskColumns, CommonSyncColumns, TaskSyncColumns, TaskSearchColumns {
        public static final String ACCOUNT_NAME = "account_name";
        public static final String ACCOUNT_TYPE = "account_type";
        public static final String LIST_NAME = "list_name";
        public static final String LIST_COLOR = "list_color";
        public static final String LIST_OWNER = "list_owner";
        public static final String LIST_ACCESS_LEVEL = "list_access_level";
        public static final String VISIBLE = "visible";
        static final String CONTENT_URI_PATH = "tasks";
        static final String SEARCH_URI_PATH = "tasks_search";
        static final String SEARCH_QUERY_PARAMETER = "q";
        public static final String DEFAULT_SORT_ORDER = "due";
        public static final String[] SYNC_ADAPTER_COLUMNS = {CommonSyncColumns._DIRTY, CommonSyncColumns.SYNC1, CommonSyncColumns.SYNC2, CommonSyncColumns.SYNC3, CommonSyncColumns.SYNC4, CommonSyncColumns.SYNC5, CommonSyncColumns.SYNC6, CommonSyncColumns.SYNC7, CommonSyncColumns.SYNC8, CommonSyncColumns._SYNC_ID, CommonSyncColumns.SYNC_VERSION};

        public static final Uri getContentUri(String str) {
            return TaskContract.getUriFactory(str).getUri(CONTENT_URI_PATH);
        }

        public static final Uri getSearchUri(String str, String str2) {
            Uri.Builder buildUpon = TaskContract.getUriFactory(str).getUri(SEARCH_URI_PATH).buildUpon();
            buildUpon.appendQueryParameter(SEARCH_QUERY_PARAMETER, Uri.encode(str2));
            return buildUpon.build();
        }
    }

    private TaskContract() {
    }

    public static final Uri getContentUri(String str) {
        return getUriFactory(str).getUri();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static synchronized UriFactory getUriFactory(String str) {
        UriFactory uriFactory = sUriFactories.get(str);
        if (uriFactory == null) {
            uriFactory = new UriFactory(str);
            uriFactory.addUri("syncstate");
            uriFactory.addUri("tasklists");
            uriFactory.addUri("tasks");
            uriFactory.addUri("tasks_search");
            uriFactory.addUri("instances");
            uriFactory.addUri("categories");
            uriFactory.addUri("alarms");
            uriFactory.addUri("properties");
            sUriFactories.put(str, uriFactory);
        }
        return uriFactory;
    }

    public static synchronized String taskAuthority(Context context) {
        String packageName = context.getPackageName();
        if (sAuthorities.containsKey(packageName)) {
            return sAuthorities.get(packageName);
        }
        try {
            for (ProviderInfo providerInfo : context.getPackageManager().getPackageInfo(context.getPackageName(), 8).providers) {
                if (TaskProvider.class.isAssignableFrom(Class.forName(providerInfo.name))) {
                    sAuthorities.put(packageName, providerInfo.authority);
                    return providerInfo.authority;
                }
            }
            throw new RuntimeException("Could not find TaskProvider! Make sure you added it to your AndroidManifest.xml.");
        } catch (PackageManager.NameNotFoundException e) {
            throw new RuntimeException("Could not find TaskProvider!", e);
        }
    }
}
