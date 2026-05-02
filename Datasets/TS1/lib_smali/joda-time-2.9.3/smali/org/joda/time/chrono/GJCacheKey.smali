.class Lorg/joda/time/chrono/GJCacheKey;
.super Ljava/lang/Object;
.source "GJCacheKey.java"


# instance fields
.field private final cutoverInstant:Lorg/joda/time/Instant;

.field private final minDaysInFirstWeek:I

.field private final zone:Lorg/joda/time/DateTimeZone;


# direct methods
.method constructor <init>(Lorg/joda/time/DateTimeZone;Lorg/joda/time/Instant;I)V
    .registers 4

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/joda/time/chrono/GJCacheKey;->zone:Lorg/joda/time/DateTimeZone;

    .line 31
    iput-object p2, p0, Lorg/joda/time/chrono/GJCacheKey;->cutoverInstant:Lorg/joda/time/Instant;

    .line 32
    iput p3, p0, Lorg/joda/time/chrono/GJCacheKey;->minDaysInFirstWeek:I

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 47
    if-ne p0, p1, :cond_5

    .line 74
    :cond_4
    :goto_4
    return v0

    .line 50
    :cond_5
    if-nez p1, :cond_9

    move v0, v1

    .line 51
    goto :goto_4

    .line 53
    :cond_9
    instance-of v2, p1, Lorg/joda/time/chrono/GJCacheKey;

    if-nez v2, :cond_f

    move v0, v1

    .line 54
    goto :goto_4

    .line 56
    :cond_f
    check-cast p1, Lorg/joda/time/chrono/GJCacheKey;

    .line 57
    iget-object v2, p0, Lorg/joda/time/chrono/GJCacheKey;->cutoverInstant:Lorg/joda/time/Instant;

    if-nez v2, :cond_1b

    .line 58
    iget-object v2, p1, Lorg/joda/time/chrono/GJCacheKey;->cutoverInstant:Lorg/joda/time/Instant;

    if-eqz v2, :cond_27

    move v0, v1

    .line 59
    goto :goto_4

    .line 61
    :cond_1b
    iget-object v2, p0, Lorg/joda/time/chrono/GJCacheKey;->cutoverInstant:Lorg/joda/time/Instant;

    iget-object v3, p1, Lorg/joda/time/chrono/GJCacheKey;->cutoverInstant:Lorg/joda/time/Instant;

    invoke-virtual {v2, v3}, Lorg/joda/time/Instant;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_27

    move v0, v1

    .line 62
    goto :goto_4

    .line 64
    :cond_27
    iget v2, p0, Lorg/joda/time/chrono/GJCacheKey;->minDaysInFirstWeek:I

    iget v3, p1, Lorg/joda/time/chrono/GJCacheKey;->minDaysInFirstWeek:I

    if-eq v2, v3, :cond_2f

    move v0, v1

    .line 65
    goto :goto_4

    .line 67
    :cond_2f
    iget-object v2, p0, Lorg/joda/time/chrono/GJCacheKey;->zone:Lorg/joda/time/DateTimeZone;

    if-nez v2, :cond_39

    .line 68
    iget-object v2, p1, Lorg/joda/time/chrono/GJCacheKey;->zone:Lorg/joda/time/DateTimeZone;

    if-eqz v2, :cond_4

    move v0, v1

    .line 69
    goto :goto_4

    .line 71
    :cond_39
    iget-object v2, p0, Lorg/joda/time/chrono/GJCacheKey;->zone:Lorg/joda/time/DateTimeZone;

    iget-object v3, p1, Lorg/joda/time/chrono/GJCacheKey;->zone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v2, v3}, Lorg/joda/time/DateTimeZone;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    move v0, v1

    .line 72
    goto :goto_4
.end method

.method public hashCode()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 38
    .line 39
    iget-object v0, p0, Lorg/joda/time/chrono/GJCacheKey;->cutoverInstant:Lorg/joda/time/Instant;

    if-nez v0, :cond_15

    move v0, v1

    :goto_6
    add-int/lit8 v0, v0, 0x1f

    .line 40
    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lorg/joda/time/chrono/GJCacheKey;->minDaysInFirstWeek:I

    add-int/2addr v0, v2

    .line 41
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lorg/joda/time/chrono/GJCacheKey;->zone:Lorg/joda/time/DateTimeZone;

    if-nez v2, :cond_1c

    :goto_13
    add-int/2addr v0, v1

    .line 42
    return v0

    .line 39
    :cond_15
    iget-object v0, p0, Lorg/joda/time/chrono/GJCacheKey;->cutoverInstant:Lorg/joda/time/Instant;

    invoke-virtual {v0}, Lorg/joda/time/Instant;->hashCode()I

    move-result v0

    goto :goto_6

    .line 41
    :cond_1c
    iget-object v1, p0, Lorg/joda/time/chrono/GJCacheKey;->zone:Lorg/joda/time/DateTimeZone;

    invoke-virtual {v1}, Lorg/joda/time/DateTimeZone;->hashCode()I

    move-result v1

    goto :goto_13
.end method
