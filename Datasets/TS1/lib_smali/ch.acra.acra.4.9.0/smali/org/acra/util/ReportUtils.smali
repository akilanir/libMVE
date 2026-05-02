.class public final Lorg/acra/util/ReportUtils;
.super Ljava/lang/Object;
.source "ReportUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApplicationFilePath(Landroid/content/Context;)Ljava/lang/String;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    .line 100
    .local v0, "filesDir":Ljava/io/File;
    if-eqz v0, :cond_b

    .line 101
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 105
    :goto_a
    return-object v1

    .line 104
    :cond_b
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Couldn\'t retrieve ApplicationFilePath for : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    const-string v1, "Couldn\'t retrieve ApplicationFilePath"

    goto :goto_a
.end method

.method public static getAvailableInternalMemorySize()J
    .registers 8

    .prologue
    .line 40
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v4

    .line 41
    .local v4, "path":Ljava/io/File;
    new-instance v5, Landroid/os/StatFs;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 44
    .local v5, "stat":Landroid/os/StatFs;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x12

    if-lt v6, v7, :cond_1e

    .line 45
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v2

    .line 46
    .local v2, "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v0

    .line 53
    .local v0, "availableBlocks":J
    :goto_1b
    mul-long v6, v0, v2

    return-wide v6

    .line 49
    .end local v0    # "availableBlocks":J
    .end local v2    # "blockSize":J
    :cond_1e
    invoke-virtual {v5}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v2, v6

    .line 51
    .restart local v2    # "blockSize":J
    invoke-virtual {v5}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    int-to-long v0, v6

    .restart local v0    # "availableBlocks":J
    goto :goto_1b
.end method

.method public static getDeviceId(Landroid/content/Context;)Ljava/lang/String;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 89
    :try_start_0
    const-string v2, "phone"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/TelephonyManager;

    .line 90
    .local v1, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getDeviceId()Ljava/lang/String;
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v2

    .line 93
    .end local v1    # "tm":Landroid/telephony/TelephonyManager;
    :goto_c
    return-object v2

    .line 91
    :catch_d
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Couldn\'t retrieve DeviceId for : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 93
    const/4 v2, 0x0

    goto :goto_c
.end method

.method public static getLocalIpAddress()Ljava/lang/String;
    .registers 10
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 110
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .local v6, "result":Ljava/lang/StringBuilder;
    const/4 v3, 0x1

    .line 113
    .local v3, "first":Z
    :try_start_6
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_a
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_48

    .line 114
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/NetworkInterface;

    .line 115
    .local v5, "intf":Ljava/net/NetworkInterface;
    invoke-virtual {v5}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    :cond_1a
    :goto_1a
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_a

    .line 116
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/net/InetAddress;

    .line 117
    .local v4, "inetAddress":Ljava/net/InetAddress;
    invoke-virtual {v4}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v7

    if-nez v7, :cond_1a

    .line 118
    if-nez v3, :cond_33

    .line 119
    const/16 v7, 0xa

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 121
    :cond_33
    invoke-virtual {v4}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3a
    .catch Ljava/net/SocketException; {:try_start_6 .. :try_end_3a} :catch_3c

    .line 122
    const/4 v3, 0x0

    goto :goto_1a

    .line 126
    .end local v0    # "en":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .end local v1    # "enumIpAddr":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/InetAddress;>;"
    .end local v4    # "inetAddress":Ljava/net/InetAddress;
    .end local v5    # "intf":Ljava/net/NetworkInterface;
    :catch_3c
    move-exception v2

    .line 127
    .local v2, "ex":Ljava/net/SocketException;
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/net/SocketException;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    .end local v2    # "ex":Ljava/net/SocketException;
    :cond_48
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public static getTimeString(Ljava/util/Calendar;)Ljava/lang/String;
    .registers 4
    .param p0, "time"    # Ljava/util/Calendar;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 134
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSSZZZZZ"

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 135
    .local v0, "format":Ljava/text/SimpleDateFormat;
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getTotalInternalMemorySize()J
    .registers 8

    .prologue
    .line 63
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v2

    .line 64
    .local v2, "path":Ljava/io/File;
    new-instance v3, Landroid/os/StatFs;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 67
    .local v3, "stat":Landroid/os/StatFs;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x12

    if-lt v6, v7, :cond_1e

    .line 68
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v0

    .line 69
    .local v0, "blockSize":J
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockCountLong()J

    move-result-wide v4

    .line 77
    .local v4, "totalBlocks":J
    :goto_1b
    mul-long v6, v4, v0

    return-wide v6

    .line 73
    .end local v0    # "blockSize":J
    .end local v4    # "totalBlocks":J
    :cond_1e
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockSize()I

    move-result v6

    int-to-long v0, v6

    .line 75
    .restart local v0    # "blockSize":J
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockCount()I

    move-result v6

    int-to-long v4, v6

    .restart local v4    # "totalBlocks":J
    goto :goto_1b
.end method
