.class public final Lde/robv/android/xposed/XSharedPreferences;
.super Ljava/lang/Object;
.source "XSharedPreferences.java"

# interfaces
.implements Landroid/content/SharedPreferences;


# static fields
.field private static final TAG:Ljava/lang/String; = "ReadOnlySharedPreferences"


# instance fields
.field private final mFile:Ljava/io/File;

.field private mFileSize:J

.field private mLastModified:J

.field private mLoaded:Z

.field private mMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "prefFile"    # Ljava/io/File;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/robv/android/xposed/XSharedPreferences;->mLoaded:Z

    .line 33
    iput-object p1, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    .line 34
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->startLoadFromDisk()V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "_preferences"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lde/robv/android/xposed/XSharedPreferences;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "prefFileName"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/robv/android/xposed/XSharedPreferences;->mLoaded:Z

    .line 42
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "data/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/shared_prefs/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    .line 43
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->startLoadFromDisk()V

    .line 44
    return-void
.end method

.method static synthetic access$0(Lde/robv/android/xposed/XSharedPreferences;)V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->loadFromDiskLocked()V

    return-void
.end method

.method private awaitLoadedLocked()V
    .registers 2

    .prologue
    .line 141
    :goto_0
    iget-boolean v0, p0, Lde/robv/android/xposed/XSharedPreferences;->mLoaded:Z

    if-eqz v0, :cond_5

    .line 147
    return-void

    .line 143
    :cond_5
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_8} :catch_9

    goto :goto_0

    .line 144
    :catch_9
    move-exception v0

    goto :goto_0
.end method

.method private loadFromDiskLocked()V
    .registers 12

    .prologue
    .line 76
    iget-boolean v9, p0, Lde/robv/android/xposed/XSharedPreferences;->mLoaded:Z

    if-eqz v9, :cond_5

    .line 116
    :goto_4
    return-void

    .line 80
    :cond_5
    const/4 v5, 0x0

    .line 81
    .local v5, "map":Ljava/util/Map;
    const-wide/16 v3, 0x0

    .line 82
    .local v3, "lastModified":J
    const-wide/16 v1, 0x0

    .line 83
    .local v1, "fileSize":J
    iget-object v9, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->canRead()Z

    move-result v9

    if-eqz v9, :cond_39

    .line 84
    iget-object v9, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    .line 85
    iget-object v9, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->length()J

    move-result-wide v1

    .line 86
    const/4 v7, 0x0

    .line 88
    .local v7, "str":Ljava/io/BufferedInputStream;
    :try_start_1f
    new-instance v8, Ljava/io/BufferedInputStream;

    .line 89
    new-instance v9, Ljava/io/FileInputStream;

    iget-object v10, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-direct {v9, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 v10, 0x4000

    .line 88
    invoke-direct {v8, v9, v10}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V
    :try_end_2d
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1f .. :try_end_2d} :catch_48
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_2d} :catch_58
    .catchall {:try_start_1f .. :try_end_2d} :catchall_68

    .line 90
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .local v8, "str":Ljava/io/BufferedInputStream;
    :try_start_2d
    invoke-static {v8}, Lcom/android/internal/util/XmlUtils;->readMapXml(Ljava/io/InputStream;)Ljava/util/HashMap;

    move-result-object v5

    .line 91
    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V
    :try_end_34
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2d .. :try_end_34} :catch_89
    .catch Ljava/io/IOException; {:try_start_2d .. :try_end_34} :catch_86
    .catchall {:try_start_2d .. :try_end_34} :catchall_83

    .line 97
    if-eqz v8, :cond_39

    .line 99
    :try_start_36
    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V
    :try_end_39
    .catch Ljava/lang/RuntimeException; {:try_start_36 .. :try_end_39} :catch_71
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_39} :catch_81

    .line 107
    .end local v8    # "str":Ljava/io/BufferedInputStream;
    :cond_39
    :goto_39
    const/4 v9, 0x1

    iput-boolean v9, p0, Lde/robv/android/xposed/XSharedPreferences;->mLoaded:Z

    .line 108
    if-eqz v5, :cond_73

    .line 109
    iput-object v5, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    .line 110
    iput-wide v3, p0, Lde/robv/android/xposed/XSharedPreferences;->mLastModified:J

    .line 111
    iput-wide v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mFileSize:J

    .line 115
    :goto_44
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    goto :goto_4

    .line 92
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    :catch_48
    move-exception v0

    .line 93
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    :goto_49
    :try_start_49
    const-string v9, "ReadOnlySharedPreferences"

    const-string v10, "getSharedPreferences"

    invoke-static {v9, v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_50
    .catchall {:try_start_49 .. :try_end_50} :catchall_68

    .line 97
    if-eqz v7, :cond_39

    .line 99
    :try_start_52
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V
    :try_end_55
    .catch Ljava/lang/RuntimeException; {:try_start_52 .. :try_end_55} :catch_56
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_55} :catch_7b

    goto :goto_39

    .line 100
    :catch_56
    move-exception v6

    .line 101
    .local v6, "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 94
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    :catch_58
    move-exception v0

    .line 95
    .local v0, "e":Ljava/io/IOException;
    :goto_59
    :try_start_59
    const-string v9, "ReadOnlySharedPreferences"

    const-string v10, "getSharedPreferences"

    invoke-static {v9, v10, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_60
    .catchall {:try_start_59 .. :try_end_60} :catchall_68

    .line 97
    if-eqz v7, :cond_39

    .line 99
    :try_start_62
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V
    :try_end_65
    .catch Ljava/lang/RuntimeException; {:try_start_62 .. :try_end_65} :catch_66
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_65} :catch_7d

    goto :goto_39

    .line 100
    :catch_66
    move-exception v6

    .line 101
    .restart local v6    # "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 96
    .end local v0    # "e":Ljava/io/IOException;
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    :catchall_68
    move-exception v9

    .line 97
    :goto_69
    if-eqz v7, :cond_6e

    .line 99
    :try_start_6b
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V
    :try_end_6e
    .catch Ljava/lang/RuntimeException; {:try_start_6b .. :try_end_6e} :catch_6f
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_6e} :catch_7f

    .line 105
    :cond_6e
    :goto_6e
    throw v9

    .line 100
    :catch_6f
    move-exception v6

    .line 101
    .restart local v6    # "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 100
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_71
    move-exception v6

    .line 101
    .restart local v6    # "rethrown":Ljava/lang/RuntimeException;
    throw v6

    .line 113
    .end local v6    # "rethrown":Ljava/lang/RuntimeException;
    .end local v8    # "str":Ljava/io/BufferedInputStream;
    :cond_73
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    iput-object v9, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    goto :goto_44

    .line 102
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    :catch_7b
    move-exception v9

    goto :goto_39

    .local v0, "e":Ljava/io/IOException;
    :catch_7d
    move-exception v9

    goto :goto_39

    .end local v0    # "e":Ljava/io/IOException;
    :catch_7f
    move-exception v10

    goto :goto_6e

    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_81
    move-exception v9

    goto :goto_39

    .line 96
    :catchall_83
    move-exception v9

    move-object v7, v8

    .end local v8    # "str":Ljava/io/BufferedInputStream;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    goto :goto_69

    .line 94
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_86
    move-exception v0

    move-object v7, v8

    .end local v8    # "str":Ljava/io/BufferedInputStream;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    goto :goto_59

    .line 92
    .end local v7    # "str":Ljava/io/BufferedInputStream;
    .restart local v8    # "str":Ljava/io/BufferedInputStream;
    :catch_89
    move-exception v0

    move-object v7, v8

    .end local v8    # "str":Ljava/io/BufferedInputStream;
    .restart local v7    # "str":Ljava/io/BufferedInputStream;
    goto :goto_49
.end method

.method private startLoadFromDisk()V
    .registers 3

    .prologue
    .line 61
    monitor-enter p0

    .line 62
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lde/robv/android/xposed/XSharedPreferences;->mLoaded:Z

    .line 61
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_2 .. :try_end_5} :catchall_10

    .line 64
    new-instance v0, Lde/robv/android/xposed/XSharedPreferences$1;

    const-string v1, "XSharedPreferences-load"

    invoke-direct {v0, p0, v1}, Lde/robv/android/xposed/XSharedPreferences$1;-><init>(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;)V

    .line 71
    invoke-virtual {v0}, Lde/robv/android/xposed/XSharedPreferences$1;->start()V

    .line 72
    return-void

    .line 61
    :catchall_10
    move-exception v0

    :try_start_11
    monitor-exit p0
    :try_end_12
    .catchall {:try_start_11 .. :try_end_12} :catchall_10

    throw v0
.end method


# virtual methods
.method public contains(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 214
    monitor-enter p0

    .line 215
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 216
    iget-object v0, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit p0

    return v0

    .line 214
    :catchall_c
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public edit()Landroid/content/SharedPreferences$Editor;
    .registers 3

    .prologue
    .line 222
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "read-only implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getAll()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 151
    monitor-enter p0

    .line 152
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 153
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    monitor-exit p0

    return-object v0

    .line 151
    :catchall_d
    move-exception v0

    monitor-exit p0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public getBoolean(Ljava/lang/String;Z)Z
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # Z

    .prologue
    .line 205
    monitor-enter p0

    .line 206
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 207
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 208
    .local v0, "v":Ljava/lang/Boolean;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    .end local p2    # "defValue":Z
    :cond_12
    monitor-exit p0

    return p2

    .line 205
    .end local v0    # "v":Ljava/lang/Boolean;
    :catchall_14
    move-exception v1

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    return-object v0
.end method

.method public getFloat(Ljava/lang/String;F)F
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # F

    .prologue
    .line 196
    monitor-enter p0

    .line 197
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 198
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    .line 199
    .local v0, "v":Ljava/lang/Float;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p2

    .end local p2    # "defValue":F
    :cond_12
    monitor-exit p0

    return p2

    .line 196
    .end local v0    # "v":Ljava/lang/Float;
    :catchall_14
    move-exception v1

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public getInt(Ljava/lang/String;I)I
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # I

    .prologue
    .line 178
    monitor-enter p0

    .line 179
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 180
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 181
    .local v0, "v":Ljava/lang/Integer;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    .end local p2    # "defValue":I
    :cond_12
    monitor-exit p0

    return p2

    .line 178
    .end local v0    # "v":Ljava/lang/Integer;
    :catchall_14
    move-exception v1

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public getLong(Ljava/lang/String;J)J
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # J

    .prologue
    .line 187
    monitor-enter p0

    .line 188
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 189
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 190
    .local v0, "v":Ljava/lang/Long;
    if-eqz v0, :cond_12

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    .end local p2    # "defValue":J
    :cond_12
    monitor-exit p0

    return-wide p2

    .line 187
    .end local v0    # "v":Ljava/lang/Long;
    :catchall_14
    move-exception v1

    monitor-exit p0
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_14

    throw v1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defValue"    # Ljava/lang/String;

    .prologue
    .line 159
    monitor-enter p0

    .line 160
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 161
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 162
    .local v0, "v":Ljava/lang/String;
    if-eqz v0, :cond_10

    .end local v0    # "v":Ljava/lang/String;
    :goto_e
    monitor-exit p0

    return-object v0

    .restart local v0    # "v":Ljava/lang/String;
    :cond_10
    move-object v0, p2

    goto :goto_e

    .line 159
    .end local v0    # "v":Ljava/lang/String;
    :catchall_12
    move-exception v1

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_12

    throw v1
.end method

.method public getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 169
    .local p2, "defValues":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    monitor-enter p0

    .line 170
    :try_start_1
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->awaitLoadedLocked()V

    .line 171
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    .line 172
    .local v0, "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v0, :cond_10

    .end local v0    # "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :goto_e
    monitor-exit p0

    return-object v0

    .restart local v0    # "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_10
    move-object v0, p2

    goto :goto_e

    .line 169
    .end local v0    # "v":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :catchall_12
    move-exception v1

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_12

    throw v1
.end method

.method public declared-synchronized hasFileChanged()Z
    .registers 8

    .prologue
    const/4 v4, 0x1

    .line 132
    monitor-enter p0

    :try_start_2
    iget-object v5, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->canRead()Z
    :try_end_7
    .catchall {:try_start_2 .. :try_end_7} :catchall_26

    move-result v5

    if-nez v5, :cond_c

    .line 137
    :cond_a
    :goto_a
    monitor-exit p0

    return v4

    .line 135
    :cond_c
    :try_start_c
    iget-object v5, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 136
    .local v2, "lastModified":J
    iget-object v5, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v0

    .line 137
    .local v0, "fileSize":J
    iget-wide v5, p0, Lde/robv/android/xposed/XSharedPreferences;->mLastModified:J

    cmp-long v5, v5, v2

    if-nez v5, :cond_a

    iget-wide v5, p0, Lde/robv/android/xposed/XSharedPreferences;->mFileSize:J
    :try_end_20
    .catchall {:try_start_c .. :try_end_20} :catchall_26

    cmp-long v5, v5, v0

    if-nez v5, :cond_a

    const/4 v4, 0x0

    goto :goto_a

    .line 132
    .end local v0    # "fileSize":J
    .end local v2    # "lastModified":J
    :catchall_26
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public makeWorldReadable()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 47
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_a

    .line 50
    :goto_9
    return v0

    :cond_a
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences;->mFile:Ljava/io/File;

    const/4 v2, 0x1

    invoke-virtual {v1, v2, v0}, Ljava/io/File;->setReadable(ZZ)Z

    move-result v0

    goto :goto_9
.end method

.method public registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    .registers 4
    .param p1, "listener"    # Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .prologue
    .line 227
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "listeners are not supported in this implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reload()V
    .registers 2

    .prologue
    .line 122
    monitor-enter p0

    .line 123
    :try_start_1
    invoke-virtual {p0}, Lde/robv/android/xposed/XSharedPreferences;->hasFileChanged()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 124
    invoke-direct {p0}, Lde/robv/android/xposed/XSharedPreferences;->startLoadFromDisk()V

    .line 122
    :cond_a
    monitor-exit p0

    .line 126
    return-void

    .line 122
    :catchall_c
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V
    .registers 4
    .param p1, "listener"    # Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .prologue
    .line 232
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "listeners are not supported in this implementation"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
