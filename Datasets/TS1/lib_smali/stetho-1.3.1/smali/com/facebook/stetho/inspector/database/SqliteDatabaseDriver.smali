.class public Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;
.super Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;
.source "SqliteDatabaseDriver.java"


# annotations
.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# static fields
.field private static final UNINTERESTING_FILENAME_SUFFIXES:[Ljava/lang/String;


# instance fields
.field private final mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

.field private mDatabases:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 33
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "-journal"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "-shm"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "-uid"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "-wal"

    aput-object v2, v0, v1

    sput-object v0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->UNINTERESTING_FILENAME_SUFFIXES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 54
    new-instance v0, Lcom/facebook/stetho/inspector/database/DefaultDatabaseFilesProvider;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/inspector/database/DefaultDatabaseFilesProvider;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;-><init>(Landroid/content/Context;Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "databaseFilesProvider"    # Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    .prologue
    .line 62
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;-><init>(Landroid/content/Context;)V

    .line 63
    iput-object p2, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    .line 64
    return-void
.end method

.method private executeInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .registers 8
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 177
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler<TT;>;"
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v2

    .line 178
    .local v2, "statement":Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v0

    .line 179
    .local v0, "count":J
    invoke-interface {p3, v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;->handleInsert(J)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method private executeRawQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .registers 5
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 198
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler<TT;>;"
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 199
    invoke-interface {p3}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;->handleRawQuery()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private executeSelect(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .registers 6
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 186
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler<TT;>;"
    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 188
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_5
    invoke-interface {p3, v0}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;->handleSelect(Landroid/database/Cursor;)Ljava/lang/Object;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_d

    move-result-object v1

    .line 190
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    return-object v1

    :catchall_d
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private executeUpdateDelete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .registers 7
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 168
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler<TT;>;"
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v1

    .line 169
    .local v1, "statement":Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I

    move-result v0

    .line 170
    .local v0, "count":I
    invoke-interface {p3, v0}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;->handleUpdateDelete(I)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method private static getFirstWord(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 158
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 159
    const/16 v1, 0x20

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 160
    .local v0, "firstSpace":I
    if-ltz v0, :cond_11

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .end local p0    # "s":Ljava/lang/String;
    :cond_11
    return-object p0
.end method

.method private openDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .registers 6
    .param p1, "databaseName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 203
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    iget-object v1, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 207
    .local v0, "databaseFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    return-object v1
.end method

.method private static removeSuffix(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "suffixesToRemove"    # [Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 104
    array-length v3, p1

    move v1, v2

    :goto_3
    if-ge v1, v3, :cond_1a

    aget-object v0, p1, v1

    .line 105
    .local v0, "suffix":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 106
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 109
    .end local v0    # "suffix":Ljava/lang/String;
    .end local p0    # "str":Ljava/lang/String;
    :cond_1a
    return-object p0

    .line 104
    .restart local v0    # "suffix":Ljava/lang/String;
    .restart local p0    # "str":Ljava/lang/String;
    :cond_1b
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method static tidyDatabaseList(Ljava/util/List;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "databaseFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 92
    .local v2, "originalAsSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/io/File;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .local v4, "tidiedList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_e
    :goto_e
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_39

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 94
    .local v0, "databaseFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "databaseFilename":Ljava/lang/String;
    sget-object v6, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->UNINTERESTING_FILENAME_SUFFIXES:[Ljava/lang/String;

    invoke-static {v1, v6}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->removeSuffix(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 96
    .local v3, "sansSuffix":Ljava/lang/String;
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_35

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e

    .line 97
    :cond_35
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_e

    .line 100
    .end local v0    # "databaseFile":Ljava/io/File;
    .end local v1    # "databaseFilename":Ljava/lang/String;
    .end local v3    # "sansSuffix":Ljava/lang/String;
    :cond_39
    return-object v4
.end method


# virtual methods
.method public executeSQL(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    .registers 8
    .param p1, "databaseName"    # Ljava/lang/String;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler",
            "<",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;",
            ">;)",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 134
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler<Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;>;"
    invoke-static {p2}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    invoke-static {p3}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->openDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 138
    .local v0, "database":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_a
    invoke-static {p2}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->getFirstWord(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "firstWordUpperCase":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_86

    :cond_1a
    :goto_1a
    packed-switch v2, :pswitch_data_a0

    .line 150
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeRawQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_23
    .catchall {:try_start_a .. :try_end_23} :catchall_81

    .line 153
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    :goto_26
    return-object v2

    .line 139
    :sswitch_27
    :try_start_27
    const-string v3, "UPDATE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x0

    goto :goto_1a

    :sswitch_31
    const-string v3, "DELETE"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x1

    goto :goto_1a

    :sswitch_3b
    const-string v3, "INSERT"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x2

    goto :goto_1a

    :sswitch_45
    const-string v3, "SELECT"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x3

    goto :goto_1a

    :sswitch_4f
    const-string v3, "PRAGMA"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x4

    goto :goto_1a

    :sswitch_59
    const-string v3, "EXPLAIN"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    const/4 v2, 0x5

    goto :goto_1a

    .line 142
    :pswitch_63
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeUpdateDelete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_69
    .catchall {:try_start_27 .. :try_end_69} :catchall_81

    .line 153
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_26

    .line 144
    :pswitch_6d
    :try_start_6d
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_73
    .catchall {:try_start_6d .. :try_end_73} :catchall_81

    .line 153
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_26

    .line 148
    :pswitch_77
    :try_start_77
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeSelect(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_7d
    .catchall {:try_start_77 .. :try_end_7d} :catchall_81

    .line 153
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_26

    .end local v1    # "firstWordUpperCase":Ljava/lang/String;
    :catchall_81
    move-exception v2

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw v2

    .line 139
    :sswitch_data_86
    .sparse-switch
        -0x7efc4947 -> :sswitch_3b
        -0x72da26c4 -> :sswitch_4f
        -0x6e6dd704 -> :sswitch_45
        -0x6a6cd337 -> :sswitch_27
        -0x233caf29 -> :sswitch_59
        0x77f979ab -> :sswitch_31
    .end sparse-switch

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_63
        :pswitch_63
        :pswitch_6d
        :pswitch_77
        :pswitch_77
        :pswitch_77
    .end packed-switch
.end method

.method public getDatabaseNames()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    iget-object v4, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabases:Ljava/util/List;

    if-nez v4, :cond_32

    .line 69
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabases:Ljava/util/List;

    .line 70
    iget-object v4, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    invoke-interface {v4}, Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;->getDatabaseFiles()Ljava/util/List;

    move-result-object v2

    .line 71
    .local v2, "potentialDatabaseFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 72
    invoke-static {v2}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->tidyDatabaseList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 73
    .local v3, "tidiedList":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/io/File;>;"
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_32

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 74
    .local v0, "database":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 75
    .local v1, "name":Ljava/lang/String;
    iget-object v5, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabases:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 78
    .end local v0    # "database":Ljava/io/File;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "potentialDatabaseFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v3    # "tidiedList":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/io/File;>;"
    :cond_32
    iget-object v4, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabases:Ljava/util/List;

    return-object v4
.end method

.method public getTableNames(Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .param p1, "databaseName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->openDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 116
    .local v1, "database":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_4
    const-string v3, "SELECT name FROM sqlite_master WHERE type IN (?, ?)"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "table"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "view"

    aput-object v6, v4, v5

    invoke-virtual {v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_16
    .catchall {:try_start_4 .. :try_end_16} :catchall_30

    move-result-object v0

    .line 119
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_17
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 120
    .local v2, "tableNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_1c
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 121
    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2a
    .catchall {:try_start_17 .. :try_end_2a} :catchall_2b

    goto :goto_1c

    .line 125
    .end local v2    # "tableNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_2b
    move-exception v3

    :try_start_2c
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw v3
    :try_end_30
    .catchall {:try_start_2c .. :try_end_30} :catchall_30

    .line 128
    .end local v0    # "cursor":Landroid/database/Cursor;
    :catchall_30
    move-exception v3

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    throw v3

    .line 125
    .restart local v0    # "cursor":Landroid/database/Cursor;
    .restart local v2    # "tableNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_35
    :try_start_35
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_30

    .line 128
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    return-object v2
.end method
