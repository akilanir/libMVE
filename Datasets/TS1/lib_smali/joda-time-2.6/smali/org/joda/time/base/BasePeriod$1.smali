.class Lorg/joda/time/base/BasePeriod$1;
.super Lorg/joda/time/base/AbstractPeriod;
.source "BasePeriod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/base/BasePeriod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/joda/time/base/AbstractPeriod;-><init>()V

    return-void
.end method


# virtual methods
.method public getPeriodType()Lorg/joda/time/PeriodType;
    .registers 2

    .prologue
    .line 62
    invoke-static {}, Lorg/joda/time/PeriodType;->time()Lorg/joda/time/PeriodType;

    move-result-object v0

    return-object v0
.end method

.method public getValue(I)I
    .registers 3

    .prologue
    .line 59
    const/4 v0, 0x0

    return v0
.end method
