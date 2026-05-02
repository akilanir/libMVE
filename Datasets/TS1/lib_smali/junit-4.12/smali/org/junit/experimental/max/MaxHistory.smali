.class public Lorg/junit/experimental/max/MaxHistory;
.super Ljava/lang/Object;
.source "MaxHistory.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/experimental/max/MaxHistory$1;,
        Lorg/junit/experimental/max/MaxHistory$TestComparator;,
        Lorg/junit/experimental/max/MaxHistory$RememberingListener;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final fDurations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final fFailureTimestamps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final fHistoryStore:Ljava/io/File;


# direct methods
.method private constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "storedResults"    # Ljava/io/File;

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/junit/experimental/max/MaxHistory;->fDurations:Ljava/util/Map;

    .line 70
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/junit/experimental/max/MaxHistory;->fFailureTimestamps:Ljava/util/Map;

    .line 74
    iput-object p1, p0, Lorg/junit/experimental/max/MaxHistory;->fHistoryStore:Ljava/io/File;

    .line 75
    return-void
.end method

.method static synthetic access$000(Lorg/junit/experimental/max/MaxHistory;)V
    .registers 1
    .param p0, "x0"    # Lorg/junit/experimental/max/MaxHistory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/junit/experimental/max/MaxHistory;->save()V

    return-void
.end method

.method public static forFolder(Ljava/io/File;)Lorg/junit/experimental/max/MaxHistory;
    .registers 3
    .param p0, "file"    # Ljava/io/File;

    .prologue
    .line 34
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 36
    :try_start_6
    invoke-static {p0}, Lorg/junit/experimental/max/MaxHistory;->readHistory(Ljava/io/File;)Lorg/junit/experimental/max/MaxHistory;
    :try_end_9
    .catch Lorg/junit/experimental/max/CouldNotReadCoreException; {:try_start_6 .. :try_end_9} :catch_b

    move-result-object v1

    .line 42
    :goto_a
    return-object v1

    .line 37
    :catch_b
    move-exception v0

    .line 38
    .local v0, "e":Lorg/junit/experimental/max/CouldNotReadCoreException;
    invoke-virtual {v0}, Lorg/junit/experimental/max/CouldNotReadCoreException;->printStackTrace()V

    .line 39
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 42
    .end local v0    # "e":Lorg/junit/experimental/max/CouldNotReadCoreException;
    :cond_12
    new-instance v1, Lorg/junit/experimental/max/MaxHistory;

    invoke-direct {v1, p0}, Lorg/junit/experimental/max/MaxHistory;-><init>(Ljava/io/File;)V

    goto :goto_a
.end method

.method private static readHistory(Ljava/io/File;)Lorg/junit/experimental/max/MaxHistory;
    .registers 5
    .param p0, "storedResults"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/experimental/max/CouldNotReadCoreException;
        }
    .end annotation

    .prologue
    .line 48
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_21

    .line 50
    .local v1, "file":Ljava/io/FileInputStream;
    :try_start_5
    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_1c

    .line 52
    .local v2, "stream":Ljava/io/ObjectInputStream;
    :try_start_a
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/junit/experimental/max/MaxHistory;
    :try_end_10
    .catchall {:try_start_a .. :try_end_10} :catchall_17

    .line 54
    :try_start_10
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_1c

    .line 57
    :try_start_13
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_16} :catch_21

    return-object v3

    .line 54
    :catchall_17
    move-exception v3

    :try_start_18
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V

    throw v3
    :try_end_1c
    .catchall {:try_start_18 .. :try_end_1c} :catchall_1c

    .line 57
    .end local v2    # "stream":Ljava/io/ObjectInputStream;
    :catchall_1c
    move-exception v3

    :try_start_1d
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    throw v3
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_21} :catch_21

    .line 59
    .end local v1    # "file":Ljava/io/FileInputStream;
    :catch_21
    move-exception v0

    .line 60
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/junit/experimental/max/CouldNotReadCoreException;

    invoke-direct {v3, v0}, Lorg/junit/experimental/max/CouldNotReadCoreException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private save()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    new-instance v0, Ljava/io/ObjectOutputStream;

    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lorg/junit/experimental/max/MaxHistory;->fHistoryStore:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 80
    .local v0, "stream":Ljava/io/ObjectOutputStream;
    invoke-virtual {v0, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 81
    invoke-virtual {v0}, Ljava/io/ObjectOutputStream;->close()V

    .line 82
    return-void
.end method


# virtual methods
.method getFailureTimestamp(Lorg/junit/runner/Description;)Ljava/lang/Long;
    .registers 4
    .param p1, "key"    # Lorg/junit/runner/Description;

    .prologue
    .line 85
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory;->fFailureTimestamps:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method getTestDuration(Lorg/junit/runner/Description;)Ljava/lang/Long;
    .registers 4
    .param p1, "key"    # Lorg/junit/runner/Description;

    .prologue
    .line 97
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory;->fDurations:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    return-object v0
.end method

.method isNewTest(Lorg/junit/runner/Description;)Z
    .registers 4
    .param p1, "key"    # Lorg/junit/runner/Description;

    .prologue
    .line 93
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory;->fDurations:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public listener()Lorg/junit/runner/notification/RunListener;
    .registers 3

    .prologue
    .line 163
    new-instance v0, Lorg/junit/experimental/max/MaxHistory$RememberingListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/junit/experimental/max/MaxHistory$RememberingListener;-><init>(Lorg/junit/experimental/max/MaxHistory;Lorg/junit/experimental/max/MaxHistory$1;)V

    return-object v0
.end method

.method putTestDuration(Lorg/junit/runner/Description;J)V
    .registers 7
    .param p1, "description"    # Lorg/junit/runner/Description;
    .param p2, "duration"    # J

    .prologue
    .line 101
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory;->fDurations:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    return-void
.end method

.method putTestFailureTimestamp(Lorg/junit/runner/Description;J)V
    .registers 7
    .param p1, "key"    # Lorg/junit/runner/Description;
    .param p2, "end"    # J

    .prologue
    .line 89
    iget-object v0, p0, Lorg/junit/experimental/max/MaxHistory;->fFailureTimestamps:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/junit/runner/Description;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    return-void
.end method

.method public testComparator()Ljava/util/Comparator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<",
            "Lorg/junit/runner/Description;",
            ">;"
        }
    .end annotation

    .prologue
    .line 171
    new-instance v0, Lorg/junit/experimental/max/MaxHistory$TestComparator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/junit/experimental/max/MaxHistory$TestComparator;-><init>(Lorg/junit/experimental/max/MaxHistory;Lorg/junit/experimental/max/MaxHistory$1;)V

    return-object v0
.end method
