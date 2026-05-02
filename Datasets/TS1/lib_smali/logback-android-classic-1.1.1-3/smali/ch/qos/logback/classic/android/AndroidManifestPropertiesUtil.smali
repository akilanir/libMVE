.class public Lch/qos/logback/classic/android/AndroidManifestPropertiesUtil;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setAndroidProperties(Lch/qos/logback/core/Context;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/joran/spi/JoranException;
        }
    .end annotation

    new-instance v0, Lch/qos/logback/classic/android/ASaxEventRecorder;

    invoke-direct {v0}, Lch/qos/logback/classic/android/ASaxEventRecorder;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "-"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->setFilter([Ljava/lang/String;)V

    const-string v1, "manifest"

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/android/ASaxEventRecorder;->setAttributeWatch(Ljava/lang/String;)V

    invoke-interface {p0}, Lch/qos/logback/core/Context;->getStatusManager()Lch/qos/logback/core/status/StatusManager;

    move-result-object v1

    invoke-static {p0}, Lch/qos/logback/core/util/Loader;->getClassLoaderOfObject(Ljava/lang/Object;)Ljava/lang/ClassLoader;

    move-result-object v2

    const-string v3, "AndroidManifest.xml"

    invoke-virtual {v2, v3}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    if-nez v2, :cond_30

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    const-string v2, "Could not find AndroidManifest.xml"

    invoke-direct {v0, v2, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v1, v0}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    :goto_2f
    return-void

    :cond_30
    :try_start_30
    invoke-virtual {v0, v2}, Lch/qos/logback/classic/android/ASaxEventRecorder;->recordEvents(Ljava/io/InputStream;)V
    :try_end_33
    .catchall {:try_start_30 .. :try_end_33} :catchall_6b

    :try_start_33
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_36} :catch_bf

    :goto_36
    const-string v2, "EXT_DIR"

    invoke-static {}, Lch/qos/logback/core/android/CommonPathUtil;->getMountedExternalStorageDirectoryPath()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lch/qos/logback/classic/android/ASaxEventRecorder;->getAttributeWatchValues()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_4b
    :goto_4b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_98

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v4, "android:versionName"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_70

    const-string v4, "VERSION_NAME"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p0, v4, v0}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4b

    :catchall_6b
    move-exception v0

    :try_start_6c
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_6c .. :try_end_6f} :catch_c2

    :goto_6f
    throw v0

    :cond_70
    const-string v4, "android:versionCode"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_84

    const-string v4, "VERSION_CODE"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p0, v4, v0}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4b

    :cond_84
    const-string v4, "package"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4b

    const-string v4, "PACKAGE_NAME"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p0, v4, v0}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4b

    :cond_98
    const-string v0, "package"

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_b3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_b3

    const-string v1, "DATA_DIR"

    invoke-static {v0}, Lch/qos/logback/core/android/CommonPathUtil;->getFilesDirectoryPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0, v1, v0}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2f

    :cond_b3
    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    const-string v2, "Package name not found. Some properties cannot be set."

    invoke-direct {v0, v2, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v1, v0}, Lch/qos/logback/core/status/StatusManager;->add(Lch/qos/logback/core/status/Status;)V

    goto/16 :goto_2f

    :catch_bf
    move-exception v2

    goto/16 :goto_36

    :catch_c2
    move-exception v1

    goto :goto_6f
.end method
