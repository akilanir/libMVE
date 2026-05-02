package com.actionbarsherlock.widget;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.database.DataSetObservable;
import android.os.Handler;
import android.text.TextUtils;
import android.util.Log;
import android.util.Xml;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel.class */
class ActivityChooserModel extends DataSetObservable {
    private static final boolean DEBUG = false;
    private static final String TAG_HISTORICAL_RECORDS = "historical-records";
    private static final String TAG_HISTORICAL_RECORD = "historical-record";
    private static final String ATTRIBUTE_ACTIVITY = "activity";
    private static final String ATTRIBUTE_TIME = "time";
    private static final String ATTRIBUTE_WEIGHT = "weight";
    public static final String DEFAULT_HISTORY_FILE_NAME = "activity_choser_model_history.xml";
    public static final int DEFAULT_HISTORY_MAX_LENGTH = 50;
    private static final int DEFAULT_ACTIVITY_INFLATION = 5;
    private static final float DEFAULT_HISTORICAL_RECORD_WEIGHT = 1.0f;
    private static final String HISTORY_FILE_EXTENSION = ".xml";
    private static final int INVALID_INDEX = -1;
    private final Context mContext;
    private final String mHistoryFileName;
    private Intent mIntent;
    private OnChooseActivityListener mActivityChoserModelPolicy;
    private static final String LOG_TAG = ActivityChooserModel.class.getSimpleName();
    private static final Object sRegistryLock = new Object();
    private static final Map<String, ActivityChooserModel> sDataModelRegistry = new HashMap();
    private static final Executor SERIAL_EXECUTOR = Executors.newSingleThreadExecutor();
    private final Object mInstanceLock = new Object();
    private final List<ActivityResolveInfo> mActivites = new ArrayList();
    private final List<HistoricalRecord> mHistoricalRecords = new ArrayList();
    private ActivitySorter mActivitySorter = new DefaultSorter();
    private int mHistoryMaxSize = 50;
    private boolean mCanReadHistoricalData = true;
    private boolean mReadShareHistoryCalled = false;
    private boolean mHistoricalRecordsChanged = true;
    private final Handler mHandler = new Handler();

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$ActivityChooserModelClient.class */
    public interface ActivityChooserModelClient {
        void setActivityChooserModel(ActivityChooserModel activityChooserModel);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$ActivitySorter.class */
    public interface ActivitySorter {
        void sort(Intent intent, List<ActivityResolveInfo> list, List<HistoricalRecord> list2);
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$OnChooseActivityListener.class */
    public interface OnChooseActivityListener {
        boolean onChooseActivity(ActivityChooserModel activityChooserModel, Intent intent);
    }

    public static ActivityChooserModel get(Context context, String historyFileName) {
        ActivityChooserModel activityChooserModel;
        synchronized (sRegistryLock) {
            ActivityChooserModel dataModel = sDataModelRegistry.get(historyFileName);
            if (dataModel == null) {
                dataModel = new ActivityChooserModel(context, historyFileName);
                sDataModelRegistry.put(historyFileName, dataModel);
            }
            dataModel.readHistoricalData();
            activityChooserModel = dataModel;
        }
        return activityChooserModel;
    }

    private ActivityChooserModel(Context context, String historyFileName) {
        this.mContext = context.getApplicationContext();
        if (!TextUtils.isEmpty(historyFileName) && !historyFileName.endsWith(HISTORY_FILE_EXTENSION)) {
            this.mHistoryFileName = historyFileName + HISTORY_FILE_EXTENSION;
        } else {
            this.mHistoryFileName = historyFileName;
        }
    }

    public void setIntent(Intent intent) {
        synchronized (this.mInstanceLock) {
            if (this.mIntent == intent) {
                return;
            }
            this.mIntent = intent;
            loadActivitiesLocked();
        }
    }

    public Intent getIntent() {
        Intent intent;
        synchronized (this.mInstanceLock) {
            intent = this.mIntent;
        }
        return intent;
    }

    public int getActivityCount() {
        int size;
        synchronized (this.mInstanceLock) {
            size = this.mActivites.size();
        }
        return size;
    }

    public ResolveInfo getActivity(int index) {
        ResolveInfo resolveInfo;
        synchronized (this.mInstanceLock) {
            resolveInfo = this.mActivites.get(index).resolveInfo;
        }
        return resolveInfo;
    }

    public int getActivityIndex(ResolveInfo activity) {
        List<ActivityResolveInfo> activities = this.mActivites;
        int activityCount = activities.size();
        for (int i = 0; i < activityCount; i++) {
            ActivityResolveInfo currentActivity = activities.get(i);
            if (currentActivity.resolveInfo == activity) {
                return i;
            }
        }
        return -1;
    }

    public Intent chooseActivity(int index) {
        ActivityResolveInfo chosenActivity = this.mActivites.get(index);
        ComponentName chosenName = new ComponentName(chosenActivity.resolveInfo.activityInfo.packageName, chosenActivity.resolveInfo.activityInfo.name);
        Intent choiceIntent = new Intent(this.mIntent);
        choiceIntent.setComponent(chosenName);
        if (this.mActivityChoserModelPolicy != null) {
            Intent choiceIntentCopy = new Intent(choiceIntent);
            boolean handled = this.mActivityChoserModelPolicy.onChooseActivity(this, choiceIntentCopy);
            if (handled) {
                return null;
            }
        }
        HistoricalRecord historicalRecord = new HistoricalRecord(chosenName, System.currentTimeMillis(), DEFAULT_HISTORICAL_RECORD_WEIGHT);
        addHisoricalRecord(historicalRecord);
        return choiceIntent;
    }

    public void setOnChooseActivityListener(OnChooseActivityListener listener) {
        this.mActivityChoserModelPolicy = listener;
    }

    public ResolveInfo getDefaultActivity() {
        synchronized (this.mInstanceLock) {
            if (!this.mActivites.isEmpty()) {
                return this.mActivites.get(0).resolveInfo;
            }
            return null;
        }
    }

    public void setDefaultActivity(int index) {
        float weight;
        ActivityResolveInfo newDefaultActivity = this.mActivites.get(index);
        ActivityResolveInfo oldDefaultActivity = this.mActivites.get(0);
        if (oldDefaultActivity != null) {
            weight = (oldDefaultActivity.weight - newDefaultActivity.weight) + 5.0f;
        } else {
            weight = 1.0f;
        }
        ComponentName defaultName = new ComponentName(newDefaultActivity.resolveInfo.activityInfo.packageName, newDefaultActivity.resolveInfo.activityInfo.name);
        HistoricalRecord historicalRecord = new HistoricalRecord(defaultName, System.currentTimeMillis(), weight);
        addHisoricalRecord(historicalRecord);
    }

    private void readHistoricalData() {
        synchronized (this.mInstanceLock) {
            if (this.mCanReadHistoricalData && this.mHistoricalRecordsChanged) {
                this.mCanReadHistoricalData = false;
                this.mReadShareHistoryCalled = true;
                if (!TextUtils.isEmpty(this.mHistoryFileName)) {
                    SERIAL_EXECUTOR.execute(new HistoryLoader());
                }
            }
        }
    }

    private void persistHistoricalData() {
        synchronized (this.mInstanceLock) {
            if (!this.mReadShareHistoryCalled) {
                throw new IllegalStateException("No preceding call to #readHistoricalData");
            }
            if (this.mHistoricalRecordsChanged) {
                this.mHistoricalRecordsChanged = false;
                this.mCanReadHistoricalData = true;
                if (!TextUtils.isEmpty(this.mHistoryFileName)) {
                    SERIAL_EXECUTOR.execute(new HistoryPersister());
                }
            }
        }
    }

    public void setActivitySorter(ActivitySorter activitySorter) {
        synchronized (this.mInstanceLock) {
            if (this.mActivitySorter == activitySorter) {
                return;
            }
            this.mActivitySorter = activitySorter;
            sortActivities();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sortActivities() {
        synchronized (this.mInstanceLock) {
            if (this.mActivitySorter != null && !this.mActivites.isEmpty()) {
                this.mActivitySorter.sort(this.mIntent, this.mActivites, Collections.unmodifiableList(this.mHistoricalRecords));
                notifyChanged();
            }
        }
    }

    public void setHistoryMaxSize(int historyMaxSize) {
        synchronized (this.mInstanceLock) {
            if (this.mHistoryMaxSize == historyMaxSize) {
                return;
            }
            this.mHistoryMaxSize = historyMaxSize;
            pruneExcessiveHistoricalRecordsLocked();
            sortActivities();
        }
    }

    public int getHistoryMaxSize() {
        int i;
        synchronized (this.mInstanceLock) {
            i = this.mHistoryMaxSize;
        }
        return i;
    }

    public int getHistorySize() {
        int size;
        synchronized (this.mInstanceLock) {
            size = this.mHistoricalRecords.size();
        }
        return size;
    }

    private boolean addHisoricalRecord(HistoricalRecord historicalRecord) {
        boolean added;
        synchronized (this.mInstanceLock) {
            added = this.mHistoricalRecords.add(historicalRecord);
            if (added) {
                this.mHistoricalRecordsChanged = true;
                pruneExcessiveHistoricalRecordsLocked();
                persistHistoricalData();
                sortActivities();
            }
        }
        return added;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void pruneExcessiveHistoricalRecordsLocked() {
        List<HistoricalRecord> choiceRecords = this.mHistoricalRecords;
        int pruneCount = choiceRecords.size() - this.mHistoryMaxSize;
        if (pruneCount <= 0) {
            return;
        }
        this.mHistoricalRecordsChanged = true;
        for (int i = 0; i < pruneCount; i++) {
            choiceRecords.remove(0);
        }
    }

    private void loadActivitiesLocked() {
        this.mActivites.clear();
        if (this.mIntent != null) {
            List<ResolveInfo> resolveInfos = this.mContext.getPackageManager().queryIntentActivities(this.mIntent, 0);
            int resolveInfoCount = resolveInfos.size();
            for (int i = 0; i < resolveInfoCount; i++) {
                ResolveInfo resolveInfo = resolveInfos.get(i);
                this.mActivites.add(new ActivityResolveInfo(resolveInfo));
            }
            sortActivities();
            return;
        }
        notifyChanged();
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$HistoricalRecord.class */
    public static final class HistoricalRecord {
        public final ComponentName activity;
        public final long time;
        public final float weight;

        public HistoricalRecord(String activityName, long time, float weight) {
            this(ComponentName.unflattenFromString(activityName), time, weight);
        }

        public HistoricalRecord(ComponentName activityName, long time, float weight) {
            this.activity = activityName;
            this.time = time;
            this.weight = weight;
        }

        public int hashCode() {
            int result = (31 * 1) + (this.activity == null ? 0 : this.activity.hashCode());
            return (31 * ((31 * result) + ((int) (this.time ^ (this.time >>> 32))))) + Float.floatToIntBits(this.weight);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            HistoricalRecord other = (HistoricalRecord) obj;
            if (this.activity == null) {
                if (other.activity != null) {
                    return false;
                }
            } else if (!this.activity.equals(other.activity)) {
                return false;
            }
            if (this.time != other.time || Float.floatToIntBits(this.weight) != Float.floatToIntBits(other.weight)) {
                return false;
            }
            return true;
        }

        public String toString() {
            StringBuilder builder = new StringBuilder();
            builder.append("[");
            builder.append("; activity:").append(this.activity);
            builder.append("; time:").append(this.time);
            builder.append("; weight:").append(new BigDecimal(this.weight));
            builder.append("]");
            return builder.toString();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$ActivityResolveInfo.class */
    public final class ActivityResolveInfo implements Comparable<ActivityResolveInfo> {
        public final ResolveInfo resolveInfo;
        public float weight;

        public ActivityResolveInfo(ResolveInfo resolveInfo) {
            this.resolveInfo = resolveInfo;
        }

        public int hashCode() {
            return 31 + Float.floatToIntBits(this.weight);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj == null || getClass() != obj.getClass()) {
                return false;
            }
            ActivityResolveInfo other = (ActivityResolveInfo) obj;
            if (Float.floatToIntBits(this.weight) != Float.floatToIntBits(other.weight)) {
                return false;
            }
            return true;
        }

        @Override // java.lang.Comparable
        public int compareTo(ActivityResolveInfo another) {
            return Float.floatToIntBits(another.weight) - Float.floatToIntBits(this.weight);
        }

        public String toString() {
            StringBuilder builder = new StringBuilder();
            builder.append("[");
            builder.append("resolveInfo:").append(this.resolveInfo.toString());
            builder.append("; weight:").append(new BigDecimal(this.weight));
            builder.append("]");
            return builder.toString();
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$DefaultSorter.class */
    private final class DefaultSorter implements ActivitySorter {
        private static final float WEIGHT_DECAY_COEFFICIENT = 0.95f;
        private final Map<String, ActivityResolveInfo> mPackageNameToActivityMap;

        private DefaultSorter() {
            this.mPackageNameToActivityMap = new HashMap();
        }

        @Override // com.actionbarsherlock.widget.ActivityChooserModel.ActivitySorter
        public void sort(Intent intent, List<ActivityResolveInfo> activities, List<HistoricalRecord> historicalRecords) {
            Map<String, ActivityResolveInfo> packageNameToActivityMap = this.mPackageNameToActivityMap;
            packageNameToActivityMap.clear();
            int activityCount = activities.size();
            for (int i = 0; i < activityCount; i++) {
                ActivityResolveInfo activity = activities.get(i);
                activity.weight = 0.0f;
                String packageName = activity.resolveInfo.activityInfo.packageName;
                packageNameToActivityMap.put(packageName, activity);
            }
            int lastShareIndex = historicalRecords.size() - 1;
            float nextRecordWeight = 1.0f;
            for (int i2 = lastShareIndex; i2 >= 0; i2--) {
                HistoricalRecord historicalRecord = historicalRecords.get(i2);
                String packageName2 = historicalRecord.activity.getPackageName();
                ActivityResolveInfo activity2 = packageNameToActivityMap.get(packageName2);
                if (activity2 != null) {
                    activity2.weight += historicalRecord.weight * nextRecordWeight;
                    nextRecordWeight *= WEIGHT_DECAY_COEFFICIENT;
                }
            }
            Collections.sort(activities);
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$HistoryLoader.class */
    private final class HistoryLoader implements Runnable {
        private HistoryLoader() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                FileInputStream fis = ActivityChooserModel.this.mContext.openFileInput(ActivityChooserModel.this.mHistoryFileName);
                try {
                    try {
                        XmlPullParser parser = Xml.newPullParser();
                        parser.setInput(fis, null);
                        for (int type = 0; type != 1 && type != 2; type = parser.next()) {
                        }
                        if (!ActivityChooserModel.TAG_HISTORICAL_RECORDS.equals(parser.getName())) {
                            throw new XmlPullParserException("Share records file does not start with historical-records tag.");
                        }
                        List<HistoricalRecord> readRecords = new ArrayList<>();
                        while (true) {
                            int type2 = parser.next();
                            if (type2 == 1) {
                                synchronized (ActivityChooserModel.this.mInstanceLock) {
                                    LinkedHashSet linkedHashSet = new LinkedHashSet(readRecords);
                                    List<HistoricalRecord> historicalRecords = ActivityChooserModel.this.mHistoricalRecords;
                                    int historicalRecordsCount = historicalRecords.size();
                                    for (int i = historicalRecordsCount - 1; i >= 0; i--) {
                                        HistoricalRecord historicalRecord = historicalRecords.get(i);
                                        linkedHashSet.add(historicalRecord);
                                    }
                                    if (historicalRecords.size() == linkedHashSet.size()) {
                                        if (fis != null) {
                                            try {
                                                fis.close();
                                                return;
                                            } catch (IOException e) {
                                                return;
                                            }
                                        }
                                        return;
                                    }
                                    historicalRecords.clear();
                                    historicalRecords.addAll(linkedHashSet);
                                    ActivityChooserModel.this.mHistoricalRecordsChanged = true;
                                    ActivityChooserModel.this.mHandler.post(new Runnable() { // from class: com.actionbarsherlock.widget.ActivityChooserModel.HistoryLoader.1
                                        @Override // java.lang.Runnable
                                        public void run() {
                                            ActivityChooserModel.this.pruneExcessiveHistoricalRecordsLocked();
                                            ActivityChooserModel.this.sortActivities();
                                        }
                                    });
                                    if (fis != null) {
                                        try {
                                            fis.close();
                                            return;
                                        } catch (IOException e2) {
                                            return;
                                        }
                                    }
                                    return;
                                }
                            }
                            if (type2 != 3 && type2 != 4) {
                                String nodeName = parser.getName();
                                if (!ActivityChooserModel.TAG_HISTORICAL_RECORD.equals(nodeName)) {
                                    throw new XmlPullParserException("Share records file not well-formed.");
                                }
                                String activity = parser.getAttributeValue(null, ActivityChooserModel.ATTRIBUTE_ACTIVITY);
                                long time = Long.parseLong(parser.getAttributeValue(null, ActivityChooserModel.ATTRIBUTE_TIME));
                                float weight = Float.parseFloat(parser.getAttributeValue(null, ActivityChooserModel.ATTRIBUTE_WEIGHT));
                                HistoricalRecord readRecord = new HistoricalRecord(activity, time, weight);
                                readRecords.add(readRecord);
                            }
                        }
                    } catch (Throwable th) {
                        if (fis != null) {
                            try {
                                fis.close();
                            } catch (IOException e3) {
                            }
                        }
                        throw th;
                    }
                } catch (IOException ioe) {
                    Log.e(ActivityChooserModel.LOG_TAG, "Error reading historical recrod file: " + ActivityChooserModel.this.mHistoryFileName, ioe);
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e4) {
                        }
                    }
                } catch (XmlPullParserException xppe) {
                    Log.e(ActivityChooserModel.LOG_TAG, "Error reading historical recrod file: " + ActivityChooserModel.this.mHistoryFileName, xppe);
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e5) {
                        }
                    }
                }
            } catch (FileNotFoundException e6) {
            }
        }
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/widget/ActivityChooserModel$HistoryPersister.class */
    private final class HistoryPersister implements Runnable {
        private HistoryPersister() {
        }

        @Override // java.lang.Runnable
        public void run() {
            List<HistoricalRecord> records;
            synchronized (ActivityChooserModel.this.mInstanceLock) {
                records = new ArrayList<>(ActivityChooserModel.this.mHistoricalRecords);
            }
            try {
                FileOutputStream fos = ActivityChooserModel.this.mContext.openFileOutput(ActivityChooserModel.this.mHistoryFileName, 0);
                XmlSerializer serializer = Xml.newSerializer();
                try {
                    try {
                        serializer.setOutput(fos, null);
                        serializer.startDocument("UTF-8", true);
                        serializer.startTag(null, ActivityChooserModel.TAG_HISTORICAL_RECORDS);
                        int recordCount = records.size();
                        for (int i = 0; i < recordCount; i++) {
                            HistoricalRecord record = records.remove(0);
                            serializer.startTag(null, ActivityChooserModel.TAG_HISTORICAL_RECORD);
                            serializer.attribute(null, ActivityChooserModel.ATTRIBUTE_ACTIVITY, record.activity.flattenToString());
                            serializer.attribute(null, ActivityChooserModel.ATTRIBUTE_TIME, String.valueOf(record.time));
                            serializer.attribute(null, ActivityChooserModel.ATTRIBUTE_WEIGHT, String.valueOf(record.weight));
                            serializer.endTag(null, ActivityChooserModel.TAG_HISTORICAL_RECORD);
                        }
                        serializer.endTag(null, ActivityChooserModel.TAG_HISTORICAL_RECORDS);
                        serializer.endDocument();
                        if (fos != null) {
                            try {
                                fos.close();
                            } catch (IOException e) {
                            }
                        }
                    } catch (IOException ioe) {
                        Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + ActivityChooserModel.this.mHistoryFileName, ioe);
                        if (fos != null) {
                            try {
                                fos.close();
                            } catch (IOException e2) {
                            }
                        }
                    } catch (IllegalArgumentException iae) {
                        Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + ActivityChooserModel.this.mHistoryFileName, iae);
                        if (fos != null) {
                            try {
                                fos.close();
                            } catch (IOException e3) {
                            }
                        }
                    } catch (IllegalStateException ise) {
                        Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + ActivityChooserModel.this.mHistoryFileName, ise);
                        if (fos != null) {
                            try {
                                fos.close();
                            } catch (IOException e4) {
                            }
                        }
                    }
                } catch (Throwable th) {
                    if (fos != null) {
                        try {
                            fos.close();
                        } catch (IOException e5) {
                        }
                    }
                    throw th;
                }
            } catch (FileNotFoundException fnfe) {
                Log.e(ActivityChooserModel.LOG_TAG, "Error writing historical recrod file: " + ActivityChooserModel.this.mHistoryFileName, fnfe);
            }
        }
    }
}
