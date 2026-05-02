.class public Lorg/piwik/sdk/dispatcher/Packet;
.super Ljava/lang/Object;
.source "Packet.java"


# instance fields
.field private final mJSONObject:Lorg/json/JSONObject;

.field private final mTargetURL:Ljava/net/URL;

.field private final mTimeStamp:J


# direct methods
.method public constructor <init>(Ljava/net/URL;)V
    .registers 3
    .param p1, "targetURL"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/piwik/sdk/dispatcher/Packet;-><init>(Ljava/net/URL;Lorg/json/JSONObject;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lorg/json/JSONObject;)V
    .registers 5
    .param p1, "targetURL"    # Ljava/net/URL;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "JSONObject"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/piwik/sdk/dispatcher/Packet;->mTargetURL:Ljava/net/URL;

    .line 38
    iput-object p2, p0, Lorg/piwik/sdk/dispatcher/Packet;->mJSONObject:Lorg/json/JSONObject;

    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/piwik/sdk/dispatcher/Packet;->mTimeStamp:J

    .line 40
    return-void
.end method


# virtual methods
.method public getJSONObject()Lorg/json/JSONObject;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .line 52
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Packet;->mJSONObject:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getTargetURL()Ljava/net/URL;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .line 44
    iget-object v0, p0, Lorg/piwik/sdk/dispatcher/Packet;->mTargetURL:Ljava/net/URL;

    return-object v0
.end method

.method public getTimeStamp()J
    .registers 3

    .line 59
    iget-wide v0, p0, Lorg/piwik/sdk/dispatcher/Packet;->mTimeStamp:J

    return-wide v0
.end method
