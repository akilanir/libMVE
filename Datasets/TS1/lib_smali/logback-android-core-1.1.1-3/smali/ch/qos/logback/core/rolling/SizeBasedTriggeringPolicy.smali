.class public Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;
.super Lch/qos/logback/core/rolling/TriggeringPolicyBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/rolling/TriggeringPolicyBase",
        "<TE;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT_MAX_FILE_SIZE:J = 0xa00000L

.field public static final SEE_SIZE_FORMAT:Ljava/lang/String; = "http://logback.qos.ch/codes.html#sbtp_size_format"


# instance fields
.field private invocationGate:Lch/qos/logback/core/util/InvocationGate;

.field maxFileSize:Lch/qos/logback/core/util/FileSize;

.field maxFileSizeAsString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lch/qos/logback/core/rolling/TriggeringPolicyBase;-><init>()V

    const-wide/32 v0, 0xa00000

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->maxFileSizeAsString:Ljava/lang/String;

    new-instance v0, Lch/qos/logback/core/util/InvocationGate;

    invoke-direct {v0}, Lch/qos/logback/core/util/InvocationGate;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->invocationGate:Lch/qos/logback/core/util/InvocationGate;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Lch/qos/logback/core/rolling/TriggeringPolicyBase;-><init>()V

    const-wide/32 v0, 0xa00000

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->maxFileSizeAsString:Ljava/lang/String;

    new-instance v0, Lch/qos/logback/core/util/InvocationGate;

    invoke-direct {v0}, Lch/qos/logback/core/util/InvocationGate;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->invocationGate:Lch/qos/logback/core/util/InvocationGate;

    invoke-virtual {p0, p1}, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->setMaxFileSize(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getMaxFileSize()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->maxFileSizeAsString:Ljava/lang/String;

    return-object v0
.end method

.method public isTriggeringEvent(Ljava/io/File;Ljava/lang/Object;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "TE;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    iget-object v1, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->invocationGate:Lch/qos/logback/core/util/InvocationGate;

    invoke-virtual {v1}, Lch/qos/logback/core/util/InvocationGate;->skipFurtherWork()Z

    move-result v1

    if-eqz v1, :cond_a

    :cond_9
    :goto_9
    return v0

    :cond_a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->invocationGate:Lch/qos/logback/core/util/InvocationGate;

    invoke-virtual {v3, v1, v2}, Lch/qos/logback/core/util/InvocationGate;->updateMaskIfNecessary(J)V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    iget-object v3, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->maxFileSize:Lch/qos/logback/core/util/FileSize;

    invoke-virtual {v3}, Lch/qos/logback/core/util/FileSize;->getSize()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-ltz v1, :cond_9

    const/4 v0, 0x1

    goto :goto_9
.end method

.method public setMaxFileSize(Ljava/lang/String;)V
    .registers 3

    iput-object p1, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->maxFileSizeAsString:Ljava/lang/String;

    invoke-static {p1}, Lch/qos/logback/core/util/FileSize;->valueOf(Ljava/lang/String;)Lch/qos/logback/core/util/FileSize;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->maxFileSize:Lch/qos/logback/core/util/FileSize;

    return-void
.end method

.method toFileSize(Ljava/lang/String;)J
    .registers 10

    const-wide/32 v0, 0xa00000

    const/4 v7, 0x0

    const/4 v6, -0x1

    if-nez p1, :cond_8

    :cond_7
    :goto_7
    return-wide v0

    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    const-wide/16 v2, 0x1

    const-string v5, "KB"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-eq v5, v6, :cond_2c

    const-wide/16 v2, 0x400

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    :cond_20
    :goto_20
    if-eqz v4, :cond_7

    :try_start_22
    invoke-static {v4}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J
    :try_end_29
    .catch Ljava/lang/NumberFormatException; {:try_start_22 .. :try_end_29} :catch_4c

    move-result-wide v0

    mul-long/2addr v0, v2

    goto :goto_7

    :cond_2c
    const-string v5, "MB"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-eq v5, v6, :cond_3c

    const-wide/32 v2, 0x100000

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_20

    :cond_3c
    const-string v5, "GB"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-eq v5, v6, :cond_20

    const-wide/32 v2, 0x40000000

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_20

    :catch_4c
    move-exception v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] is not in proper int format. Please refer to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "http://logback.qos.ch/codes.html#sbtp_size_format"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->addError(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] not in expected format."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lch/qos/logback/core/rolling/SizeBasedTriggeringPolicy;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_7
.end method
