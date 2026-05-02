.class public Lch/qos/logback/core/rolling/helper/RollingCalendar;
.super Ljava/util/GregorianCalendar;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/rolling/helper/RollingCalendar$1;
    }
.end annotation


# static fields
.field static final GMT_TIMEZONE:Ljava/util/TimeZone;

.field private static final serialVersionUID:J = -0x52665f1df0505bb1L


# instance fields
.field periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "GMT"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->GMT_TIMEZONE:Ljava/util/TimeZone;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/util/GregorianCalendar;-><init>()V

    sget-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ERRONEOUS:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    iput-object v0, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    return-void
.end method

.method public constructor <init>(Ljava/util/TimeZone;Ljava/util/Locale;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    sget-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ERRONEOUS:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    iput-object v0, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    return-void
.end method

.method public static diffInMonths(JJ)I
    .registers 9

    const/4 v4, 0x2

    const/4 v3, 0x1

    cmp-long v0, p0, p2

    if-lez v0, :cond_e

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "startTime cannot be larger than endTime"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {v0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v0

    sub-int v0, v1, v0

    mul-int/lit8 v1, v2, 0xc

    add-int/2addr v0, v1

    return v0
.end method

.method private setPeriodicityType(Lch/qos/logback/core/rolling/helper/PeriodicityType;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    return-void
.end method


# virtual methods
.method public computePeriodicityType(Ljava/lang/String;)Lch/qos/logback/core/rolling/helper/PeriodicityType;
    .registers 13

    new-instance v2, Lch/qos/logback/core/rolling/helper/RollingCalendar;

    sget-object v0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->GMT_TIMEZONE:Ljava/util/TimeZone;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Lch/qos/logback/core/rolling/helper/RollingCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    new-instance v3, Ljava/util/Date;

    const-wide/16 v0, 0x0

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    if-eqz p1, :cond_4a

    sget-object v4, Lch/qos/logback/core/rolling/helper/PeriodicityType;->VALID_ORDERED_LIST:[Lch/qos/logback/core/rolling/helper/PeriodicityType;

    array-length v5, v4

    const/4 v0, 0x0

    move v1, v0

    :goto_19
    if-ge v1, v5, :cond_4a

    aget-object v0, v4, v1

    new-instance v6, Ljava/text/SimpleDateFormat;

    invoke-direct {v6, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sget-object v7, Lch/qos/logback/core/rolling/helper/RollingCalendar;->GMT_TIMEZONE:Ljava/util/TimeZone;

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v6, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v2, v0}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->setPeriodicityType(Lch/qos/logback/core/rolling/helper/PeriodicityType;)V

    new-instance v8, Ljava/util/Date;

    invoke-virtual {v2, v3}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->getNextTriggeringMillis(Ljava/util/Date;)J

    move-result-wide v9

    invoke-direct {v8, v9, v10}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v6, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    if-eqz v7, :cond_46

    if-eqz v6, :cond_46

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_46

    :goto_45
    return-object v0

    :cond_46
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_19

    :cond_4a
    sget-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ERRONEOUS:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    goto :goto_45
.end method

.method public getNextTriggeringDate(Ljava/util/Date;)Ljava/util/Date;
    .registers 3

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->getRelativeDate(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public getNextTriggeringMillis(Ljava/util/Date;)J
    .registers 4

    invoke-virtual {p0, p1}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->getNextTriggeringDate(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public getPeriodicityType()Lch/qos/logback/core/rolling/helper/PeriodicityType;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    return-object v0
.end method

.method public getRelativeDate(Ljava/util/Date;I)Ljava/util/Date;
    .registers 10

    const/16 v6, 0xb

    const/16 v5, 0xc

    const/16 v4, 0xd

    const/16 v3, 0xe

    const/4 v2, 0x0

    invoke-virtual {p0, p1}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->setTime(Ljava/util/Date;)V

    sget-object v0, Lch/qos/logback/core/rolling/helper/RollingCalendar$1;->$SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType:[I

    iget-object v1, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    invoke-virtual {v1}, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_88

    :pswitch_19
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unknown periodicity type."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_21
    invoke-virtual {p0, v3, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->add(II)V

    :goto_24
    invoke-virtual {p0}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->getTime()Ljava/util/Date;

    move-result-object v0

    return-object v0

    :pswitch_29
    invoke-virtual {p0, v3, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v4, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->add(II)V

    goto :goto_24

    :pswitch_30
    invoke-virtual {p0, v4, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v3, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v5, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->add(II)V

    goto :goto_24

    :pswitch_3a
    invoke-virtual {p0, v5, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v4, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v3, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v6, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->add(II)V

    goto :goto_24

    :pswitch_47
    invoke-virtual {p0, v6, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v5, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v4, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v3, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    const/4 v0, 0x5

    invoke-virtual {p0, v0, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->add(II)V

    goto :goto_24

    :pswitch_58
    const/4 v0, 0x7

    invoke-virtual {p0}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->getFirstDayOfWeek()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v6, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v5, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v4, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v3, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->add(II)V

    goto :goto_24

    :pswitch_71
    const/4 v0, 0x5

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v6, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v5, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v4, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    invoke-virtual {p0, v3, v2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->set(II)V

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p2}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->add(II)V

    goto :goto_24

    nop

    :pswitch_data_88
    .packed-switch 0x1
        :pswitch_21
        :pswitch_29
        :pswitch_30
        :pswitch_3a
        :pswitch_19
        :pswitch_47
        :pswitch_58
        :pswitch_71
    .end packed-switch
.end method

.method public init(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0, p1}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->computePeriodicityType(Ljava/lang/String;)Lch/qos/logback/core/rolling/helper/PeriodicityType;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    return-void
.end method

.method public periodsElapsed(JJ)J
    .registers 9

    cmp-long v0, p1, p3

    if-lez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Start cannot come before end"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    sub-long v0, p3, p1

    sget-object v2, Lch/qos/logback/core/rolling/helper/RollingCalendar$1;->$SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType:[I

    iget-object v3, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    invoke-virtual {v3}, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_44

    :pswitch_1b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unknown periodicity type."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_23
    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    :goto_26
    :pswitch_26
    return-wide v0

    :pswitch_27
    const-wide/32 v2, 0xea60

    div-long/2addr v0, v2

    goto :goto_26

    :pswitch_2c
    long-to-int v0, v0

    const v1, 0x36ee80

    div-int/2addr v0, v1

    int-to-long v0, v0

    goto :goto_26

    :pswitch_33
    const-wide/32 v2, 0x5265c00

    div-long/2addr v0, v2

    goto :goto_26

    :pswitch_38
    const-wide/32 v2, 0x240c8400

    div-long/2addr v0, v2

    goto :goto_26

    :pswitch_3d
    invoke-static {p1, p2, p3, p4}, Lch/qos/logback/core/rolling/helper/RollingCalendar;->diffInMonths(JJ)I

    move-result v0

    int-to-long v0, v0

    goto :goto_26

    nop

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_26
        :pswitch_23
        :pswitch_27
        :pswitch_2c
        :pswitch_1b
        :pswitch_33
        :pswitch_38
        :pswitch_3d
    .end packed-switch
.end method

.method public printPeriodicity(Lch/qos/logback/core/spi/ContextAwareBase;)V
    .registers 4

    sget-object v0, Lch/qos/logback/core/rolling/helper/RollingCalendar$1;->$SwitchMap$ch$qos$logback$core$rolling$helper$PeriodicityType:[I

    iget-object v1, p0, Lch/qos/logback/core/rolling/helper/RollingCalendar;->periodicityType:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    invoke-virtual {v1}, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_44

    const-string v0, "Unknown periodicity."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    :goto_12
    return-void

    :pswitch_13
    const-string v0, "Roll-over every millisecond."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    :pswitch_19
    const-string v0, "Roll-over every second."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    :pswitch_1f
    const-string v0, "Roll-over every minute."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    :pswitch_25
    const-string v0, "Roll-over at the top of every hour."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    :pswitch_2b
    const-string v0, "Roll-over at midday and midnight."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    :pswitch_31
    const-string v0, "Roll-over at midnight."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    :pswitch_37
    const-string v0, "Rollover at the start of week."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    :pswitch_3d
    const-string v0, "Rollover at start of every month."

    invoke-virtual {p1, v0}, Lch/qos/logback/core/spi/ContextAwareBase;->addInfo(Ljava/lang/String;)V

    goto :goto_12

    nop

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_13
        :pswitch_19
        :pswitch_1f
        :pswitch_25
        :pswitch_2b
        :pswitch_31
        :pswitch_37
        :pswitch_3d
    .end packed-switch
.end method
