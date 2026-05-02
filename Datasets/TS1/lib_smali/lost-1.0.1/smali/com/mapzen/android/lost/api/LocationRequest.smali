.class public final Lcom/mapzen/android/lost/api/LocationRequest;
.super Ljava/lang/Object;
.source "LocationRequest.java"


# static fields
.field static final DEFAULT_FASTEST_INTERVAL_IN_MS:J = 0x927c0L

.field static final DEFAULT_INTERVAL_IN_MS:J = 0x36ee80L

.field static final DEFAULT_SMALLEST_DISPLACEMENT_IN_METERS:F = 0.0f

.field public static final PRIORITY_BALANCED_POWER_ACCURACY:I = 0x66

.field public static final PRIORITY_HIGH_ACCURACY:I = 0x64

.field public static final PRIORITY_LOW_POWER:I = 0x68

.field public static final PRIORITY_NO_POWER:I = 0x69


# instance fields
.field private fastestInterval:J

.field private interval:J

.field private priority:I

.field private smallestDisplacement:F


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    const-wide/32 v0, 0x36ee80

    iput-wide v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->interval:J

    .line 14
    const-wide/32 v0, 0x927c0

    iput-wide v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->fastestInterval:J

    .line 15
    const/4 v0, 0x0

    iput v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->smallestDisplacement:F

    .line 16
    const/16 v0, 0x66

    iput v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->priority:I

    .line 19
    return-void
.end method

.method public static create()Lcom/mapzen/android/lost/api/LocationRequest;
    .registers 1

    .prologue
    .line 22
    new-instance v0, Lcom/mapzen/android/lost/api/LocationRequest;

    invoke-direct {v0}, Lcom/mapzen/android/lost/api/LocationRequest;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getFastestInterval()J
    .registers 3

    .prologue
    .line 40
    iget-wide v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->fastestInterval:J

    return-wide v0
.end method

.method public getInterval()J
    .registers 3

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->interval:J

    return-wide v0
.end method

.method public getPriority()I
    .registers 2

    .prologue
    .line 58
    iget v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->priority:I

    return v0
.end method

.method public getSmallestDisplacement()F
    .registers 2

    .prologue
    .line 49
    iget v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->smallestDisplacement:F

    return v0
.end method

.method public setFastestInterval(J)Lcom/mapzen/android/lost/api/LocationRequest;
    .registers 3
    .param p1, "millis"    # J

    .prologue
    .line 44
    iput-wide p1, p0, Lcom/mapzen/android/lost/api/LocationRequest;->fastestInterval:J

    .line 45
    return-object p0
.end method

.method public setInterval(J)Lcom/mapzen/android/lost/api/LocationRequest;
    .registers 7
    .param p1, "millis"    # J

    .prologue
    .line 30
    iput-wide p1, p0, Lcom/mapzen/android/lost/api/LocationRequest;->interval:J

    .line 32
    iget-wide v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->interval:J

    iget-wide v2, p0, Lcom/mapzen/android/lost/api/LocationRequest;->fastestInterval:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_e

    .line 33
    iget-wide v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->interval:J

    iput-wide v0, p0, Lcom/mapzen/android/lost/api/LocationRequest;->fastestInterval:J

    .line 36
    :cond_e
    return-object p0
.end method

.method public setPriority(I)Lcom/mapzen/android/lost/api/LocationRequest;
    .registers 5
    .param p1, "priority"    # I

    .prologue
    .line 62
    const/16 v0, 0x64

    if-eq p1, v0, :cond_29

    const/16 v0, 0x66

    if-eq p1, v0, :cond_29

    const/16 v0, 0x68

    if-eq p1, v0, :cond_29

    const/16 v0, 0x69

    if-eq p1, v0, :cond_29

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid priority: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_29
    iput p1, p0, Lcom/mapzen/android/lost/api/LocationRequest;->priority:I

    .line 68
    return-object p0
.end method

.method public setSmallestDisplacement(F)Lcom/mapzen/android/lost/api/LocationRequest;
    .registers 2
    .param p1, "meters"    # F

    .prologue
    .line 53
    iput p1, p0, Lcom/mapzen/android/lost/api/LocationRequest;->smallestDisplacement:F

    .line 54
    return-object p0
.end method
