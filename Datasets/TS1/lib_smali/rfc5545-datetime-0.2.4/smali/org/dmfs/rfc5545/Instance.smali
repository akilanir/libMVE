.class public final Lorg/dmfs/rfc5545/Instance;
.super Ljava/lang/Object;


# static fields
.field private static final DAY_BIAS:I = 0x40

.field private static final DAY_BITS:I = 0x7

.field private static final DAY_MASK:J = 0xfe00000L

.field private static final DAY_POS:I = 0x15

.field private static final HOUR_BITS:I = 0x5

.field private static final HOUR_MASK:J = 0x1f0000L

.field private static final HOUR_POS:I = 0x10

.field private static final MINUTE_BITS:I = 0x6

.field private static final MINUTE_MASK:J = 0xfc00L

.field private static final MINUTE_POS:I = 0xa

.field private static final MONTH_BITS:I = 0x8

.field private static final MONTH_MASK:J = 0xff0000000L

.field private static final MONTH_POS:I = 0x1c

.field private static final SECOND_BITS:I = 0x6

.field private static final SECOND_MASK:J = 0x3f0L

.field private static final SECOND_POS:I = 0x4

.field private static final WEEKDAY_BITS:I = 0x4

.field private static final WEEKDAY_MASK:J = 0xfL

.field private static final WEEKDAY_POS:I = 0x0

.field private static final YEAR_BIAS:I = 0x0

.field private static final YEAR_BITS:I = 0x12

.field private static final YEAR_MASK:J = 0x3ffff000000000L

.field private static final YEAR_POS:I = 0x24


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dayOfMonth(J)I
    .registers 5

    const-wide/32 v0, 0xfe00000

    and-long/2addr v0, p0

    const/16 v2, 0x15

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    add-int/lit8 v0, v0, -0x40

    return v0
.end method

.method public static dayOfWeek(J)I
    .registers 5

    const-wide/16 v0, 0xf

    and-long/2addr v0, p0

    const/4 v2, 0x0

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public static hour(J)I
    .registers 5

    const-wide/32 v0, 0x1f0000

    and-long/2addr v0, p0

    const/16 v2, 0x10

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public static make(IIIIII)J
    .registers 12

    int-to-long v0, p0

    const-wide/16 v2, 0x0

    add-long/2addr v0, v2

    const/16 v2, 0x24

    shl-long/2addr v0, v2

    int-to-long v2, p1

    const/16 v4, 0x1c

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p2

    const-wide/16 v4, 0x40

    add-long/2addr v2, v4

    const/16 v4, 0x15

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p3

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p4

    const/16 v4, 0xa

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p5

    const/4 v4, 0x4

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static make(IIIIIII)J
    .registers 13

    int-to-long v0, p0

    const-wide/16 v2, 0x0

    add-long/2addr v0, v2

    const/16 v2, 0x24

    shl-long/2addr v0, v2

    int-to-long v2, p1

    const/16 v4, 0x1c

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p2

    const-wide/16 v4, 0x40

    add-long/2addr v2, v4

    const/16 v4, 0x15

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p6

    const/4 v4, 0x0

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p3

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p4

    const/16 v4, 0xa

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p5

    const/4 v4, 0x4

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static maskWeekday(J)J
    .registers 4

    const-wide/16 v0, -0x10

    and-long/2addr v0, p0

    return-wide v0
.end method

.method public static minute(J)I
    .registers 5

    const-wide/32 v0, 0xfc00

    and-long/2addr v0, p0

    const/16 v2, 0xa

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public static month(J)I
    .registers 5

    const-wide v0, 0xff0000000L

    and-long/2addr v0, p0

    const/16 v2, 0x1c

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public static second(J)I
    .registers 5

    const-wide/16 v0, 0x3f0

    and-long/2addr v0, p0

    const/4 v2, 0x4

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public static setDayOfMonth(JI)J
    .registers 9

    const-wide/32 v0, -0xfe00001

    and-long/2addr v0, p0

    int-to-long v2, p2

    const-wide/16 v4, 0x40

    add-long/2addr v2, v4

    const/16 v4, 0x15

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static setDayOfWeek(JI)J
    .registers 7

    const-wide/16 v0, -0x10

    and-long/2addr v0, p0

    shl-int/lit8 v2, p2, 0x0

    int-to-long v2, v2

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static setHour(JI)J
    .registers 8

    const-wide/32 v0, -0x1f0001

    and-long/2addr v0, p0

    int-to-long v2, p2

    const/16 v4, 0x10

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static setMinute(JI)J
    .registers 8

    const-wide/32 v0, -0xfc01

    and-long/2addr v0, p0

    int-to-long v2, p2

    const/16 v4, 0xa

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static setMonth(JI)J
    .registers 8

    const-wide v0, -0xff0000001L

    and-long/2addr v0, p0

    int-to-long v2, p2

    const/16 v4, 0x1c

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static setMonthAndDayOfMonth(JII)J
    .registers 10

    const-wide v0, -0xfffe00001L

    and-long/2addr v0, p0

    int-to-long v2, p2

    const/16 v4, 0x1c

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, p3

    const-wide/16 v4, 0x40

    add-long/2addr v2, v4

    const/16 v4, 0x15

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static setSecond(JI)J
    .registers 8

    const-wide/16 v0, -0x3f1

    and-long/2addr v0, p0

    int-to-long v2, p2

    const/4 v4, 0x4

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static setYear(JI)J
    .registers 9

    const-wide v0, -0x3ffff000000001L

    and-long/2addr v0, p0

    int-to-long v2, p2

    const-wide/16 v4, 0x0

    add-long/2addr v2, v4

    const/16 v4, 0x24

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public static toString(J)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/dmfs/rfc5545/Instance;->toString(JZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(JZ)Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-static {v0, p0, p1, p2}, Lorg/dmfs/rfc5545/Instance;->writeTo(Ljava/lang/StringBuilder;JZ)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static writeDigits(Ljava/io/Writer;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    div-int/lit8 v0, p1, 0xa

    rem-int/lit8 v0, v0, 0xa

    add-int/lit8 v0, v0, 0x30

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    rem-int/lit8 v0, p1, 0xa

    add-int/lit8 v0, v0, 0x30

    invoke-virtual {p0, v0}, Ljava/io/Writer;->write(I)V

    return-void
.end method

.method private static writeDigits(Ljava/lang/StringBuilder;I)V
    .registers 3

    div-int/lit8 v0, p1, 0xa

    rem-int/lit8 v0, v0, 0xa

    add-int/lit8 v0, v0, 0x30

    int-to-char v0, v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    rem-int/lit8 v0, p1, 0xa

    add-int/lit8 v0, v0, 0x30

    int-to-char v0, v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method public static writeTo(Ljava/io/Writer;J)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->writeTo(Ljava/io/Writer;JZ)V

    return-void
.end method

.method public static writeTo(Ljava/io/Writer;JZ)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    div-int/lit8 v1, v0, 0x64

    invoke-static {p0, v1}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/io/Writer;I)V

    rem-int/lit8 v0, v0, 0x64

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/io/Writer;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/io/Writer;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/io/Writer;I)V

    if-nez p3, :cond_3a

    const/16 v0, 0x54

    invoke-virtual {p0, v0}, Ljava/io/Writer;->append(C)Ljava/io/Writer;

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/io/Writer;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/io/Writer;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/io/Writer;I)V

    :cond_3a
    return-void
.end method

.method public static writeTo(Ljava/lang/StringBuilder;J)V
    .registers 4

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/dmfs/rfc5545/Instance;->writeTo(Ljava/lang/StringBuilder;JZ)V

    return-void
.end method

.method public static writeTo(Ljava/lang/StringBuilder;JZ)V
    .registers 6

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    div-int/lit8 v1, v0, 0x64

    invoke-static {p0, v1}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/lang/StringBuilder;I)V

    rem-int/lit8 v0, v0, 0x64

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/lang/StringBuilder;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/lang/StringBuilder;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/lang/StringBuilder;I)V

    if-nez p3, :cond_3a

    const/16 v0, 0x54

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/lang/StringBuilder;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/lang/StringBuilder;I)V

    invoke-static {p1, p2}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/Instance;->writeDigits(Ljava/lang/StringBuilder;I)V

    :cond_3a
    return-void
.end method

.method public static year(J)I
    .registers 5

    const-wide v0, 0x3ffff000000000L

    and-long/2addr v0, p0

    const/16 v2, 0x24

    ushr-long/2addr v0, v2

    long-to-int v0, v0

    add-int/lit8 v0, v0, 0x0

    return v0
.end method
