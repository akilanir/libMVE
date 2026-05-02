.class public abstract Lde/greenrobot/dao/test/DbTest;
.super Landroid/test/AndroidTestCase;
.source "DbTest.java"


# static fields
.field public static final DB_NAME:Ljava/lang/String; = "greendao-unittest-db.temp"


# instance fields
.field private application:Landroid/app/Application;

.field protected db:Landroid/database/sqlite/SQLiteDatabase;

.field protected final inMemory:Z

.field protected final random:Ljava/util/Random;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 49
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lde/greenrobot/dao/test/DbTest;-><init>(Z)V

    .line 50
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "inMemory"    # Z

    .prologue
    .line 52
    invoke-direct {p0}, Landroid/test/AndroidTestCase;-><init>()V

    .line 53
    iput-boolean p1, p0, Lde/greenrobot/dao/test/DbTest;->inMemory:Z

    .line 54
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/test/DbTest;->random:Ljava/util/Random;

    .line 55
    return-void
.end method


# virtual methods
.method public createApplication(Ljava/lang/Class;)Landroid/app/Application;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/app/Application;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 65
    .local p1, "appClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const-string v2, "Application already created"

    iget-object v3, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    invoke-static {v2, v3}, Lde/greenrobot/dao/test/DbTest;->assertNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 68
    :try_start_7
    invoke-virtual {p0}, Lde/greenrobot/dao/test/DbTest;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {p1, v2}, Landroid/app/Instrumentation;->newApplication(Ljava/lang/Class;Landroid/content/Context;)Landroid/app/Application;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_e} :catch_15

    move-result-object v0

    .line 72
    .local v0, "app":Landroid/app/Application;, "TT;"
    invoke-virtual {v0}, Landroid/app/Application;->onCreate()V

    .line 73
    iput-object v0, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    .line 74
    return-object v0

    .line 69
    .end local v0    # "app":Landroid/app/Application;, "TT;"
    :catch_15
    move-exception v1

    .line 70
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not create application "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected createDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 92
    iget-boolean v0, p0, Lde/greenrobot/dao/test/DbTest;->inMemory:Z

    if-eqz v0, :cond_a

    .line 93
    invoke-static {v3}, Landroid/database/sqlite/SQLiteDatabase;->create(Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 96
    :goto_9
    return-object v0

    .line 95
    :cond_a
    invoke-virtual {p0}, Lde/greenrobot/dao/test/DbTest;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "greendao-unittest-db.temp"

    invoke-virtual {v0, v1}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 96
    invoke-virtual {p0}, Lde/greenrobot/dao/test/DbTest;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "greendao-unittest-db.temp"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Context;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    goto :goto_9
.end method

.method public getApplication()Landroid/app/Application;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/app/Application;",
            ">()TT;"
        }
    .end annotation

    .prologue
    .line 86
    const-string v0, "Application not yet created"

    iget-object v1, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    invoke-static {v0, v1}, Lde/greenrobot/dao/test/DbTest;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    iget-object v0, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    return-object v0
.end method

.method protected logTableDump(Ljava/lang/String;)V
    .registers 3
    .param p1, "tablename"    # Ljava/lang/String;

    .prologue
    .line 114
    iget-object v0, p0, Lde/greenrobot/dao/test/DbTest;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v0, p1}, Lde/greenrobot/dao/DbUtils;->logTableDump(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    .line 115
    return-void
.end method

.method protected setUp()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 59
    invoke-super {p0}, Landroid/test/AndroidTestCase;->setUp()V

    .line 60
    invoke-virtual {p0}, Lde/greenrobot/dao/test/DbTest;->createDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/test/DbTest;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 61
    return-void
.end method

.method protected tearDown()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    if-eqz v0, :cond_7

    .line 104
    invoke-virtual {p0}, Lde/greenrobot/dao/test/DbTest;->terminateApplication()V

    .line 106
    :cond_7
    iget-object v0, p0, Lde/greenrobot/dao/test/DbTest;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 107
    iget-boolean v0, p0, Lde/greenrobot/dao/test/DbTest;->inMemory:Z

    if-nez v0, :cond_19

    .line 108
    invoke-virtual {p0}, Lde/greenrobot/dao/test/DbTest;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "greendao-unittest-db.temp"

    invoke-virtual {v0, v1}, Landroid/content/Context;->deleteDatabase(Ljava/lang/String;)Z

    .line 110
    :cond_19
    invoke-super {p0}, Landroid/test/AndroidTestCase;->tearDown()V

    .line 111
    return-void
.end method

.method public terminateApplication()V
    .registers 3

    .prologue
    .line 79
    const-string v0, "Application not yet created"

    iget-object v1, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    invoke-static {v0, v1}, Lde/greenrobot/dao/test/DbTest;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 80
    iget-object v0, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    invoke-virtual {v0}, Landroid/app/Application;->onTerminate()V

    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lde/greenrobot/dao/test/DbTest;->application:Landroid/app/Application;

    .line 82
    return-void
.end method
