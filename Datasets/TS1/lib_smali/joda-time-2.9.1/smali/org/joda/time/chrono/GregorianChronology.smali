.class public final Lorg/joda/time/chrono/GregorianChronology;
.super Lorg/joda/time/chrono/BasicGJChronology;
.source "GregorianChronology.java"


# static fields
.field private static final DAYS_0000_TO_1970:I = 0xafaa7

.field private static final INSTANCE_UTC:Lorg/joda/time/chrono/GregorianChronology;

.field private static final MAX_YEAR:I = 0x116bd2d1

.field private static final MILLIS_PER_MONTH:J = 0x9cbebd50L

.field private static final MILLIS_PER_YEAR:J = 0x758f0dfc0L

.field private static final MIN_YEAR:I = -0x116bc36e

.field private static final cCache:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/joda/time/DateTimeZone;",
            "[",
            "Lorg/joda/time/chrono/GregorianChronology;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0xbf4557381e8943aL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/joda/time/chrono/GregorianChronology;->cCache:Ljava/util/concurrent/ConcurrentHashMap;

    .line 70
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    invoke-static {v0}, Lorg/joda/time/chrono/GregorianChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/GregorianChronology;

    move-result-object v0

    sput-object v0, Lorg/joda/time/chrono/GregorianChronology;->INSTANCE_UTC:Lorg/joda/time/chrono/GregorianChronology;

    .line 71
    return-void
.end method

.method private constructor <init>(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V
    .registers 4

    .prologue
    .line 153
    invoke-direct {p0, p1, p2, p3}, Lorg/joda/time/chrono/BasicGJChronology;-><init>(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V

    .line 154
    return-void
.end method

.method public static getInstance()Lorg/joda/time/chrono/GregorianChronology;
    .registers 2

    .prologue
    .line 89
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefault()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lorg/joda/time/chrono/GregorianChronology;->getInstance(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/GregorianChronology;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/GregorianChronology;
    .registers 2

    .prologue
    .line 99
    const/4 v0, 0x4

    invoke-static {p0, v0}, Lorg/joda/time/chrono/GregorianChronology;->getInstance(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/GregorianChronology;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/GregorianChronology;
    .registers 6

    .prologue
    .line 110
    if-nez p0, :cond_6

    .line 111
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefault()Lorg/joda/time/DateTimeZone;

    move-result-object p0

    .line 114
    :cond_6
    sget-object v0, Lorg/joda/time/chrono/GregorianChronology;->cCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/joda/time/chrono/GregorianChronology;

    .line 115
    if-nez v0, :cond_6a

    .line 116
    const/4 v0, 0x7

    new-array v1, v0, [Lorg/joda/time/chrono/GregorianChronology;

    .line 117
    sget-object v0, Lorg/joda/time/chrono/GregorianChronology;->cCache:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/joda/time/chrono/GregorianChronology;

    .line 118
    if-eqz v0, :cond_1e

    move-object v1, v0

    .line 123
    :cond_1e
    :goto_1e
    add-int/lit8 v0, p1, -0x1

    :try_start_20
    aget-object v0, v1, v0
    :try_end_22
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_20 .. :try_end_22} :catch_3c

    .line 128
    if-nez v0, :cond_3b

    .line 129
    monitor-enter v1

    .line 130
    add-int/lit8 v0, p1, -0x1

    :try_start_27
    aget-object v0, v1, v0

    .line 131
    if-nez v0, :cond_3a

    .line 132
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    if-ne p0, v0, :cond_56

    .line 133
    new-instance v0, Lorg/joda/time/chrono/GregorianChronology;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, p1}, Lorg/joda/time/chrono/GregorianChronology;-><init>(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V

    .line 139
    :goto_36
    add-int/lit8 v2, p1, -0x1

    aput-object v0, v1, v2

    .line 141
    :cond_3a
    monitor-exit v1
    :try_end_3b
    .catchall {:try_start_27 .. :try_end_3b} :catchall_67

    .line 143
    :cond_3b
    return-object v0

    .line 124
    :catch_3c
    move-exception v0

    .line 125
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid min days in first week: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_56
    :try_start_56
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    invoke-static {v0, p1}, Lorg/joda/time/chrono/GregorianChronology;->getInstance(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/GregorianChronology;

    move-result-object v2

    .line 136
    new-instance v0, Lorg/joda/time/chrono/GregorianChronology;

    invoke-static {v2, p0}, Lorg/joda/time/chrono/ZonedChronology;->getInstance(Lorg/joda/time/Chronology;Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/ZonedChronology;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, p1}, Lorg/joda/time/chrono/GregorianChronology;-><init>(Lorg/joda/time/Chronology;Ljava/lang/Object;I)V

    goto :goto_36

    .line 141
    :catchall_67
    move-exception v0

    monitor-exit v1
    :try_end_69
    .catchall {:try_start_56 .. :try_end_69} :catchall_67

    throw v0

    :cond_6a
    move-object v1, v0

    goto :goto_1e
.end method

.method public static getInstanceUTC()Lorg/joda/time/chrono/GregorianChronology;
    .registers 1

    .prologue
    .line 80
    sget-object v0, Lorg/joda/time/chrono/GregorianChronology;->INSTANCE_UTC:Lorg/joda/time/chrono/GregorianChronology;

    return-object v0
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 160
    invoke-virtual {p0}, Lorg/joda/time/chrono/GregorianChronology;->getBase()Lorg/joda/time/Chronology;

    move-result-object v1

    .line 161
    invoke-virtual {p0}, Lorg/joda/time/chrono/GregorianChronology;->getMinimumDaysInFirstWeek()I

    move-result v0

    .line 162
    if-nez v0, :cond_b

    const/4 v0, 0x4

    .line 163
    :cond_b
    if-nez v1, :cond_14

    sget-object v1, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    invoke-static {v1, v0}, Lorg/joda/time/chrono/GregorianChronology;->getInstance(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/GregorianChronology;

    move-result-object v0

    :goto_13
    return-object v0

    :cond_14
    invoke-virtual {v1}, Lorg/joda/time/Chronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/joda/time/chrono/GregorianChronology;->getInstance(Lorg/joda/time/DateTimeZone;I)Lorg/joda/time/chrono/GregorianChronology;

    move-result-object v0

    goto :goto_13
.end method


# virtual methods
.method protected assemble(Lorg/joda/time/chrono/AssembledChronology$Fields;)V
    .registers 3

    .prologue
    .line 196
    invoke-virtual {p0}, Lorg/joda/time/chrono/GregorianChronology;->getBase()Lorg/joda/time/Chronology;

    move-result-object v0

    if-nez v0, :cond_9

    .line 197
    invoke-super {p0, p1}, Lorg/joda/time/chrono/BasicGJChronology;->assemble(Lorg/joda/time/chrono/AssembledChronology$Fields;)V

    .line 199
    :cond_9
    return-void
.end method

.method calculateFirstDayOfYearMillis(I)J
    .registers 7

    .prologue
    .line 207
    div-int/lit8 v0, p1, 0x64

    .line 208
    if-gez p1, :cond_20

    .line 214
    add-int/lit8 v1, p1, 0x3

    shr-int/lit8 v1, v1, 0x2

    sub-int/2addr v1, v0

    add-int/lit8 v0, v0, 0x3

    shr-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    .line 222
    :cond_10
    :goto_10
    int-to-long v1, p1

    const-wide/16 v3, 0x16d

    mul-long/2addr v1, v3

    const v3, 0xafaa7

    sub-int/2addr v0, v3

    int-to-long v3, v0

    add-long v0, v1, v3

    const-wide/32 v2, 0x5265c00

    mul-long/2addr v0, v2

    return-wide v0

    .line 216
    :cond_20
    shr-int/lit8 v1, p1, 0x2

    sub-int/2addr v1, v0

    shr-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v1

    .line 217
    invoke-virtual {p0, p1}, Lorg/joda/time/chrono/GregorianChronology;->isLeapYear(I)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 218
    add-int/lit8 v0, v0, -0x1

    goto :goto_10
.end method

.method getApproxMillisAtEpochDividedByTwo()J
    .registers 3

    .prologue
    .line 246
    const-wide v0, 0x1c4536cce9c0L

    return-wide v0
.end method

.method getAverageMillisPerMonth()J
    .registers 3

    .prologue
    .line 242
    const-wide v0, 0x9cbebd50L

    return-wide v0
.end method

.method getAverageMillisPerYear()J
    .registers 3

    .prologue
    .line 234
    const-wide v0, 0x758f0dfc0L

    return-wide v0
.end method

.method getAverageMillisPerYearDividedByTwo()J
    .registers 3

    .prologue
    .line 238
    const-wide v0, 0x3ac786fe0L

    return-wide v0
.end method

.method getMaxYear()I
    .registers 2

    .prologue
    .line 230
    const v0, 0x116bd2d1

    return v0
.end method

.method getMinYear()I
    .registers 2

    .prologue
    .line 226
    const v0, -0x116bc36e

    return v0
.end method

.method isLeapYear(I)Z
    .registers 3

    .prologue
    .line 202
    and-int/lit8 v0, p1, 0x3

    if-nez v0, :cond_e

    rem-int/lit8 v0, p1, 0x64

    if-nez v0, :cond_c

    rem-int/lit16 v0, p1, 0x190

    if-nez v0, :cond_e

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public withUTC()Lorg/joda/time/Chronology;
    .registers 2

    .prologue
    .line 176
    sget-object v0, Lorg/joda/time/chrono/GregorianChronology;->INSTANCE_UTC:Lorg/joda/time/chrono/GregorianChronology;

    return-object v0
.end method

.method public withZone(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/Chronology;
    .registers 3

    .prologue
    .line 186
    if-nez p1, :cond_6

    .line 187
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefault()Lorg/joda/time/DateTimeZone;

    move-result-object p1

    .line 189
    :cond_6
    invoke-virtual {p0}, Lorg/joda/time/chrono/GregorianChronology;->getZone()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    if-ne p1, v0, :cond_d

    .line 192
    :goto_c
    return-object p0

    :cond_d
    invoke-static {p1}, Lorg/joda/time/chrono/GregorianChronology;->getInstance(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/chrono/GregorianChronology;

    move-result-object p0

    goto :goto_c
.end method
