.class public final Lorg/dmfs/rfc5545/DateTime;
.super Ljava/lang/Object;


# static fields
.field public static final GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field public static final UTC:Ljava/util/TimeZone;


# instance fields
.field private final mAllday:Z

.field private final mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field private mDayOfWeek:I

.field private mInstance:J

.field private mTimestamp:J

.field private final mTimezone:Ljava/util/TimeZone;

.field private mWeekOfYear:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    sput-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    const-string v0, "UTC"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    return-void
.end method

.method public constructor <init>(III)V
    .registers 10

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move v0, p1

    move v1, p2

    move v2, p3

    move v4, v3

    move v5, v3

    invoke-static/range {v0 .. v5}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method public constructor <init>(IIIIII)V
    .registers 15

    const/4 v1, 0x0

    check-cast v1, Ljava/util/TimeZone;

    move-object v0, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-direct/range {v0 .. v7}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;IIIIII)V

    return-void
.end method

.method public constructor <init>(J)V
    .registers 5

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    sget-object v1, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;J)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .registers 11

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    invoke-static {p1}, Lorg/dmfs/rfc5545/UnicodeCalendarScales;->getCalendarMetricsForName(Ljava/lang/String;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;->getCalendarMetrics(Lorg/dmfs/rfc5545/Weekday;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move v0, p2

    move v1, p3

    move v2, p4

    move v4, v3

    move v5, v3

    invoke-static/range {v0 .. v5}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IIIIII)V
    .registers 17

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/lang/String;Ljava/util/TimeZone;IIIIII)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;IIIIII)V
    .registers 12

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    invoke-static {p1}, Lorg/dmfs/rfc5545/UnicodeCalendarScales;->getCalendarMetricsForName(Ljava/lang/String;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;->getCalendarMetrics(Lorg/dmfs/rfc5545/Weekday;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static/range {p3 .. p8}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput-object p2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/TimeZone;IIIIII)V
    .registers 11

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static/range {p2 .. p7}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput-object p1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method public constructor <init>(Ljava/util/TimeZone;J)V
    .registers 5

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;J)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;III)V
    .registers 11

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    iput-object p1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move v0, p2

    move v1, p3

    move v2, p4

    move v4, v3

    move v5, v3

    invoke-static/range {v0 .. v5}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;IIIIII)V
    .registers 17

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    move/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;IIIIII)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;IIIIII)V
    .registers 12

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    iput-object p1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static/range {p3 .. p8}, Lorg/dmfs/rfc5545/Instance;->make(IIIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput-object p2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;J)V
    .registers 8

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    iput-object p1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-wide p3, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-object p2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method private constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;JZJ)V
    .registers 11

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    iput-object p1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-wide p3, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput-object p2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iput-boolean p5, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iput-wide p6, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Lorg/dmfs/rfc5545/DateTime;)V
    .registers 7

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    iput-object p1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p3}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iget-boolean v0, p3, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-eqz v0, :cond_31

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-object v0, p3, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p1, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v0

    if-eqz v0, :cond_2c

    iget-wide v0, p3, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    :cond_2c
    :goto_2c
    iget-boolean v0, p3, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void

    :cond_31
    iput-object p2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    goto :goto_2c
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/DateTime;)V
    .registers 6

    const-wide v1, 0x7fffffffffffffffL

    const/4 v0, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iput-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    iput-object p1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iget-object v0, p2, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iput-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-boolean v0, p2, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return-void
.end method

.method public static now()Lorg/dmfs/rfc5545/DateTime;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-static {v0}, Lorg/dmfs/rfc5545/DateTime;->now(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public static now(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;
    .registers 5

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    sget-object v1, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-direct {v0, v1, p0, v2, v3}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;J)V

    return-object v0
.end method

.method public static nowAndHere()Lorg/dmfs/rfc5545/DateTime;
    .registers 1

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Lorg/dmfs/rfc5545/DateTime;->now(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;
    .registers 3

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    const/4 v1, 0x0

    invoke-static {v0, v1, p0}, Lorg/dmfs/rfc5545/DateTime;->parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;
    .registers 4

    sget-object v1, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    if-nez p0, :cond_a

    const/4 v0, 0x0

    :goto_5
    invoke-static {v1, v0, p1}, Lorg/dmfs/rfc5545/DateTime;->parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0

    :cond_a
    invoke-static {p0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_5
.end method

.method public static parse(Ljava/lang/String;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;
    .registers 5

    invoke-static {p0}, Lorg/dmfs/rfc5545/UnicodeCalendarScales;->getCalendarMetricsForName(Ljava/lang/String;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics$CalendarMetricsFactory;->getCalendarMetrics(Lorg/dmfs/rfc5545/Weekday;)Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/dmfs/rfc5545/DateTime;->parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;
    .registers 3

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {v0, p0, p1}, Lorg/dmfs/rfc5545/DateTime;->parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;
    .registers 12

    const/16 v1, 0x8

    if-nez p2, :cond_c

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "a date-time string must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    :try_start_c
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v1, :cond_29

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    const/4 v1, 0x0

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseFourDigits(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x4

    invoke-static {p2, v2}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x6

    invoke-static {p2, v3}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v3

    invoke-direct {v0, p0, v1, v2, v3}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;III)V

    :goto_28
    return-object v0

    :cond_29
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xf

    if-ne v0, v1, :cond_86

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x54

    if-ne v0, v1, :cond_86

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    const/4 v1, 0x0

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseFourDigits(Ljava/lang/String;I)I

    move-result v3

    const/4 v1, 0x4

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v4, v1, -0x1

    const/4 v1, 0x6

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v5

    const/16 v1, 0x9

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v6

    const/16 v1, 0xb

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v7

    const/16 v1, 0xd

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v8

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v8}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;IIIIII)V
    :try_end_65
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_65} :catch_66

    goto :goto_28

    :catch_66
    move-exception v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "illegal characters in date-time string: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_86
    :try_start_86
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x10

    if-ne v0, v1, :cond_cf

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x54

    if-ne v0, v1, :cond_cf

    const/16 v0, 0xf

    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5a

    if-ne v0, v1, :cond_cf

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    sget-object v2, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    const/4 v1, 0x0

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseFourDigits(Ljava/lang/String;I)I

    move-result v3

    const/4 v1, 0x4

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v1

    add-int/lit8 v4, v1, -0x1

    const/4 v1, 0x6

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v5

    const/16 v1, 0x9

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v6

    const/16 v1, 0xb

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v7

    const/16 v1, 0xd

    invoke-static {p2, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v8

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;IIIIII)V
    :try_end_cd
    .catch Ljava/lang/NumberFormatException; {:try_start_86 .. :try_end_cd} :catch_66

    goto/16 :goto_28

    :cond_cf
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal date-time string: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static parseFourDigits(Ljava/lang/String;I)I
    .registers 4

    invoke-static {p0, p1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x64

    add-int/lit8 v1, p1, 0x2

    invoke-static {p0, v1}, Lorg/dmfs/rfc5545/DateTime;->parseTwoDigits(Ljava/lang/String;I)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static parseTwoDigits(Ljava/lang/String;I)I
    .registers 5

    const/16 v2, 0x9

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    add-int/lit8 v0, v0, -0x30

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    add-int/lit8 v1, v1, -0x30

    if-ltz v0, :cond_18

    if-ltz v1, :cond_18

    if-gt v0, v2, :cond_18

    if-le v1, v2, :cond_36

    :cond_18
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal digit in number "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_36
    mul-int/lit8 v0, v0, 0xa

    add-int/2addr v0, v1

    return v0
.end method

.method private static sameTimestamps(Ljava/util/TimeZone;Ljava/util/TimeZone;)Z
    .registers 6

    const/4 v1, 0x0

    const/4 v0, 0x1

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    if-eqz p0, :cond_5d

    invoke-virtual {p0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v2

    :goto_b
    if-nez p1, :cond_25

    const-string v3, "UTC"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    sget-object v3, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-virtual {v3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    sget-object v3, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-virtual {v3, p0}, Ljava/util/TimeZone;->hasSameRules(Ljava/util/TimeZone;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_25
    if-eqz p1, :cond_2b

    invoke-virtual {p1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    :cond_2b
    if-nez p0, :cond_45

    const-string v3, "UTC"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    sget-object v3, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    sget-object v3, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-virtual {v3, p1}, Ljava/util/TimeZone;->hasSameRules(Ljava/util/TimeZone;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_45
    if-eqz p0, :cond_5b

    if-eqz p1, :cond_5b

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0, p1}, Ljava/util/TimeZone;->hasSameRules(Ljava/util/TimeZone;)Z

    move-result v1

    if-nez v1, :cond_4

    :cond_5b
    const/4 v0, 0x0

    goto :goto_4

    :cond_5d
    move-object v2, v1

    goto :goto_b
.end method

.method public static today()Lorg/dmfs/rfc5545/DateTime;
    .registers 8

    const/4 v5, 0x0

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toInstance(JLjava/util/TimeZone;)J

    move-result-wide v3

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    sget-object v1, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    const/4 v2, 0x0

    invoke-static {v3, v4, v5}, Lorg/dmfs/rfc5545/Instance;->setHour(JI)J

    move-result-wide v3

    invoke-static {v3, v4, v5}, Lorg/dmfs/rfc5545/Instance;->setMinute(JI)J

    move-result-wide v3

    invoke-static {v3, v4, v5}, Lorg/dmfs/rfc5545/Instance;->setSecond(JI)J

    move-result-wide v3

    const/4 v5, 0x1

    const-wide v6, 0x7fffffffffffffffL

    invoke-direct/range {v0 .. v7}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;JZJ)V

    return-object v0
.end method


# virtual methods
.method public addDuration(Lorg/dmfs/rfc5545/Duration;)Lorg/dmfs/rfc5545/DateTime;
    .registers 15

    const-wide v3, 0x7fffffffffffffffL

    if-nez p1, :cond_f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Duration must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->isZero()Z

    move-result v0

    if-eqz v0, :cond_16

    :goto_15
    return-object p0

    :cond_16
    iget-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-eqz v0, :cond_28

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getSecondsOfDay()I

    move-result v0

    if-lez v0, :cond_28

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t add a duration with time to an all-day DateTime."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_28
    iget-wide v8, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v0, v8, v3

    if-nez v0, :cond_4e

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-eqz v0, :cond_3a

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-virtual {v0}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v0

    if-nez v0, :cond_4e

    :cond_3a
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-boolean v5, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iget-wide v6, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->toMillis()J

    move-result-wide v8

    add-long/2addr v6, v8

    invoke-direct/range {v0 .. v7}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;JZJ)V

    move-object p0, v0

    goto :goto_15

    :cond_4e
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getRawDays()I

    move-result v0

    if-lez v0, :cond_68

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getSign()I

    move-result v0

    if-lez v0, :cond_7c

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v1

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getRawDays()I

    move-result v5

    invoke-virtual {v0, v1, v2, v5}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextDay(JI)J

    move-result-wide v8

    :cond_68
    :goto_68
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getSecondsOfDay()I

    move-result v0

    if-nez v0, :cond_8b

    new-instance v5, Lorg/dmfs/rfc5545/DateTime;

    iget-object v6, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v7, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-boolean v10, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    move-wide v11, v3

    invoke-direct/range {v5 .. v12}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;JZJ)V

    move-object p0, v5

    goto :goto_15

    :cond_7c
    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v1

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getRawDays()I

    move-result v5

    invoke-virtual {v0, v1, v2, v5}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->prevDay(JI)J

    move-result-wide v8

    goto :goto_68

    :cond_8b
    iget-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v0, v8, v0

    if-nez v0, :cond_af

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v0

    :goto_95
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getSign()I

    move-result v2

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/Duration;->getSecondsOfDay()I

    move-result v3

    mul-int/2addr v2, v3

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    add-long v1, v0, v2

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v3, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v4, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-direct {v0, v3, v4, v1, v2}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;J)V

    move-object p0, v0

    goto/16 :goto_15

    :cond_af
    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    cmp-long v1, v8, v3

    if-nez v1, :cond_b9

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v8

    :cond_b9
    iget-object v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-virtual {v0, v8, v9, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toMillis(JLjava/util/TimeZone;)J

    move-result-wide v0

    goto :goto_95
.end method

.method public after(Lorg/dmfs/rfc5545/DateTime;)Z
    .registers 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide v4, 0x7fffffffffffffffL

    iget-wide v2, p1, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_40

    iget-wide v2, p1, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_19

    iget-wide v2, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_40

    :cond_19
    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v2

    if-eqz v2, :cond_40

    iget-boolean v2, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iget-boolean v3, p1, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-ne v2, v3, :cond_40

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/DateTime;->sameTimestamps(Ljava/util/TimeZone;Ljava/util/TimeZone;)Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    iget-wide v4, p1, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_3e

    :cond_3d
    :goto_3d
    return v0

    :cond_3e
    move v0, v1

    goto :goto_3d

    :cond_40
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-gtz v2, :cond_3d

    move v0, v1

    goto :goto_3d
.end method

.method public before(Lorg/dmfs/rfc5545/DateTime;)Z
    .registers 8

    const/4 v0, 0x1

    const/4 v1, 0x0

    const-wide v4, 0x7fffffffffffffffL

    iget-wide v2, p1, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_40

    iget-wide v2, p1, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_19

    iget-wide v2, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_40

    :cond_19
    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v2

    if-eqz v2, :cond_40

    iget-boolean v2, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iget-boolean v3, p1, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-ne v2, v3, :cond_40

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/DateTime;->sameTimestamps(Ljava/util/TimeZone;Ljava/util/TimeZone;)Z

    move-result v2

    if-eqz v2, :cond_40

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v2

    iget-wide v4, p1, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_3e

    :cond_3d
    :goto_3d
    return v0

    :cond_3e
    move v0, v1

    goto :goto_3d

    :cond_40
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-ltz v2, :cond_3d

    move v0, v1

    goto :goto_3d
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8

    const-wide v4, 0x7fffffffffffffffL

    const/4 v0, 0x1

    const/4 v1, 0x0

    instance-of v2, p1, Lorg/dmfs/rfc5545/DateTime;

    if-nez v2, :cond_d

    move v0, v1

    :cond_c
    :goto_c
    return v0

    :cond_d
    check-cast p1, Lorg/dmfs/rfc5545/DateTime;

    iget-wide v2, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4d

    iget-wide v2, p1, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-eqz v2, :cond_4d

    iget-wide v2, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    iget-wide v4, p1, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_4b

    iget-boolean v2, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iget-boolean v3, p1, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-ne v2, v3, :cond_4b

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v2

    if-eqz v2, :cond_4b

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-eq v2, v3, :cond_c

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-eqz v2, :cond_4b

    iget-object v2, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-eqz v2, :cond_4b

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/DateTime;->sameTimestamps(Ljava/util/TimeZone;Ljava/util/TimeZone;)Z

    move-result v2

    if-nez v2, :cond_c

    :cond_4b
    move v0, v1

    goto :goto_c

    :cond_4d
    iget-boolean v2, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    iget-boolean v3, p1, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-ne v2, v3, :cond_81

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v2

    if-eqz v2, :cond_81

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_81

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-eq v2, v3, :cond_c

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-eqz v2, :cond_81

    iget-object v2, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-eqz v2, :cond_81

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-object v3, p1, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-static {v2, v3}, Lorg/dmfs/rfc5545/DateTime;->sameTimestamps(Ljava/util/TimeZone;Ljava/util/TimeZone;)Z

    move-result v2

    if-nez v2, :cond_c

    :cond_81
    move v0, v1

    goto :goto_c
.end method

.method public getCalendarMetrics()Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    return-object v0
.end method

.method public getDayOfMonth()I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    return v0
.end method

.method public getDayOfWeek()I
    .registers 6

    iget v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    if-gez v0, :cond_1c

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v4

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    invoke-virtual {v2, v3, v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getDayOfWeek(III)I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mDayOfWeek:I

    :cond_1c
    return v0
.end method

.method public getHours()I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v0

    return v0
.end method

.method public getInstance()J
    .registers 5

    iget-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v2, v0, v2

    if-nez v2, :cond_17

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-wide v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    iget-object v3, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-virtual {v0, v1, v2, v3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toInstance(JLjava/util/TimeZone;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    :cond_17
    return-wide v0
.end method

.method public getMinutes()I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v0

    return v0
.end method

.method public getMonth()I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v0

    return v0
.end method

.method public getSeconds()I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v0

    return v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public getTimestamp()J
    .registers 10

    iget-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-nez v0, :cond_33

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v7

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v1, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-static {v7, v8}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {v7, v8}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {v7, v8}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v4

    invoke-static {v7, v8}, Lorg/dmfs/rfc5545/Instance;->hour(J)I

    move-result v5

    invoke-static {v7, v8}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v6

    invoke-static {v7, v8}, Lorg/dmfs/rfc5545/Instance;->second(J)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->toMillis(Ljava/util/TimeZone;IIIIIII)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    :goto_32
    return-wide v0

    :cond_33
    iget-wide v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    goto :goto_32
.end method

.method public getWeekOfYear()I
    .registers 6

    iget v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    if-gez v0, :cond_1c

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v3

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v4

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    invoke-virtual {v2, v3, v4, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->getWeekOfYear(III)I

    move-result v0

    iput v0, p0, Lorg/dmfs/rfc5545/DateTime;->mWeekOfYear:I

    :cond_1c
    return v0
.end method

.method public getYear()I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .registers 3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method public isAllDay()Z
    .registers 2

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    return v0
.end method

.method public isFloating()Z
    .registers 2

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;
    .registers 10

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can not shift the time zone of an all-day date"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-nez v0, :cond_12

    if-eqz p1, :cond_1a

    :cond_12
    if-eqz v0, :cond_1b

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    :cond_1a
    :goto_1a
    return-object p0

    :cond_1b
    iget-wide v3, p0, Lorg/dmfs/rfc5545/DateTime;->mInstance:J

    const-wide v1, 0x7fffffffffffffffL

    cmp-long v1, v3, v1

    if-eqz v1, :cond_34

    if-eqz v0, :cond_2e

    invoke-virtual {v0, p1}, Ljava/util/TimeZone;->hasSameRules(Ljava/util/TimeZone;)Z

    move-result v1

    if-nez v1, :cond_34

    :cond_2e
    invoke-static {v0, p1}, Lorg/dmfs/rfc5545/DateTime;->sameTimestamps(Ljava/util/TimeZone;Ljava/util/TimeZone;)Z

    move-result v0

    if-eqz v0, :cond_43

    :cond_34
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    const/4 v5, 0x0

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v6

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;JZJ)V

    move-object p0, v0

    goto :goto_1a

    :cond_43
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v1

    invoke-direct {v0, p1, v1, v2}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;J)V

    move-object p0, v0

    goto :goto_1a
.end method

.method public startOfDay()Lorg/dmfs/rfc5545/DateTime;
    .registers 10

    const/4 v6, 0x0

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-nez v0, :cond_18

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getHours()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getMinutes()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getSeconds()I

    move-result v0

    if-nez v0, :cond_18

    :goto_17
    return-object p0

    :cond_18
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v2, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getYear()I

    move-result v3

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getMonth()I

    move-result v4

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getDayOfMonth()I

    move-result v5

    move v7, v6

    move v8, v6

    invoke-direct/range {v0 .. v8}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;IIIIII)V

    move-object p0, v0

    goto :goto_17
.end method

.method public swapTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;
    .registers 12

    const-wide v8, 0x7fffffffffffffffL

    const/4 v5, 0x0

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-eqz v0, :cond_12

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "can not swap the time zone of an all-day date"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    if-nez v0, :cond_18

    if-eqz p1, :cond_20

    :cond_18
    if-eqz v0, :cond_22

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    :cond_20
    move-object v0, p0

    :goto_21
    return-object v0

    :cond_22
    iget-wide v6, p0, Lorg/dmfs/rfc5545/DateTime;->mTimestamp:J

    cmp-long v1, v6, v8

    if-eqz v1, :cond_36

    if-eqz v0, :cond_30

    invoke-virtual {v0, p1}, Ljava/util/TimeZone;->hasSameRules(Ljava/util/TimeZone;)Z

    move-result v1

    if-nez v1, :cond_36

    :cond_30
    invoke-static {v0, p1}, Lorg/dmfs/rfc5545/DateTime;->sameTimestamps(Ljava/util/TimeZone;Ljava/util/TimeZone;)Z

    move-result v0

    if-eqz v0, :cond_43

    :cond_36
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v3

    move-object v2, p1

    invoke-direct/range {v0 .. v7}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;JZJ)V

    goto :goto_21

    :cond_43
    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/DateTime;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v3

    move-object v2, p1

    move-wide v6, v8

    invoke-direct/range {v0 .. v7}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;JZJ)V

    goto :goto_21
.end method

.method public toAllDay()Lorg/dmfs/rfc5545/DateTime;
    .registers 5

    iget-boolean v0, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-eqz v0, :cond_5

    :goto_4
    return-object p0

    :cond_5
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    new-instance p0, Lorg/dmfs/rfc5545/DateTime;

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v2

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->month(J)I

    move-result v3

    invoke-static {v0, v1}, Lorg/dmfs/rfc5545/Instance;->dayOfMonth(J)I

    move-result v0

    invoke-direct {p0, v2, v3, v0}, Lorg/dmfs/rfc5545/DateTime;-><init>(III)V

    goto :goto_4
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x10

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-boolean v3, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    invoke-static {v2, v0, v1, v3}, Lorg/dmfs/rfc5545/Instance;->writeTo(Ljava/lang/StringBuilder;JZ)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-boolean v1, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-nez v1, :cond_29

    if-eqz v0, :cond_29

    const-string v1, "UTC"

    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    const/16 v0, 0x5a

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_29
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeTo(Ljava/io/Writer;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    iget-boolean v2, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    invoke-static {p1, v0, v1, v2}, Lorg/dmfs/rfc5545/Instance;->writeTo(Ljava/io/Writer;JZ)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-boolean v1, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-nez v1, :cond_22

    if-eqz v0, :cond_22

    const-string v1, "UTC"

    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    const/16 v0, 0x5a

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    :cond_22
    return-void
.end method

.method public writeTo(Ljava/lang/StringBuilder;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v0

    iget-boolean v2, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    invoke-static {p1, v0, v1, v2}, Lorg/dmfs/rfc5545/Instance;->writeTo(Ljava/lang/StringBuilder;JZ)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/DateTime;->mTimezone:Ljava/util/TimeZone;

    iget-boolean v1, p0, Lorg/dmfs/rfc5545/DateTime;->mAllday:Z

    if-nez v1, :cond_22

    if-eqz v0, :cond_22

    const-string v1, "UTC"

    invoke-virtual {v0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    const/16 v0, 0x5a

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_22
    return-void
.end method
