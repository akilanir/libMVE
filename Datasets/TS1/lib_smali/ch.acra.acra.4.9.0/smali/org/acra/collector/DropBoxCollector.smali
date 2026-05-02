.class final Lorg/acra/collector/DropBoxCollector;
.super Ljava/lang/Object;
.source "DropBoxCollector.java"


# static fields
.field private static final NO_RESULT:Ljava/lang/String; = "N/A"

.field private static final SYSTEM_TAGS:[Ljava/lang/String;


# instance fields
.field private final dateFormat:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 46
    const/16 v0, 0xf

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "system_app_anr"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "system_app_wtf"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "system_app_crash"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "system_server_anr"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "system_server_wtf"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "system_server_crash"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "BATTERY_DISCHARGE_INFO"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "SYSTEM_RECOVERY_LOG"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "SYSTEM_BOOT"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "SYSTEM_LAST_KMSG"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "APANIC_CONSOLE"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "APANIC_THREADS"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "SYSTEM_RESTART"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "SYSTEM_TOMBSTONE"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "data_app_strictmode"

    aput-object v2, v0, v1

    sput-object v0, Lorg/acra/collector/DropBoxCollector;->SYSTEM_TAGS:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .registers 4

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd\'T\'HHmmss"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    iput-object v0, p0, Lorg/acra/collector/DropBoxCollector;->dateFormat:Ljava/text/SimpleDateFormat;

    return-void
.end method


# virtual methods
.method public read(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Ljava/lang/String;
    .registers 21
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 65
    :try_start_0
    const-string v14, "dropbox"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/DropBoxManager;

    .line 67
    .local v3, "dropbox":Landroid/os/DropBoxManager;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    .line 68
    .local v2, "calendar":Ljava/util/Calendar;
    const/16 v14, 0xc

    invoke-virtual/range {p2 .. p2}, Lorg/acra/config/ACRAConfiguration;->dropboxCollectionMinutes()I

    move-result v15

    neg-int v15, v15

    invoke-virtual {v2, v14, v15}, Ljava/util/Calendar;->roll(II)V

    .line 69
    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v12

    .line 70
    .local v12, "time":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/acra/collector/DropBoxCollector;->dateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 72
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .local v10, "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual/range {p2 .. p2}, Lorg/acra/config/ACRAConfiguration;->includeDropBoxSystemTags()Z

    move-result v14

    if-eqz v14, :cond_3b

    .line 74
    sget-object v14, Lorg/acra/collector/DropBoxCollector;->SYSTEM_TAGS:[Ljava/lang/String;

    invoke-static {v14}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    invoke-interface {v10, v14}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 76
    :cond_3b
    invoke-virtual/range {p2 .. p2}, Lorg/acra/config/ACRAConfiguration;->additionalDropBoxTags()Lorg/acra/collections/ImmutableSet;

    move-result-object v1

    .line 77
    .local v1, "additionalTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_48

    .line 78
    invoke-interface {v10, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 81
    :cond_48
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_51

    .line 82
    const-string v14, "No tag configured for collection."

    .line 113
    .end local v1    # "additionalTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "calendar":Ljava/util/Calendar;
    .end local v3    # "dropbox":Landroid/os/DropBoxManager;
    .end local v10    # "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v12    # "time":J
    :goto_50
    return-object v14

    .line 85
    .restart local v1    # "additionalTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v2    # "calendar":Ljava/util/Calendar;
    .restart local v3    # "dropbox":Landroid/os/DropBoxManager;
    .restart local v10    # "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v12    # "time":J
    :cond_51
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .local v4, "dropboxContent":Ljava/lang/StringBuilder;
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_5a
    :goto_5a
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_e9

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 87
    .local v9, "tag":Ljava/lang/String;
    const-string v15, "Tag: "

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0xa

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    invoke-virtual {v3, v9, v12, v13}, Landroid/os/DropBoxManager;->getNextEntry(Ljava/lang/String;J)Landroid/os/DropBoxManager$Entry;

    move-result-object v6

    .line 89
    .local v6, "entry":Landroid/os/DropBoxManager$Entry;
    if-nez v6, :cond_98

    .line 90
    const-string v15, "Nothing."

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0xa

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_86} :catch_87

    goto :goto_5a

    .line 109
    .end local v1    # "additionalTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "calendar":Ljava/util/Calendar;
    .end local v3    # "dropbox":Landroid/os/DropBoxManager;
    .end local v4    # "dropboxContent":Ljava/lang/StringBuilder;
    .end local v6    # "entry":Landroid/os/DropBoxManager$Entry;
    .end local v9    # "tag":Ljava/lang/String;
    .end local v10    # "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v12    # "time":J
    :catch_87
    move-exception v5

    .line 110
    .local v5, "e":Ljava/lang/Exception;
    sget-boolean v14, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v14, :cond_95

    sget-object v14, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v15, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v16, "DropBoxManager not available."

    invoke-interface/range {v14 .. v16}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    :cond_95
    const-string v14, "N/A"

    goto :goto_50

    .line 93
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v1    # "additionalTags":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .restart local v2    # "calendar":Ljava/util/Calendar;
    .restart local v3    # "dropbox":Landroid/os/DropBoxManager;
    .restart local v4    # "dropboxContent":Ljava/lang/StringBuilder;
    .restart local v6    # "entry":Landroid/os/DropBoxManager$Entry;
    .restart local v9    # "tag":Ljava/lang/String;
    .restart local v10    # "tags":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v12    # "time":J
    :cond_98
    :goto_98
    if-eqz v6, :cond_5a

    .line 94
    :try_start_9a
    invoke-virtual {v6}, Landroid/os/DropBoxManager$Entry;->getTimeMillis()J

    move-result-wide v7

    .line 95
    .local v7, "msec":J
    invoke-virtual {v2, v7, v8}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 96
    const/16 v15, 0x40

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/acra/collector/DropBoxCollector;->dateFormat:Ljava/text/SimpleDateFormat;

    move-object/from16 v16, v0

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0xa

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 97
    const/16 v15, 0x1f4

    invoke-virtual {v6, v15}, Landroid/os/DropBoxManager$Entry;->getText(I)Ljava/lang/String;

    move-result-object v11

    .line 98
    .local v11, "text":Ljava/lang/String;
    if-eqz v11, :cond_dd

    .line 99
    const-string v15, "Text: "

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0xa

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 103
    :goto_d5
    invoke-virtual {v6}, Landroid/os/DropBoxManager$Entry;->close()V

    .line 104
    invoke-virtual {v3, v9, v7, v8}, Landroid/os/DropBoxManager;->getNextEntry(Ljava/lang/String;J)Landroid/os/DropBoxManager$Entry;

    move-result-object v6

    .line 105
    goto :goto_98

    .line 101
    :cond_dd
    const-string v15, "Not Text!"

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const/16 v16, 0xa

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_d5

    .line 107
    .end local v6    # "entry":Landroid/os/DropBoxManager$Entry;
    .end local v7    # "msec":J
    .end local v9    # "tag":Ljava/lang/String;
    .end local v11    # "text":Ljava/lang/String;
    :cond_e9
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_ec
    .catch Ljava/lang/Exception; {:try_start_9a .. :try_end_ec} :catch_87

    move-result-object v14

    goto/16 :goto_50
.end method
