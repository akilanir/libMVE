.class public Lorg/piwik/sdk/plugins/CustomDimensions;
.super Lorg/piwik/sdk/TrackMe;
.source "CustomDimensions.java"


# static fields
.field protected static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:CustomDimensions"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Lorg/piwik/sdk/TrackMe;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized set(ILjava/lang/String;)Lorg/piwik/sdk/plugins/CustomDimensions;
    .registers 6
    .param p1, "dimensionId"    # I
    .param p2, "dimensionValue"    # Ljava/lang/String;

    monitor-enter p0

    .line 23
    const/4 v0, 0x1

    if-ge p1, v0, :cond_f

    .line 24
    :try_start_4
    const-string v0, "PIWIK:CustomDimensions"

    const-string v1, "dimensionId should be great than 0"

    invoke-static {v0, v1}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_b
    .catchall {:try_start_4 .. :try_end_b} :catchall_d

    .line 25
    monitor-exit p0

    return-object p0

    .line 22
    .end local p1    # "dimensionId":I
    .end local p2    # "dimensionValue":Ljava/lang/String;
    :catchall_d
    move-exception p1

    goto :goto_3c

    .line 27
    .restart local p1    # "dimensionId":I
    .restart local p2    # "dimensionValue":Ljava/lang/String;
    :cond_f
    if-eqz p2, :cond_26

    :try_start_11
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xff

    if-le v0, v1, :cond_26

    .line 28
    const-string v0, "PIWIK:CustomDimensions"

    const-string v2, "dimensionValue will be truncated to 255 chars"

    invoke-static {v0, v2}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    const/4 v0, 0x0

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    move-object p2, v0

    .line 31
    :cond_26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "dimension"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lorg/piwik/sdk/plugins/CustomDimensions;->set(Ljava/lang/String;Ljava/lang/String;)Lorg/piwik/sdk/TrackMe;
    :try_end_3a
    .catchall {:try_start_11 .. :try_end_3a} :catchall_d

    .line 32
    monitor-exit p0

    return-object p0

    .line 22
    .end local p1    # "dimensionId":I
    .end local p2    # "dimensionValue":Ljava/lang/String;
    :goto_3c
    monitor-exit p0

    throw p1
.end method
