.class public Lch/qos/logback/core/recovery/RecoveryCoordinator;
.super Ljava/lang/Object;


# static fields
.field static BACKOFF_COEFFICIENT_MAX:J = 0x0L

.field public static final BACKOFF_COEFFICIENT_MIN:J = 0x14L

.field private static UNSET:J


# instance fields
.field private backOffCoefficient:J

.field private currentTime:J

.field next:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-wide/32 v0, 0x50000

    sput-wide v0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->BACKOFF_COEFFICIENT_MAX:J

    const-wide/16 v0, -0x1

    sput-wide v0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->UNSET:J

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x14

    iput-wide v0, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->backOffCoefficient:J

    sget-wide v0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->UNSET:J

    iput-wide v0, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->currentTime:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0}, Lch/qos/logback/core/recovery/RecoveryCoordinator;->getBackoffCoefficient()J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->next:J

    return-void
.end method

.method private getBackoffCoefficient()J
    .registers 7

    iget-wide v0, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->backOffCoefficient:J

    iget-wide v2, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->backOffCoefficient:J

    sget-wide v4, Lch/qos/logback/core/recovery/RecoveryCoordinator;->BACKOFF_COEFFICIENT_MAX:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_11

    iget-wide v2, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->backOffCoefficient:J

    const-wide/16 v4, 0x4

    mul-long/2addr v2, v4

    iput-wide v2, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->backOffCoefficient:J

    :cond_11
    return-wide v0
.end method

.method private getCurrentTime()J
    .registers 5

    iget-wide v0, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->currentTime:J

    sget-wide v2, Lch/qos/logback/core/recovery/RecoveryCoordinator;->UNSET:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_b

    iget-wide v0, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->currentTime:J

    :goto_a
    return-wide v0

    :cond_b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    goto :goto_a
.end method


# virtual methods
.method public isTooSoon()Z
    .registers 5

    invoke-direct {p0}, Lch/qos/logback/core/recovery/RecoveryCoordinator;->getCurrentTime()J

    move-result-wide v0

    iget-wide v2, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->next:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_13

    invoke-direct {p0}, Lch/qos/logback/core/recovery/RecoveryCoordinator;->getBackoffCoefficient()J

    move-result-wide v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->next:J

    const/4 v0, 0x0

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x1

    goto :goto_12
.end method

.method setCurrentTime(J)V
    .registers 3

    iput-wide p1, p0, Lch/qos/logback/core/recovery/RecoveryCoordinator;->currentTime:J

    return-void
.end method
