.class public final Lorg/dmfs/provider/tasks/TaskContract;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/provider/tasks/TaskContract$Property;,
        Lorg/dmfs/provider/tasks/TaskContract$Properties;,
        Lorg/dmfs/provider/tasks/TaskContract$PropertyColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$PropertySyncColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$Alarms;,
        Lorg/dmfs/provider/tasks/TaskContract$AlarmsColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$Categories;,
        Lorg/dmfs/provider/tasks/TaskContract$CategoriesColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$Instances;,
        Lorg/dmfs/provider/tasks/TaskContract$InstanceColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$Tasks;,
        Lorg/dmfs/provider/tasks/TaskContract$TaskSearchColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$TaskColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$TaskLists;,
        Lorg/dmfs/provider/tasks/TaskContract$TaskListColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$TaskSyncColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$TaskListSyncColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$CommonSyncColumns;,
        Lorg/dmfs/provider/tasks/TaskContract$SyncState;
    }
.end annotation


# static fields
.field public static final ACCOUNT_NAME:Ljava/lang/String; = "account_name"

.field public static final ACCOUNT_TYPE:Ljava/lang/String; = "account_type"

.field public static final ACTION_BROADCAST_TASK_DUE:Ljava/lang/String; = "org.dmfs.android.tasks.TASK_DUE"

.field public static final ACTION_BROADCAST_TASK_STARTING:Ljava/lang/String; = "org.dmfs.android.tasks.TASK_START"

.field public static final ACTION_DATABASE_INITIALIZED:Ljava/lang/String; = "org.dmfs.tasks.DATABASE_INITIALIZED"

.field public static final CALLER_IS_SYNCADAPTER:Ljava/lang/String; = "caller_is_syncadapter"

.field public static final EXTRA_OPERATIONS:Ljava/lang/String; = "org.dmfs.tasks.OPERATIONS"

.field public static final EXTRA_OPERATIONS_URIS:Ljava/lang/String; = "org.dmfs.tasks.OPERATIONS_URIS"

.field public static final EXTRA_TASK_ALLDAY:Ljava/lang/String; = "org.dmfs.provider.tasks.extra.ALLDAY"

.field public static final EXTRA_TASK_TIMESTAMP:Ljava/lang/String; = "org.dmfs.provider.tasks.extra.TIMESTAMP"

.field public static final EXTRA_TASK_TIMEZONE:Ljava/lang/String; = "org.dmfs.provider.tasks.extra.TIMEZONE"

.field public static final EXTRA_TASK_TITLE:Ljava/lang/String; = "org.dmfs.provider.tasks.extra.TITLE"

.field public static final LOAD_PROPERTIES:Ljava/lang/String; = "load_properties"

.field public static final LOCAL_ACCOUNT_NAME:Ljava/lang/String; = "Local"

.field public static final LOCAL_ACCOUNT_TYPE:Ljava/lang/String; = "org.dmfs.account.LOCAL"

.field public static final MIMETYPE_AUTHORITY:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.org.dmfs.authority.mimetype"

.field private static sAuthorities:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sUriFactories:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/dmfs/provider/tasks/UriFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v1, 0x4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract;->sAuthorities:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/dmfs/provider/tasks/TaskContract;->sUriFactories:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;
    .registers 2

    invoke-static {p0}, Lorg/dmfs/provider/tasks/TaskContract;->getUriFactory(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;

    move-result-object v0

    return-object v0
.end method

.method public static final getContentUri(Ljava/lang/String;)Landroid/net/Uri;
    .registers 2

    invoke-static {p0}, Lorg/dmfs/provider/tasks/TaskContract;->getUriFactory(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;

    move-result-object v0

    invoke-virtual {v0}, Lorg/dmfs/provider/tasks/UriFactory;->getUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private static declared-synchronized getUriFactory(Ljava/lang/String;)Lorg/dmfs/provider/tasks/UriFactory;
    .registers 4

    const-class v1, Lorg/dmfs/provider/tasks/TaskContract;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lorg/dmfs/provider/tasks/TaskContract;->sUriFactories:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/provider/tasks/UriFactory;

    if-nez v0, :cond_3f

    new-instance v0, Lorg/dmfs/provider/tasks/UriFactory;

    invoke-direct {v0, p0}, Lorg/dmfs/provider/tasks/UriFactory;-><init>(Ljava/lang/String;)V

    const-string v2, "syncstate"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    const-string v2, "tasklists"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    const-string v2, "tasks"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    const-string v2, "tasks_search"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    const-string v2, "instances"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    const-string v2, "categories"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    const-string v2, "alarms"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    const-string v2, "properties"

    invoke-virtual {v0, v2}, Lorg/dmfs/provider/tasks/UriFactory;->addUri(Ljava/lang/String;)V

    sget-object v2, Lorg/dmfs/provider/tasks/TaskContract;->sUriFactories:Ljava/util/Map;

    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3f
    .catchall {:try_start_3 .. :try_end_3f} :catchall_41

    :cond_3f
    monitor-exit v1

    return-object v0

    :catchall_41
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized taskAuthority(Landroid/content/Context;)Ljava/lang/String;
    .registers 9

    const-class v1, Lorg/dmfs/provider/tasks/TaskContract;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    sget-object v0, Lorg/dmfs/provider/tasks/TaskContract;->sAuthorities:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_19

    sget-object v0, Lorg/dmfs/provider/tasks/TaskContract;->sAuthorities:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_49

    :goto_17
    monitor-exit v1

    return-object v0

    :cond_19
    :try_start_19
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_49

    move-result-object v0

    :try_start_1d
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v0, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_26
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1d .. :try_end_26} :catch_40
    .catchall {:try_start_1d .. :try_end_26} :catchall_49

    move-result-object v0

    :try_start_27
    iget-object v3, v0, Landroid/content/pm/PackageInfo;->providers:[Landroid/content/pm/ProviderInfo;

    array-length v4, v3

    const/4 v0, 0x0

    :goto_2b
    if-ge v0, v4, :cond_56

    aget-object v5, v3, v0
    :try_end_2f
    .catchall {:try_start_27 .. :try_end_2f} :catchall_49

    :try_start_2f
    iget-object v6, v5, Landroid/content/pm/ProviderInfo;->name:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_34
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2f .. :try_end_34} :catch_5e
    .catchall {:try_start_2f .. :try_end_34} :catchall_49

    move-result-object v6

    :try_start_35
    const-class v7, Lorg/dmfs/provider/tasks/TaskProvider;

    invoke-virtual {v7, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_4c

    :goto_3d
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    :catch_40
    move-exception v0

    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Could not find TaskProvider!"

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_49
    .catchall {:try_start_35 .. :try_end_49} :catchall_49

    :catchall_49
    move-exception v0

    monitor-exit v1

    throw v0

    :cond_4c
    :try_start_4c
    sget-object v0, Lorg/dmfs/provider/tasks/TaskContract;->sAuthorities:Ljava/util/Map;

    iget-object v3, v5, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v5, Landroid/content/pm/ProviderInfo;->authority:Ljava/lang/String;

    goto :goto_17

    :cond_56
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "Could not find TaskProvider! Make sure you added it to your AndroidManifest.xml."

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_5e
    .catchall {:try_start_4c .. :try_end_5e} :catchall_49

    :catch_5e
    move-exception v5

    goto :goto_3d
.end method
