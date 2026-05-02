.class Lorg/acra/builder/ReportExecutor$TimeHelper;
.super Ljava/lang/Object;
.source "ReportExecutor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/acra/builder/ReportExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimeHelper"
.end annotation


# instance fields
.field private initialTimeMillis:Ljava/lang/Long;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/acra/builder/ReportExecutor$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/acra/builder/ReportExecutor$1;

    .prologue
    .line 76
    invoke-direct {p0}, Lorg/acra/builder/ReportExecutor$TimeHelper;-><init>()V

    return-void
.end method

.method static synthetic access$300(Lorg/acra/builder/ReportExecutor$TimeHelper;)Ljava/lang/Long;
    .registers 2
    .param p0, "x0"    # Lorg/acra/builder/ReportExecutor$TimeHelper;

    .prologue
    .line 76
    iget-object v0, p0, Lorg/acra/builder/ReportExecutor$TimeHelper;->initialTimeMillis:Ljava/lang/Long;

    return-object v0
.end method


# virtual methods
.method public getElapsedTime()J
    .registers 5

    .prologue
    .line 88
    iget-object v0, p0, Lorg/acra/builder/ReportExecutor$TimeHelper;->initialTimeMillis:Ljava/lang/Long;

    if-nez v0, :cond_7

    const-wide/16 v0, 0x0

    :goto_6
    return-wide v0

    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lorg/acra/builder/ReportExecutor$TimeHelper;->initialTimeMillis:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    sub-long/2addr v0, v2

    goto :goto_6
.end method

.method public setInitialTimeMillis(J)V
    .registers 4
    .param p1, "initialTimeMillis"    # J

    .prologue
    .line 81
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lorg/acra/builder/ReportExecutor$TimeHelper;->initialTimeMillis:Ljava/lang/Long;

    .line 82
    return-void
.end method
