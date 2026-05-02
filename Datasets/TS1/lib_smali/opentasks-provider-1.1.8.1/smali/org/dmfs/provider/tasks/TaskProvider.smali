.class public final Lorg/dmfs/provider/tasks/TaskProvider;
.super Lorg/dmfs/provider/tasks/SQLiteContentProvider;

# interfaces
.implements Landroid/accounts/OnAccountsUpdateListener;
.implements Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;


# static fields
.field private static final ALARMS:I = 0x3ed

.field private static final ALARM_ID:I = 0x3ee

.field private static final CATEGORIES:I = 0x3e9

.field private static final CATEGORY_ID:I = 0x3ea

.field private static final INSTANCES:I = 0x67

.field private static final INSTANCE_ID:I = 0x68

.field private static final LISTS:I = 0x1

.field private static final LIST_ID:I = 0x2

.field private static final OPERATIONS:I = 0x186a0

.field private static final PROPERTIES:I = 0x3eb

.field private static final PROPERTY_ID:I = 0x3ec

.field private static final SEARCH:I = 0x3ef

.field private static final SYNCSTATE:I = 0x3f0

.field private static final SYNCSTATE_ID:I = 0x3f1

.field private static final TASKS:I = 0x65

.field private static final TASK_ID:I = 0x66

.field private static final TASK_LIST_SYNC_COLUMNS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field mAsyncHandler:Landroid/os/Handler;

.field mAuthority:Ljava/lang/String;

.field private mListProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/provider/tasks/processors/EntityProcessor",
            "<",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;>;"
        }
    .end annotation
.end field

.field private mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

.field private mTaskProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/provider/tasks/processors/EntityProcessor",
            "<",
            "Lorg/dmfs/provider/tasks/model/TaskAdapter;",
            ">;>;"
        }
    .end annotation
.end field

.field private mUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/HashSet;

    sget-object v1, Lorg/dmfs/provider/tasks/TaskContract$TaskLists;->SYNC_ADAPTER_COLUMNS:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskProvider;->TASK_LIST_SYNC_COLUMNS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mListProcessors:Ljava/util/List;

    new-instance v0, Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    invoke-direct {v0}, Lorg/dmfs/provider/tasks/ProviderOperationsLog;-><init>()V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    return-void
.end method

.method private _selectId(Ljava/lang/StringBuilder;JLjava/lang/String;)Ljava/lang/StringBuilder;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_b

    const-string v0, " AND "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    return-object p1
.end method

.method private getId(Landroid/net/Uri;)J
    .registers 4

    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method private getProviderInfo()Landroid/content/pm/ProviderInfo;
    .registers 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x8

    if-gt v3, v4, :cond_69

    :try_start_12
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x88

    invoke-virtual {v1, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_1b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_12 .. :try_end_1b} :catch_32

    move-result-object v0

    iget-object v3, v0, Landroid/content/pm/PackageInfo;->providers:[Landroid/content/pm/ProviderInfo;

    array-length v4, v3

    const/4 v0, 0x0

    move v1, v0

    :goto_21
    if-ge v1, v4, :cond_61

    aget-object v0, v3, v1

    :try_start_25
    iget-object v5, v0, Landroid/content/pm/ProviderInfo;->name:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    :try_end_2e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_25 .. :try_end_2e} :catch_3b

    move-result v5

    if-eqz v5, :cond_5d

    :goto_31
    return-object v0

    :catch_32
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not find Provider!"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_3b
    move-exception v1

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing provider class \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, v0, Landroid/content/pm/ProviderInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5d
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_21

    :cond_61
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Could not find Provider!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_69
    :try_start_69
    new-instance v3, Landroid/content/ComponentName;

    invoke-direct {v3, v0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v0, 0x88

    invoke-virtual {v1, v3, v0}, Landroid/content/pm/PackageManager;->getProviderInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ProviderInfo;
    :try_end_73
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_69 .. :try_end_73} :catch_75

    move-result-object v0

    goto :goto_31

    :catch_75
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not find Provider!"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private updateNotifications()V
    .registers 3

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAsyncHandler:Landroid/os/Handler;

    new-instance v1, Lorg/dmfs/provider/tasks/TaskProvider$1;

    invoke-direct {v1, p0}, Lorg/dmfs/provider/tasks/TaskProvider$1;-><init>(Lorg/dmfs/provider/tasks/TaskProvider;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private validateAlarmValues(Landroid/content/ContentValues;ZZ)V
    .registers 6

    const-string v0, "alarm_id"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ALARM_ID can not be set manually"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    return-void
.end method

.method private validateCategoryValues(Landroid/content/ContentValues;ZZ)V
    .registers 6

    const-string v0, "_id"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_10

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "_ID can not be set manually"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_10
    const-string v0, "account_name"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eq p2, v0, :cond_2a

    if-eqz p2, :cond_22

    const-string v0, "account_name"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2a

    :cond_22
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_NAME is write-once and required on INSERT"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2a
    const-string v0, "account_type"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eq p2, v0, :cond_44

    if-eqz p2, :cond_3c

    const-string v0, "account_type"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_44

    :cond_3c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ACCOUNT_TYPE is write-once and required on INSERT"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_44
    return-void
.end method


# virtual methods
.method public bridge synthetic applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    invoke-super {p0, p1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .registers 4

    invoke-super {p0, p1, p2}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 5

    invoke-super {p0, p1, p2, p3}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public deleteInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Z)I
    .registers 22

    const/4 v12, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v5

    sparse-switch v5, :sswitch_data_23c

    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :sswitch_39
    if-nez p5, :cond_43

    new-instance v3, Ljava/lang/IllegalAccessError;

    const-string v4, "only sync adapters may access syncstate"

    invoke-direct {v3, v4}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_43
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5f

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_67

    :cond_5f
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "uri must contain an account when accessing syncstate"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_67
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectAccount(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "SyncState"

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-virtual {v0, v4, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    :goto_81
    if-lez v11, :cond_a4

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Instances;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    :cond_a4
    return v11

    :sswitch_a5
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_b5
    if-eqz p5, :cond_de

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_c3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_de

    :cond_c3
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Sync adapters must specify an account and account type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_de
    const-string v4, "Lists"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v3, p1

    move-object/from16 v7, p4

    invoke-virtual/range {v3 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    move v11, v12

    :goto_ee
    :try_start_ee
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_120

    new-instance v6, Lorg/dmfs/provider/tasks/model/CursorContentValuesListAdapter;

    sget-object v3, Lorg/dmfs/provider/tasks/model/ListAdapter;->_ID:Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;

    invoke-virtual {v3, v10}, Lorg/dmfs/provider/tasks/model/adapters/LongFieldAdapter;->getFrom(Landroid/database/Cursor;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    invoke-direct {v6, v3, v4, v10, v5}, Lorg/dmfs/provider/tasks/model/CursorContentValuesListAdapter;-><init>(JLandroid/database/Cursor;Landroid/content/ContentValues;)V

    sget-object v3, Lorg/dmfs/provider/tasks/ProviderOperation;->DELETE:Lorg/dmfs/provider/tasks/ProviderOperation;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mListProcessors:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    move-object/from16 v4, p1

    move/from16 v7, p5

    invoke-virtual/range {v3 .. v9}, Lorg/dmfs/provider/tasks/ProviderOperation;->execute(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;Lorg/dmfs/provider/tasks/model/EntityAdapter;ZLorg/dmfs/provider/tasks/ProviderOperationsLog;Ljava/lang/String;)V
    :try_end_11d
    .catchall {:try_start_ee .. :try_end_11d} :catchall_125

    add-int/lit8 v11, v11, 0x1

    goto :goto_ee

    :cond_120
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto/16 :goto_81

    :catchall_125
    move-exception v3

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v3

    :sswitch_12a
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v5, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_13a
    if-eqz p5, :cond_163

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_148

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_163

    :cond_148
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Sync adapters must specify an account and account type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_163
    const-string v4, "Task_View"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v3, p1

    move-object/from16 v7, p4

    invoke-virtual/range {v3 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    move v11, v12

    :goto_173
    :try_start_173
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_19b

    new-instance v6, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    invoke-direct {v6, v10, v3}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;-><init>(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    sget-object v3, Lorg/dmfs/provider/tasks/ProviderOperation;->DELETE:Lorg/dmfs/provider/tasks/ProviderOperation;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    move-object/from16 v4, p1

    move/from16 v7, p5

    invoke-virtual/range {v3 .. v9}, Lorg/dmfs/provider/tasks/ProviderOperation;->execute(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;Lorg/dmfs/provider/tasks/model/EntityAdapter;ZLorg/dmfs/provider/tasks/ProviderOperationsLog;Ljava/lang/String;)V
    :try_end_198
    .catchall {:try_start_173 .. :try_end_198} :catchall_1a0

    add-int/lit8 v11, v11, 0x1

    goto :goto_173

    :cond_19b
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto/16 :goto_81

    :catchall_1a0
    move-exception v3

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v3

    :sswitch_1a5
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    :sswitch_1b5
    const-string v3, "Alarms"

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v0, v3, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v11

    goto/16 :goto_81

    :sswitch_1c3
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectPropertyId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_1d3
    const-string v4, "Properties"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v3, p1

    move-object/from16 v7, p4

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    :try_start_1e1
    const-string v3, "property_id"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    const-string v3, "task_id"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    const-string v3, "mimetype"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    move v11, v12

    :goto_1f4
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_217

    invoke-interface {v9, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-interface {v9, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-interface {v9, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_22e

    invoke-static {v3}, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->get(Ljava/lang/String;)Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    move-result-object v3

    move-object/from16 v4, p1

    move/from16 v10, p5

    invoke-virtual/range {v3 .. v10}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->delete(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/database/Cursor;Z)I
    :try_end_213
    .catchall {:try_start_1e1 .. :try_end_213} :catchall_229

    move-result v3

    add-int/2addr v3, v11

    :goto_215
    move v11, v3

    goto :goto_1f4

    :cond_217
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Properties;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    goto/16 :goto_81

    :catchall_229
    move-exception v3

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v3

    :cond_22e
    move v3, v11

    goto :goto_215

    :sswitch_230
    move-object/from16 v6, p3

    goto :goto_1d3

    :sswitch_233
    move-object/from16 v6, p3

    goto/16 :goto_13a

    :sswitch_237
    move-object/from16 v6, p3

    goto/16 :goto_b5

    nop

    :sswitch_data_23c
    .sparse-switch
        0x1 -> :sswitch_237
        0x2 -> :sswitch_a5
        0x65 -> :sswitch_233
        0x66 -> :sswitch_12a
        0x3eb -> :sswitch_230
        0x3ec -> :sswitch_1c3
        0x3ed -> :sswitch_1b5
        0x3ee -> :sswitch_1a5
        0x3f0 -> :sswitch_39
        0x3f1 -> :sswitch_39
    .end sparse-switch
.end method

.method protected getAccountName(Landroid/net/Uri;)Ljava/lang/String;
    .registers 3

    const-string v0, "account_name"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getAccountType(Landroid/net/Uri;)Ljava/lang/String;
    .registers 3

    const-string v0, "account_type"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDatabaseHelper()Landroid/database/sqlite/SQLiteOpenHelper;
    .registers 2

    invoke-super {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->getDatabaseHelper()Landroid/database/sqlite/SQLiteOpenHelper;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseHelper(Landroid/content/Context;)Landroid/database/sqlite/SQLiteOpenHelper;
    .registers 3

    new-instance v0, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;

    invoke-direct {v0, p1, p0}, Lorg/dmfs/provider/tasks/TaskDatabaseHelper;-><init>(Landroid/content/Context;Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;)V

    return-object v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .registers 5

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    sparse-switch v0, :sswitch_data_32

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_22
    const-string v0, "vnd.android.cursor.dir/org.dmfs.tasks.tasklists"

    :goto_24
    return-object v0

    :sswitch_25
    const-string v0, "vnd.android.cursor.item/org.dmfs.tasks.tasklists"

    goto :goto_24

    :sswitch_28
    const-string v0, "vnd.android.cursor.dir/org.dmfs.tasks.tasks"

    goto :goto_24

    :sswitch_2b
    const-string v0, "vnd.android.cursor.item/org.dmfs.tasks.tasks"

    goto :goto_24

    :sswitch_2e
    const-string v0, "vnd.android.cursor.dir/org.dmfs.tasks.instances"

    goto :goto_24

    nop

    :sswitch_data_32
    .sparse-switch
        0x1 -> :sswitch_22
        0x2 -> :sswitch_25
        0x65 -> :sswitch_28
        0x66 -> :sswitch_2b
        0x67 -> :sswitch_2e
    .end sparse-switch
.end method

.method public bridge synthetic insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .registers 4

    invoke-super {p0, p1, p2}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public insertInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Z)Landroid/net/Uri;
    .registers 14

    const-wide/16 v7, 0x0

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    sparse-switch v2, :sswitch_data_13e

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URI "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_2c
    if-nez p4, :cond_36

    new-instance v0, Ljava/lang/IllegalAccessError;

    const-string v1, "only sync adapters may access syncstate"

    invoke-direct {v0, v1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_42

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4a

    :cond_42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "uri must contain an account when accessing syncstate"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4a
    const-string v2, "account_name"

    invoke-virtual {p3, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "account_type"

    invoke-virtual {p3, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "SyncState"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, p3}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v0}, Lorg/dmfs/provider/tasks/TaskContract$SyncState;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :cond_61
    :goto_61
    cmp-long v3, v1, v7

    if-lez v3, :cond_125

    if-eqz v0, :cond_125

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    return-object v0

    :sswitch_72
    new-instance v3, Lorg/dmfs/provider/tasks/model/ContentValuesListAdapter;

    invoke-direct {v3, p3}, Lorg/dmfs/provider/tasks/model/ContentValuesListAdapter;-><init>(Landroid/content/ContentValues;)V

    sget-object v2, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_NAME:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v3, v2, v0}, Lorg/dmfs/provider/tasks/model/ListAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v0, Lorg/dmfs/provider/tasks/model/ListAdapter;->ACCOUNT_TYPE:Lorg/dmfs/provider/tasks/model/adapters/StringFieldAdapter;

    invoke-interface {v3, v0, v1}, Lorg/dmfs/provider/tasks/model/ListAdapter;->set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V

    sget-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->INSERT:Lorg/dmfs/provider/tasks/ProviderOperation;

    iget-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mListProcessors:Ljava/util/List;

    iget-object v5, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    iget-object v6, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    move-object v1, p1

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/provider/tasks/ProviderOperation;->execute(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;Lorg/dmfs/provider/tasks/model/EntityAdapter;ZLorg/dmfs/provider/tasks/ProviderOperationsLog;Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/dmfs/provider/tasks/model/ListAdapter;->id()J

    move-result-wide v1

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v0}, Lorg/dmfs/provider/tasks/TaskContract$TaskLists;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_61

    :sswitch_99
    new-instance v3, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;

    invoke-direct {v3, p3}, Lorg/dmfs/provider/tasks/model/ContentValuesTaskAdapter;-><init>(Landroid/content/ContentValues;)V

    sget-object v0, Lorg/dmfs/provider/tasks/ProviderOperation;->INSERT:Lorg/dmfs/provider/tasks/ProviderOperation;

    iget-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    iget-object v5, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    iget-object v6, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    move-object v1, p1

    move v4, p4

    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/provider/tasks/ProviderOperation;->execute(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;Lorg/dmfs/provider/tasks/model/EntityAdapter;ZLorg/dmfs/provider/tasks/ProviderOperationsLog;Ljava/lang/String;)V

    invoke-interface {v3}, Lorg/dmfs/provider/tasks/model/TaskAdapter;->id()J

    move-result-wide v1

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v0}, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-object v3, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Instances;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    iget-object v3, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    goto :goto_61

    :sswitch_c8
    const-string v0, "mimetype"

    invoke-virtual {p3, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_d8

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "missing mimetype in property values"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d8
    const-string v1, "task_id"

    invoke-virtual {p3, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    if-nez v1, :cond_e8

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "missing task id in property values"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e8
    const-string v2, "property_id"

    invoke-virtual {p3, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f8

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "property id can not be written"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f8
    invoke-static {v0}, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->get(Ljava/lang/String;)Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    move-object v1, p1

    move-object v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->insert(Landroid/database/sqlite/SQLiteDatabase;JLandroid/content/ContentValues;Z)J

    move-result-wide v1

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v0}, Lorg/dmfs/provider/tasks/TaskContract$Properties;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    cmp-long v3, v1, v7

    if-ltz v3, :cond_61

    iget-object v3, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    iget-object v3, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Instances;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    goto/16 :goto_61

    :cond_125
    new-instance v0, Landroid/database/SQLException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to insert row into "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/database/SQLException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_data_13e
    .sparse-switch
        0x1 -> :sswitch_72
        0x65 -> :sswitch_99
        0x3eb -> :sswitch_c8
        0x3f0 -> :sswitch_2c
    .end sparse-switch
.end method

.method public isCallerSyncAdapter(Landroid/net/Uri;)Z
    .registers 4

    const-string v0, "caller_is_syncadapter"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_12

    const-string v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public onAccountsUpdated([Landroid/accounts/Account;)V
    .registers 5

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getDatabaseHelper()Landroid/database/sqlite/SQLiteOpenHelper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v0, v1, p1, v2}, Lorg/dmfs/provider/tasks/Utils;->cleanUpLists(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;[Landroid/accounts/Account;Ljava/lang/String;)V

    return-void
.end method

.method public onCreate()Z
    .registers 6

    const/4 v4, 0x1

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getProviderInfo()Landroid/content/pm/ProviderInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    iput-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/tasks/TaskValidatorProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/tasks/RelationProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/tasks/RelationProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/tasks/TaskInstancesProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/tasks/FtsProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/tasks/FtsProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/tasks/ChangeListProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/tasks/TaskExecutionProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/tasks/TaskExecutionProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mListProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/lists/ListValidatorProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mListProcessors:Ljava/util/List;

    new-instance v1, Lorg/dmfs/provider/tasks/processors/lists/ListExecutionProcessor;

    invoke-direct {v1}, Lorg/dmfs/provider/tasks/processors/lists/ListExecutionProcessor;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "tasklists"

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "tasklists/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "tasks"

    const/16 v3, 0x65

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "tasks/#"

    const/16 v3, 0x66

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "instances"

    const/16 v3, 0x67

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "instances/#"

    const/16 v3, 0x68

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "properties"

    const/16 v3, 0x3eb

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "properties/#"

    const/16 v3, 0x3ec

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "categories"

    const/16 v3, 0x3e9

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "categories/#"

    const/16 v3, 0x3ea

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "alarms"

    const/16 v3, 0x3ed

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "alarms/#"

    const/16 v3, 0x3ee

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "tasks_search"

    const/16 v3, 0x3ef

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "syncstate"

    const/16 v3, 0x3f0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const-string v2, "syncstate/#"

    const/16 v3, 0x3f1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    const v2, 0x186a0

    invoke-static {v0, v1, v2}, Lorg/dmfs/provider/tasks/ContentOperation;->register(Landroid/content/UriMatcher;Ljava/lang/String;I)V

    invoke-super {p0}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onCreate()Z

    move-result v0

    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "backgroundHandler"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v2, Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v2, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAsyncHandler:Landroid/os/Handler;

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAsyncHandler:Landroid/os/Handler;

    invoke-virtual {v1, p0, v2, v4}, Landroid/accounts/AccountManager;->addOnAccountsUpdatedListener(Landroid/accounts/OnAccountsUpdateListener;Landroid/os/Handler;Z)V

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->updateNotifications()V

    return v0
.end method

.method public onDatabaseCreated(Landroid/database/sqlite/SQLiteDatabase;)V
    .registers 5

    new-instance v0, Landroid/content/Intent;

    const-string v1, "org.dmfs.tasks.DATABASE_INITIALIZED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v1}, Lorg/dmfs/provider/tasks/TaskContract;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "vnd.android.cursor.dir/vnd.org.dmfs.authority.mimetype"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public onDatabaseUpdate(Landroid/database/sqlite/SQLiteDatabase;II)V
    .registers 6

    const/16 v0, 0xf

    if-ge p2, v0, :cond_e

    iget-object v0, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAsyncHandler:Landroid/os/Handler;

    new-instance v1, Lorg/dmfs/provider/tasks/TaskProvider$2;

    invoke-direct {v1, p0}, Lorg/dmfs/provider/tasks/TaskProvider$2;-><init>(Lorg/dmfs/provider/tasks/TaskProvider;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_e
    return-void
.end method

.method protected onEndTransaction(Z)V
    .registers 5

    invoke-super {p0, p1}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->onEndTransaction(Z)V

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PROVIDER_CHANGED"

    iget-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v2}, Lorg/dmfs/provider/tasks/TaskContract;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1b

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->updateNotifications()V

    :cond_1b
    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/dmfs/provider/tasks/ProviderOperationsLog;->toBundle(Z)Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .registers 15

    const/4 v6, 0x0

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getDatabaseHelper()Landroid/database/sqlite/SQLiteOpenHelper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    new-instance v1, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v1}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    const-string v2, " 1=1 "

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->isCallerSyncAdapter(Landroid/net/Uri;)Z

    move-result v2

    iget-object v3, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    sparse-switch v3, :sswitch_data_1d6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URI "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :sswitch_39
    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4d

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_55

    :cond_4d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "uri must contain an account when accessing syncstate"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_55
    invoke-virtual {p0, v1, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectAccount(Landroid/database/sqlite/SQLiteQueryBuilder;Landroid/net/Uri;)V

    const-string v2, "SyncState"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object v8, p5

    :goto_5e
    move-object v2, v0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v7, v6

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_74

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    :cond_74
    :goto_74
    return-object v0

    :sswitch_75
    invoke-virtual {p0, v1, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectAccount(Landroid/database/sqlite/SQLiteQueryBuilder;Landroid/net/Uri;)V

    const-string v2, "Lists"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    if-eqz p5, :cond_85

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_85
    const-string p5, "account_name, list_name"

    move-object v8, p5

    goto :goto_5e

    :sswitch_89
    invoke-virtual {p0, v1, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectAccount(Landroid/database/sqlite/SQLiteQueryBuilder;Landroid/net/Uri;)V

    const-string v2, "Lists"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    const-string v2, "_id"

    invoke-virtual {p0, v1, v2, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/String;Landroid/net/Uri;)V

    if-eqz p5, :cond_9e

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_9e
    const-string p5, "account_name, list_name"

    move-object v8, p5

    goto :goto_5e

    :sswitch_a2
    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->shouldLoadProperties(Landroid/net/Uri;)Z

    move-result v3

    if-eqz v3, :cond_ca

    const-string v3, "Task_Property_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    :goto_ad
    if-nez v2, :cond_be

    const-string v2, " AND "

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "_deleted"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "=0"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    :cond_be
    if-eqz p5, :cond_c6

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_c6
    const-string p5, "due"

    move-object v8, p5

    goto :goto_5e

    :cond_ca
    const-string v3, "Task_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto :goto_ad

    :sswitch_d0
    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->shouldLoadProperties(Landroid/net/Uri;)Z

    move-result v3

    if-eqz v3, :cond_fe

    const-string v3, "Task_Property_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    :goto_db
    const-string v3, "_id"

    invoke-virtual {p0, v1, v3, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/String;Landroid/net/Uri;)V

    if-nez v2, :cond_f1

    const-string v2, " AND "

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "_deleted"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "=0"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    :cond_f1
    if-eqz p5, :cond_f9

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_f9
    const-string p5, "due"

    move-object v8, p5

    goto/16 :goto_5e

    :cond_fe
    const-string v3, "Task_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto :goto_db

    :sswitch_104
    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->shouldLoadProperties(Landroid/net/Uri;)Z

    move-result v3

    if-eqz v3, :cond_12d

    const-string v3, "Instance_Property_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    :goto_10f
    if-nez v2, :cond_120

    const-string v2, " AND "

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "_deleted"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "=0"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    :cond_120
    if-eqz p5, :cond_128

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_128
    const-string p5, "instance_due_sorting"

    move-object v8, p5

    goto/16 :goto_5e

    :cond_12d
    const-string v3, "Instance_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto :goto_10f

    :sswitch_133
    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->shouldLoadProperties(Landroid/net/Uri;)Z

    move-result v3

    if-eqz v3, :cond_161

    const-string v3, "Instance_Property_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    :goto_13e
    const-string v3, "_id"

    invoke-virtual {p0, v1, v3, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/String;Landroid/net/Uri;)V

    if-nez v2, :cond_154

    const-string v2, " AND "

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "_deleted"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "=0"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    :cond_154
    if-eqz p5, :cond_15c

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_15c
    const-string p5, "instance_due_sorting"

    move-object v8, p5

    goto/16 :goto_5e

    :cond_161
    const-string v3, "Instance_View"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto :goto_13e

    :sswitch_167
    invoke-virtual {p0, v1, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectAccount(Landroid/database/sqlite/SQLiteQueryBuilder;Landroid/net/Uri;)V

    const-string v2, "Categories"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    if-eqz p5, :cond_177

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_177
    const-string p5, "name"

    move-object v8, p5

    goto/16 :goto_5e

    :sswitch_17c
    invoke-virtual {p0, v1, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectAccount(Landroid/database/sqlite/SQLiteQueryBuilder;Landroid/net/Uri;)V

    const-string v2, "Categories"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    const-string v2, "_id"

    invoke-virtual {p0, v1, v2, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/String;Landroid/net/Uri;)V

    if-eqz p5, :cond_191

    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1d2

    :cond_191
    const-string p5, "name"

    move-object v8, p5

    goto/16 :goto_5e

    :sswitch_196
    const-string v2, "Properties"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object v8, p5

    goto/16 :goto_5e

    :sswitch_19e
    const-string v2, "Properties"

    invoke-virtual {v1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    const-string v2, "property_id"

    invoke-virtual {p0, v1, v2, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/String;Landroid/net/Uri;)V

    move-object v8, p5

    goto/16 :goto_5e

    :sswitch_1ab
    const-string v1, "q"

    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v5}, Lorg/dmfs/provider/tasks/FTSDatabaseHelper;->getTaskSearchCursor(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_74

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v2}, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_74

    :cond_1d2
    move-object v8, p5

    goto/16 :goto_5e

    nop

    :sswitch_data_1d6
    .sparse-switch
        0x1 -> :sswitch_75
        0x2 -> :sswitch_89
        0x65 -> :sswitch_a2
        0x66 -> :sswitch_d0
        0x67 -> :sswitch_104
        0x68 -> :sswitch_133
        0x3e9 -> :sswitch_167
        0x3ea -> :sswitch_17c
        0x3eb -> :sswitch_196
        0x3ec -> :sswitch_19e
        0x3ef -> :sswitch_1ab
        0x3f0 -> :sswitch_39
        0x3f1 -> :sswitch_39
    .end sparse-switch
.end method

.method protected selectAccount(Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectAccount(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectAccount(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 6

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_c

    if-eqz v1, :cond_40

    :cond_c
    if-eqz v0, :cond_26

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_19

    const-string v2, " AND "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_19
    const-string v2, "account_name"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, v0}, Landroid/database/DatabaseUtils;->appendEscapedSQLString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    :cond_26
    if-eqz v1, :cond_40

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_33

    const-string v0, " AND "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_33
    const-string v0, "account_type"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1, v1}, Landroid/database/DatabaseUtils;->appendEscapedSQLString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    :cond_40
    return-object p1
.end method

.method protected selectAccount(Landroid/database/sqlite/SQLiteQueryBuilder;Landroid/net/Uri;)V
    .registers 6

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_1c

    const-string v2, " AND "

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "account_name"

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v2, "="

    invoke-virtual {p1, v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhereEscapeString(Ljava/lang/String;)V

    :cond_1c
    if-eqz v1, :cond_30

    const-string v0, " AND "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v0, "account_type"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v0, "="

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhereEscapeString(Ljava/lang/String;)V

    :cond_30
    return-void
.end method

.method protected selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectId(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 6

    invoke-direct {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getId(Landroid/net/Uri;)J

    move-result-wide v0

    const-string v2, "_id"

    invoke-direct {p0, p1, v0, v1, v2}, Lorg/dmfs/provider/tasks/TaskProvider;->_selectId(Ljava/lang/StringBuilder;JLjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectId(Landroid/database/sqlite/SQLiteQueryBuilder;Ljava/lang/String;Landroid/net/Uri;)V
    .registers 6

    const-string v0, " AND "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    const-string v0, "="

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    invoke-direct {p0, p3}, Lorg/dmfs/provider/tasks/TaskProvider;->getId(Landroid/net/Uri;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected selectPropertyId(J)Ljava/lang/StringBuilder;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0, p1, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->selectPropertyId(Ljava/lang/StringBuilder;J)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectPropertyId(Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectPropertyId(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectPropertyId(Ljava/lang/StringBuilder;J)Ljava/lang/StringBuilder;
    .registers 5

    const-string v0, "property_id"

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/dmfs/provider/tasks/TaskProvider;->_selectId(Ljava/lang/StringBuilder;JLjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectPropertyId(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 5

    invoke-direct {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getId(Landroid/net/Uri;)J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectPropertyId(Ljava/lang/StringBuilder;J)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectTaskId(J)Ljava/lang/StringBuilder;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0, p1, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->selectTaskId(Ljava/lang/StringBuilder;J)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectTaskId(Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0, v0, p1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectTaskId(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectTaskId(Ljava/lang/StringBuilder;J)Ljava/lang/StringBuilder;
    .registers 5

    const-string v0, "task_id"

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/dmfs/provider/tasks/TaskProvider;->_selectId(Ljava/lang/StringBuilder;JLjava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected selectTaskId(Ljava/lang/StringBuilder;Landroid/net/Uri;)Ljava/lang/StringBuilder;
    .registers 5

    invoke-direct {p0, p2}, Lorg/dmfs/provider/tasks/TaskProvider;->getId(Landroid/net/Uri;)J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectTaskId(Ljava/lang/StringBuilder;J)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public shouldLoadProperties(Landroid/net/Uri;)Z
    .registers 4

    const-string v0, "load_properties"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_12

    const-string v1, "false"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method protected syncToNetwork(Landroid/net/Uri;)Z
    .registers 3

    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .registers 6

    invoke-super {p0, p1, p2, p3, p4}, Lorg/dmfs/provider/tasks/SQLiteContentProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public updateInTransaction(Landroid/database/sqlite/SQLiteDatabase;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;Z)I
    .registers 23
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    const/4 v12, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    sparse-switch v3, :sswitch_data_2c2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    const v4, 0x186a0

    invoke-static {v3, v4}, Lorg/dmfs/provider/tasks/ContentOperation;->get(II)Lorg/dmfs/provider/tasks/ContentOperation;

    move-result-object v3

    if-nez v3, :cond_28a

    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown URI "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :sswitch_3c
    if-nez p6, :cond_46

    new-instance v3, Ljava/lang/IllegalAccessError;

    const-string v4, "only sync adapters may access syncstate"

    invoke-direct {v3, v4}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_46
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->getAccountType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_62

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6a

    :cond_62
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "uri must contain an account when accessing syncstate"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_6a
    invoke-virtual/range {p3 .. p3}, Landroid/content/ContentValues;->size()I

    move-result v5

    if-nez v5, :cond_97

    :cond_70
    :goto_70
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-ge v3, v4, :cond_2ae

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual/range {p3 .. p3}, Landroid/content/ContentValues;->valueSet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_83
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29d

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_83

    :cond_97
    const-string v5, "account_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "account_type"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "SyncState"

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->replace(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-ltz v3, :cond_70

    const/4 v12, 0x1

    goto :goto_70

    :sswitch_b8
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_c8
    const-string v4, "Lists"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v3, p1

    move-object/from16 v7, p5

    invoke-virtual/range {v3 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    const-string v3, "_id"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v11

    :goto_dd
    :try_start_dd
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_115

    invoke-interface {v10, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    new-instance v6, Lorg/dmfs/provider/tasks/model/CursorContentValuesListAdapter;

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v3

    const/4 v7, 0x1

    if-le v3, v7, :cond_112

    new-instance v3, Landroid/content/ContentValues;

    move-object/from16 v0, p3

    invoke-direct {v3, v0}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    :goto_f7
    invoke-direct {v6, v4, v5, v10, v3}, Lorg/dmfs/provider/tasks/model/CursorContentValuesListAdapter;-><init>(JLandroid/database/Cursor;Landroid/content/ContentValues;)V

    sget-object v3, Lorg/dmfs/provider/tasks/ProviderOperation;->UPDATE:Lorg/dmfs/provider/tasks/ProviderOperation;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mListProcessors:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    move-object/from16 v4, p1

    move/from16 v7, p6

    invoke-virtual/range {v3 .. v9}, Lorg/dmfs/provider/tasks/ProviderOperation;->execute(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;Lorg/dmfs/provider/tasks/model/EntityAdapter;ZLorg/dmfs/provider/tasks/ProviderOperationsLog;Ljava/lang/String;)V
    :try_end_10f
    .catchall {:try_start_dd .. :try_end_10f} :catchall_11a

    add-int/lit8 v12, v12, 0x1

    goto :goto_dd

    :cond_112
    move-object/from16 v3, p3

    goto :goto_f7

    :cond_115
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto/16 :goto_70

    :catchall_11a
    move-exception v3

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v3

    :sswitch_11f
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_12f
    const-string v4, "Task_View"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v3, p1

    move-object/from16 v7, p5

    invoke-virtual/range {v3 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    :goto_13e
    :try_start_13e
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_172

    new-instance v6, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_16f

    new-instance v3, Landroid/content/ContentValues;

    move-object/from16 v0, p3

    invoke-direct {v3, v0}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    :goto_154
    invoke-direct {v6, v10, v3}, Lorg/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter;-><init>(Landroid/database/Cursor;Landroid/content/ContentValues;)V

    sget-object v3, Lorg/dmfs/provider/tasks/ProviderOperation;->UPDATE:Lorg/dmfs/provider/tasks/ProviderOperation;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mTaskProcessors:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mOperationsLog:Lorg/dmfs/provider/tasks/ProviderOperationsLog;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    move-object/from16 v4, p1

    move/from16 v7, p6

    invoke-virtual/range {v3 .. v9}, Lorg/dmfs/provider/tasks/ProviderOperation;->execute(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;Lorg/dmfs/provider/tasks/model/EntityAdapter;ZLorg/dmfs/provider/tasks/ProviderOperationsLog;Ljava/lang/String;)V
    :try_end_16c
    .catchall {:try_start_13e .. :try_end_16c} :catchall_193

    add-int/lit8 v12, v12, 0x1

    goto :goto_13e

    :cond_16f
    move-object/from16 v3, p3

    goto :goto_154

    :cond_172
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    if-lez v12, :cond_70

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Instances;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Tasks;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    goto/16 :goto_70

    :catchall_193
    move-exception v3

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v3

    :sswitch_198
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectPropertyId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_1a8
    const-string v3, "mimetype"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1ba

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "property mimetypes can not be modified"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1ba
    const-string v3, "task_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1cc

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "task id can not be changed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1cc
    const-string v3, "property_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1de

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "property id can not be changed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1de
    const-string v4, "Properties"

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object/from16 v3, p1

    move-object/from16 v7, p5

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    :try_start_1ec
    const-string v3, "property_id"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    const-string v3, "task_id"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    const-string v3, "mimetype"

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v15

    :goto_1fe
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_223

    invoke-interface {v10, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-interface {v10, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-interface {v10, v15}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2b3

    invoke-static {v3}, Lorg/dmfs/provider/tasks/handler/PropertyHandlerFactory;->get(Ljava/lang/String;)Lorg/dmfs/provider/tasks/handler/PropertyHandler;

    move-result-object v3

    move-object/from16 v4, p1

    move-object/from16 v9, p3

    move/from16 v11, p6

    invoke-virtual/range {v3 .. v11}, Lorg/dmfs/provider/tasks/handler/PropertyHandler;->update(Landroid/database/sqlite/SQLiteDatabase;JJLandroid/content/ContentValues;Landroid/database/Cursor;Z)I
    :try_end_21f
    .catchall {:try_start_1ec .. :try_end_21f} :catchall_235

    move-result v3

    add-int/2addr v3, v12

    :goto_221
    move v12, v3

    goto :goto_1fe

    :cond_223
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAuthority:Ljava/lang/String;

    invoke-static {v3}, Lorg/dmfs/provider/tasks/TaskContract$Properties;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    goto/16 :goto_70

    :catchall_235
    move-exception v3

    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v3

    :sswitch_23a
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, p6

    invoke-direct {v0, v1, v4, v2}, Lorg/dmfs/provider/tasks/TaskProvider;->validateCategoryValues(Landroid/content/ContentValues;ZZ)V

    const-string v4, "Categories"

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-virtual {v0, v4, v1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v12

    goto/16 :goto_70

    :sswitch_262
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->selectId(Landroid/net/Uri;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v3, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, p6

    invoke-direct {v0, v1, v4, v2}, Lorg/dmfs/provider/tasks/TaskProvider;->validateAlarmValues(Landroid/content/ContentValues;ZZ)V

    const-string v4, "Alarms"

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p5

    invoke-virtual {v0, v4, v1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v12

    goto/16 :goto_70

    :cond_28a
    invoke-virtual/range {p0 .. p0}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/dmfs/provider/tasks/TaskProvider;->mAsyncHandler:Landroid/os/Handler;

    move-object/from16 v6, p2

    move-object/from16 v7, p1

    move-object/from16 v8, p3

    invoke-virtual/range {v3 .. v8}, Lorg/dmfs/provider/tasks/ContentOperation;->run(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;Landroid/database/sqlite/SQLiteDatabase;Landroid/content/ContentValues;)V

    goto/16 :goto_70

    :cond_29d
    move-object v3, v4

    :goto_29e
    sget-object v4, Lorg/dmfs/provider/tasks/TaskProvider;->TASK_LIST_SYNC_COLUMNS:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_2ad

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lorg/dmfs/provider/tasks/TaskProvider;->postNotifyUri(Landroid/net/Uri;)V

    :cond_2ad
    return v12

    :cond_2ae
    invoke-virtual/range {p3 .. p3}, Landroid/content/ContentValues;->keySet()Ljava/util/Set;

    move-result-object v3

    goto :goto_29e

    :cond_2b3
    move v3, v12

    goto/16 :goto_221

    :sswitch_2b6
    move-object/from16 v6, p4

    goto/16 :goto_c8

    :sswitch_2ba
    move-object/from16 v6, p4

    goto/16 :goto_12f

    :sswitch_2be
    move-object/from16 v6, p4

    goto/16 :goto_1a8

    :sswitch_data_2c2
    .sparse-switch
        0x1 -> :sswitch_2b6
        0x2 -> :sswitch_b8
        0x65 -> :sswitch_2ba
        0x66 -> :sswitch_11f
        0x3ea -> :sswitch_23a
        0x3eb -> :sswitch_2be
        0x3ec -> :sswitch_198
        0x3ee -> :sswitch_262
        0x3f0 -> :sswitch_3c
        0x3f1 -> :sswitch_3c
    .end sparse-switch
.end method

.method protected updateSelection(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    if-eqz p2, :cond_17

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_1c

    const-string v0, "AND ( "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ) "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_17
    :goto_17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1c
    const-string v0, " ( "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ) "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_17
.end method
