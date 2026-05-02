.class public Lorg/apache/commons/lang3/time/DateUtils;
.super Ljava/lang/Object;
.source "DateUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/time/DateUtils$DateIterator;,
        Lorg/apache/commons/lang3/time/DateUtils$ModifyType;
    }
.end annotation


# static fields
.field public static final MILLIS_PER_DAY:J = 0x5265c00L

.field public static final MILLIS_PER_HOUR:J = 0x36ee80L

.field public static final MILLIS_PER_MINUTE:J = 0xea60L

.field public static final MILLIS_PER_SECOND:J = 0x3e8L

.field public static final RANGE_MONTH_MONDAY:I = 0x6

.field public static final RANGE_MONTH_SUNDAY:I = 0x5

.field public static final RANGE_WEEK_CENTER:I = 0x4

.field public static final RANGE_WEEK_MONDAY:I = 0x2

.field public static final RANGE_WEEK_RELATIVE:I = 0x3

.field public static final RANGE_WEEK_SUNDAY:I = 0x1

.field public static final SEMI_MONTH:I = 0x3e9

.field private static final fields:[[I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 82
    const/16 v0, 0x8

    new-array v0, v0, [[I

    new-array v1, v4, [I

    const/16 v2, 0xe

    aput v2, v1, v3

    aput-object v1, v0, v3

    new-array v1, v4, [I

    const/16 v2, 0xd

    aput v2, v1, v3

    aput-object v1, v0, v4

    new-array v1, v4, [I

    const/16 v2, 0xc

    aput v2, v1, v3

    aput-object v1, v0, v5

    new-array v1, v5, [I

    fill-array-data v1, :array_48

    aput-object v1, v0, v6

    const/4 v1, 0x4

    new-array v2, v6, [I

    fill-array-data v2, :array_50

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-array v2, v5, [I

    fill-array-data v2, :array_5a

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v4, [I

    aput v4, v2, v3

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v4, [I

    aput v3, v2, v3

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/lang3/time/DateUtils;->fields:[[I

    return-void

    :array_48
    .array-data 4
        0xb
        0xa
    .end array-data

    :array_50
    .array-data 4
        0x5
        0x5
        0x9
    .end array-data

    :array_5a
    .array-data 4
        0x2
        0x3e9
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    return-void
.end method

.method private static add(Ljava/util/Date;II)Ljava/util/Date;
    .registers 6
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "calendarField"    # I
    .param p2, "amount"    # I

    .prologue
    .line 528
    if-nez p0, :cond_a

    .line 529
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 531
    :cond_a
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 532
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 533
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->add(II)V

    .line 534
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public static addDays(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 457
    const/4 v0, 0x5

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addHours(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 471
    const/16 v0, 0xb

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addMilliseconds(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 513
    const/16 v0, 0xe

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addMinutes(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 485
    const/16 v0, 0xc

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addMonths(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 429
    const/4 v0, 0x2

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addSeconds(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 499
    const/16 v0, 0xd

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addWeeks(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 443
    const/4 v0, 0x3

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static addYears(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 415
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->add(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static ceiling(Ljava/util/Calendar;I)Ljava/util/Calendar;
    .registers 5
    .param p0, "date"    # Ljava/util/Calendar;
    .param p1, "field"    # I

    .prologue
    .line 920
    if-nez p0, :cond_a

    .line 921
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 923
    :cond_a
    invoke-virtual {p0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    .line 924
    .local v0, "ceiled":Ljava/util/Calendar;
    sget-object v1, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->CEILING:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang3/time/DateUtils;->modify(Ljava/util/Calendar;ILorg/apache/commons/lang3/time/DateUtils$ModifyType;)V

    .line 925
    return-object v0
.end method

.method public static ceiling(Ljava/lang/Object;I)Ljava/util/Date;
    .registers 5
    .param p0, "date"    # Ljava/lang/Object;
    .param p1, "field"    # I

    .prologue
    .line 946
    if-nez p0, :cond_a

    .line 947
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 949
    :cond_a
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_15

    .line 950
    check-cast p0, Ljava/util/Date;

    .end local p0    # "date":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->ceiling(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    .line 952
    :goto_14
    return-object v0

    .line 951
    .restart local p0    # "date":Ljava/lang/Object;
    :cond_15
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_24

    .line 952
    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "date":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->ceiling(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    goto :goto_14

    .line 954
    .restart local p0    # "date":Ljava/lang/Object;
    :cond_24
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not find ceiling of for type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static ceiling(Ljava/util/Date;I)Ljava/util/Date;
    .registers 5
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "field"    # I

    .prologue
    .line 894
    if-nez p0, :cond_a

    .line 895
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 897
    :cond_a
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 898
    .local v0, "gval":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 899
    sget-object v1, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->CEILING:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang3/time/DateUtils;->modify(Ljava/util/Calendar;ILorg/apache/commons/lang3/time/DateUtils$ModifyType;)V

    .line 900
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method private static getFragment(Ljava/util/Calendar;ILjava/util/concurrent/TimeUnit;)J
    .registers 9
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 1678
    if-nez p0, :cond_a

    .line 1679
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The date must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1682
    :cond_a
    const-wide/16 v1, 0x0

    .line 1684
    .local v1, "result":J
    sget-object v3, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    if-ne p2, v3, :cond_36

    const/4 v0, 0x0

    .line 1687
    .local v0, "offset":I
    :goto_11
    packed-switch p1, :pswitch_data_90

    .line 1698
    :goto_14
    packed-switch p1, :pswitch_data_98

    .line 1718
    :pswitch_17
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "The fragment "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " is not supported"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1684
    .end local v0    # "offset":I
    :cond_36
    const/4 v0, 0x1

    goto :goto_11

    .line 1689
    .restart local v0    # "offset":I
    :pswitch_38
    const/4 v3, 0x6

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    sub-int/2addr v3, v0

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 1690
    goto :goto_14

    .line 1692
    :pswitch_47
    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    sub-int/2addr v3, v0

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 1693
    goto :goto_14

    .line 1706
    :pswitch_56
    const/16 v3, 0xb

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 1709
    :pswitch_64
    const/16 v3, 0xc

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 1712
    :pswitch_72
    const/16 v3, 0xd

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 1715
    :pswitch_80
    const/16 v3, 0xe

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 1720
    :pswitch_8e
    return-wide v1

    .line 1687
    nop

    :pswitch_data_90
    .packed-switch 0x1
        :pswitch_38
        :pswitch_47
    .end packed-switch

    .line 1698
    :pswitch_data_98
    .packed-switch 0x1
        :pswitch_56
        :pswitch_56
        :pswitch_17
        :pswitch_17
        :pswitch_56
        :pswitch_56
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_17
        :pswitch_64
        :pswitch_72
        :pswitch_80
        :pswitch_8e
    .end packed-switch
.end method

.method private static getFragment(Ljava/util/Date;ILjava/util/concurrent/TimeUnit;)J
    .registers 6
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 1658
    if-nez p0, :cond_a

    .line 1659
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1661
    :cond_a
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1662
    .local v0, "calendar":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 1663
    invoke-static {v0, p1, p2}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Calendar;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v1

    return-wide v1
.end method

.method public static getFragmentInDays(Ljava/util/Calendar;I)J
    .registers 4
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .prologue
    .line 1643
    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Calendar;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInDays(Ljava/util/Date;I)J
    .registers 4
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .prologue
    .line 1452
    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Date;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInHours(Ljava/util/Calendar;I)J
    .registers 4
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .prologue
    .line 1603
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Calendar;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInHours(Ljava/util/Date;I)J
    .registers 4
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .prologue
    .line 1414
    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Date;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMilliseconds(Ljava/util/Calendar;I)J
    .registers 4
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .prologue
    .line 1490
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Calendar;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMilliseconds(Ljava/util/Date;I)J
    .registers 4
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .prologue
    .line 1300
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Date;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMinutes(Ljava/util/Calendar;I)J
    .registers 4
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .prologue
    .line 1565
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Calendar;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInMinutes(Ljava/util/Date;I)J
    .registers 4
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .prologue
    .line 1376
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Date;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInSeconds(Ljava/util/Calendar;I)J
    .registers 4
    .param p0, "calendar"    # Ljava/util/Calendar;
    .param p1, "fragment"    # I

    .prologue
    .line 1527
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Calendar;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFragmentInSeconds(Ljava/util/Date;I)J
    .registers 4
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "fragment"    # I

    .prologue
    .line 1338
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/DateUtils;->getFragment(Ljava/util/Date;ILjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static isSameDay(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .registers 7
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;

    .prologue
    const/4 v4, 0x6

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 190
    if-eqz p0, :cond_7

    if-nez p1, :cond_f

    .line 191
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 193
    :cond_f
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_2e

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_2e

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_2e

    :goto_2d
    return v0

    :cond_2e
    move v0, v1

    goto :goto_2d
.end method

.method public static isSameDay(Ljava/util/Date;Ljava/util/Date;)Z
    .registers 6
    .param p0, "date1"    # Ljava/util/Date;
    .param p1, "date2"    # Ljava/util/Date;

    .prologue
    .line 166
    if-eqz p0, :cond_4

    if-nez p1, :cond_c

    .line 167
    :cond_4
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The date must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 169
    :cond_c
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 170
    .local v0, "cal1":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 171
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 172
    .local v1, "cal2":Ljava/util/Calendar;
    invoke-virtual {v1, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 173
    invoke-static {v0, v1}, Lorg/apache/commons/lang3/time/DateUtils;->isSameDay(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    move-result v2

    return v2
.end method

.method public static isSameInstant(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .registers 6
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;

    .prologue
    .line 229
    if-eqz p0, :cond_4

    if-nez p1, :cond_c

    .line 230
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 232
    :cond_c
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_22

    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method public static isSameInstant(Ljava/util/Date;Ljava/util/Date;)Z
    .registers 6
    .param p0, "date1"    # Ljava/util/Date;
    .param p1, "date2"    # Ljava/util/Date;

    .prologue
    .line 211
    if-eqz p0, :cond_4

    if-nez p1, :cond_c

    .line 212
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_c
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public static isSameLocalTime(Ljava/util/Calendar;Ljava/util/Calendar;)Z
    .registers 9
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;

    .prologue
    const/16 v6, 0xc

    const/16 v5, 0xb

    const/4 v4, 0x6

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 249
    if-eqz p0, :cond_b

    if-nez p1, :cond_13

    .line 250
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 252
    :cond_13
    const/16 v2, 0xe

    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/16 v3, 0xe

    invoke-virtual {p1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_6c

    const/16 v2, 0xd

    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/16 v3, 0xd

    invoke-virtual {p1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_6c

    invoke-virtual {p0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v6}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_6c

    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_6c

    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_6c

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_6c

    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v3

    if-ne v2, v3, :cond_6c

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_6c

    :goto_6b
    return v0

    :cond_6c
    move v0, v1

    goto :goto_6b
.end method

.method public static iterator(Ljava/lang/Object;I)Ljava/util/Iterator;
    .registers 5
    .param p0, "focus"    # Ljava/lang/Object;
    .param p1, "rangeStyle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I)",
            "Ljava/util/Iterator",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 1256
    if-nez p0, :cond_a

    .line 1257
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1259
    :cond_a
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_15

    .line 1260
    check-cast p0, Ljava/util/Date;

    .end local p0    # "focus":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->iterator(Ljava/util/Date;I)Ljava/util/Iterator;

    move-result-object v0

    .line 1262
    :goto_14
    return-object v0

    .line 1261
    .restart local p0    # "focus":Ljava/lang/Object;
    :cond_15
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_20

    .line 1262
    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "focus":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->iterator(Ljava/util/Calendar;I)Ljava/util/Iterator;

    move-result-object v0

    goto :goto_14

    .line 1264
    .restart local p0    # "focus":Ljava/lang/Object;
    :cond_20
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not iterate based on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static iterator(Ljava/util/Calendar;I)Ljava/util/Iterator;
    .registers 11
    .param p0, "focus"    # Ljava/util/Calendar;
    .param p1, "rangeStyle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Calendar;",
            "I)",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Calendar;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    const/4 v8, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x5

    const/4 v5, 0x7

    .line 1166
    if-nez p0, :cond_f

    .line 1167
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "The date must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1169
    :cond_f
    const/4 v2, 0x0

    .line 1170
    .local v2, "start":Ljava/util/Calendar;
    const/4 v0, 0x0

    .line 1171
    .local v0, "end":Ljava/util/Calendar;
    const/4 v3, 0x1

    .line 1172
    .local v3, "startCutoff":I
    const/4 v1, 0x7

    .line 1173
    .local v1, "endCutoff":I
    packed-switch p1, :pswitch_data_98

    .line 1216
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "The range style "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not valid."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1177
    :pswitch_35
    invoke-static {p0, v4}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v2

    .line 1179
    invoke-virtual {v2}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "end":Ljava/util/Calendar;
    check-cast v0, Ljava/util/Calendar;

    .line 1180
    .restart local v0    # "end":Ljava/util/Calendar;
    invoke-virtual {v0, v4, v7}, Ljava/util/Calendar;->add(II)V

    .line 1181
    invoke-virtual {v0, v6, v8}, Ljava/util/Calendar;->add(II)V

    .line 1183
    const/4 v4, 0x6

    if-ne p1, v4, :cond_4a

    .line 1184
    const/4 v3, 0x2

    .line 1185
    const/4 v1, 0x1

    .line 1218
    :cond_4a
    :goto_4a
    :pswitch_4a
    if-ge v3, v7, :cond_4e

    .line 1219
    add-int/lit8 v3, v3, 0x7

    .line 1221
    :cond_4e
    if-le v3, v5, :cond_52

    .line 1222
    add-int/lit8 v3, v3, -0x7

    .line 1224
    :cond_52
    if-ge v1, v7, :cond_56

    .line 1225
    add-int/lit8 v1, v1, 0x7

    .line 1227
    :cond_56
    if-le v1, v5, :cond_5a

    .line 1228
    add-int/lit8 v1, v1, -0x7

    .line 1230
    :cond_5a
    :goto_5a
    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    if-eq v4, v3, :cond_87

    .line 1231
    invoke-virtual {v2, v6, v8}, Ljava/util/Calendar;->add(II)V

    goto :goto_5a

    .line 1193
    :pswitch_64
    invoke-static {p0, v6}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v2

    .line 1194
    invoke-static {p0, v6}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    .line 1195
    packed-switch p1, :pswitch_data_a8

    goto :goto_4a

    .line 1200
    :pswitch_70
    const/4 v3, 0x2

    .line 1201
    const/4 v1, 0x1

    .line 1202
    goto :goto_4a

    .line 1204
    :pswitch_73
    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 1205
    add-int/lit8 v1, v3, -0x1

    .line 1206
    goto :goto_4a

    .line 1208
    :pswitch_7a
    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v3, v4, -0x3

    .line 1209
    invoke-virtual {p0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    add-int/lit8 v1, v4, 0x3

    .line 1210
    goto :goto_4a

    .line 1233
    :cond_87
    :goto_87
    invoke-virtual {v0, v5}, Ljava/util/Calendar;->get(I)I

    move-result v4

    if-eq v4, v1, :cond_91

    .line 1234
    invoke-virtual {v0, v6, v7}, Ljava/util/Calendar;->add(II)V

    goto :goto_87

    .line 1236
    :cond_91
    new-instance v4, Lorg/apache/commons/lang3/time/DateUtils$DateIterator;

    invoke-direct {v4, v2, v0}, Lorg/apache/commons/lang3/time/DateUtils$DateIterator;-><init>(Ljava/util/Calendar;Ljava/util/Calendar;)V

    return-object v4

    .line 1173
    nop

    :pswitch_data_98
    .packed-switch 0x1
        :pswitch_64
        :pswitch_64
        :pswitch_64
        :pswitch_64
        :pswitch_35
        :pswitch_35
    .end packed-switch

    .line 1195
    :pswitch_data_a8
    .packed-switch 0x1
        :pswitch_4a
        :pswitch_70
        :pswitch_73
        :pswitch_7a
    .end packed-switch
.end method

.method public static iterator(Ljava/util/Date;I)Ljava/util/Iterator;
    .registers 5
    .param p0, "focus"    # Ljava/util/Date;
    .param p1, "rangeStyle"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            "I)",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Calendar;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1133
    if-nez p0, :cond_a

    .line 1134
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1136
    :cond_a
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 1137
    .local v0, "gval":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 1138
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->iterator(Ljava/util/Calendar;I)Ljava/util/Iterator;

    move-result-object v1

    return-object v1
.end method

.method private static modify(Ljava/util/Calendar;ILorg/apache/commons/lang3/time/DateUtils$ModifyType;)V
    .registers 30
    .param p0, "val"    # Ljava/util/Calendar;
    .param p1, "field"    # I
    .param p2, "modType"    # Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    .prologue
    .line 968
    const/16 v23, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v23

    const v24, 0x10b07600

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_1b

    .line 969
    new-instance v23, Ljava/lang/ArithmeticException;

    const-string v24, "Calendar value too large for accurate calculations"

    invoke-direct/range {v23 .. v24}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 972
    :cond_1b
    const/16 v23, 0xe

    move/from16 v0, p1

    move/from16 v1, v23

    if-ne v0, v1, :cond_24

    .line 1051
    :cond_23
    :goto_23
    return-void

    .line 982
    :cond_24
    invoke-virtual/range {p0 .. p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v6

    .line 983
    .local v6, "date":Ljava/util/Date;
    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v21

    .line 984
    .local v21, "time":J
    const/4 v7, 0x0

    .line 987
    .local v7, "done":Z
    const/16 v23, 0xe

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v14

    .line 988
    .local v14, "millisecs":I
    sget-object v23, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->TRUNCATE:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    if-eq v0, v1, :cond_45

    const/16 v23, 0x1f4

    move/from16 v0, v23

    if-ge v14, v0, :cond_4a

    .line 989
    :cond_45
    int-to-long v0, v14

    move-wide/from16 v23, v0

    sub-long v21, v21, v23

    .line 991
    :cond_4a
    const/16 v23, 0xd

    move/from16 v0, p1

    move/from16 v1, v23

    if-ne v0, v1, :cond_53

    .line 992
    const/4 v7, 0x1

    .line 996
    :cond_53
    const/16 v23, 0xd

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v20

    .line 997
    .local v20, "seconds":I
    if-nez v7, :cond_7a

    sget-object v23, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->TRUNCATE:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    if-eq v0, v1, :cond_6f

    const/16 v23, 0x1e

    move/from16 v0, v20

    move/from16 v1, v23

    if-ge v0, v1, :cond_7a

    .line 998
    :cond_6f
    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide/16 v25, 0x3e8

    mul-long v23, v23, v25

    sub-long v21, v21, v23

    .line 1000
    :cond_7a
    const/16 v23, 0xc

    move/from16 v0, p1

    move/from16 v1, v23

    if-ne v0, v1, :cond_83

    .line 1001
    const/4 v7, 0x1

    .line 1005
    :cond_83
    const/16 v23, 0xc

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v16

    .line 1006
    .local v16, "minutes":I
    if-nez v7, :cond_ab

    sget-object v23, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->TRUNCATE:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    if-eq v0, v1, :cond_9f

    const/16 v23, 0x1e

    move/from16 v0, v16

    move/from16 v1, v23

    if-ge v0, v1, :cond_ab

    .line 1007
    :cond_9f
    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v23, v0

    const-wide/32 v25, 0xea60

    mul-long v23, v23, v25

    sub-long v21, v21, v23

    .line 1011
    :cond_ab
    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v23

    cmp-long v23, v23, v21

    if-eqz v23, :cond_bd

    .line 1012
    move-wide/from16 v0, v21

    invoke-virtual {v6, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 1013
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 1017
    :cond_bd
    const/16 v19, 0x0

    .line 1018
    .local v19, "roundUp":Z
    sget-object v4, Lorg/apache/commons/lang3/time/DateUtils;->fields:[[I

    .local v4, "arr$":[[I
    array-length v11, v4

    .local v11, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    move v10, v9

    .end local v4    # "arr$":[[I
    .end local v9    # "i$":I
    .end local v11    # "len$":I
    .local v10, "i$":I
    :goto_c4
    if-ge v10, v11, :cond_243

    aget-object v3, v4, v10

    .line 1019
    .local v3, "aField":[I
    move-object v5, v3

    .local v5, "arr$":[I
    array-length v12, v5

    .local v12, "len$":I
    const/4 v9, 0x0

    .end local v10    # "i$":I
    .restart local v9    # "i$":I
    :goto_cb
    if-ge v9, v12, :cond_17e

    aget v8, v5, v9

    .line 1020
    .local v8, "element":I
    move/from16 v0, p1

    if-ne v8, v0, :cond_17a

    .line 1022
    sget-object v23, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->CEILING:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    if-eq v0, v1, :cond_e5

    sget-object v23, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->ROUND:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_23

    if-eqz v19, :cond_23

    .line 1023
    :cond_e5
    const/16 v23, 0x3e9

    move/from16 v0, p1

    move/from16 v1, v23

    if-ne v0, v1, :cond_12a

    .line 1027
    const/16 v23, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v23

    const/16 v24, 0x1

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_10e

    .line 1028
    const/16 v23, 0x5

    const/16 v24, 0xf

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    goto/16 :goto_23

    .line 1030
    :cond_10e
    const/16 v23, 0x5

    const/16 v24, -0xf

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 1031
    const/16 v23, 0x2

    const/16 v24, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    goto/16 :goto_23

    .line 1034
    :cond_12a
    const/16 v23, 0x9

    move/from16 v0, p1

    move/from16 v1, v23

    if-ne v0, v1, :cond_169

    .line 1038
    const/16 v23, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v23

    if-nez v23, :cond_14d

    .line 1039
    const/16 v23, 0xb

    const/16 v24, 0xc

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    goto/16 :goto_23

    .line 1041
    :cond_14d
    const/16 v23, 0xb

    const/16 v24, -0xc

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 1042
    const/16 v23, 0x5

    const/16 v24, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    goto/16 :goto_23

    .line 1048
    :cond_169
    const/16 v23, 0x0

    aget v23, v3, v23

    const/16 v24, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    goto/16 :goto_23

    .line 1019
    :cond_17a
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_cb

    .line 1055
    .end local v8    # "element":I
    :cond_17e
    const/16 v17, 0x0

    .line 1056
    .local v17, "offset":I
    const/16 v18, 0x0

    .line 1058
    .local v18, "offsetSet":Z
    sparse-switch p1, :sswitch_data_266

    .line 1090
    :cond_185
    :goto_185
    if-nez v18, :cond_1b9

    .line 1091
    const/16 v23, 0x0

    aget v23, v3, v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->getActualMinimum(I)I

    move-result v15

    .line 1092
    .local v15, "min":I
    const/16 v23, 0x0

    aget v23, v3, v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->getActualMaximum(I)I

    move-result v13

    .line 1094
    .local v13, "max":I
    const/16 v23, 0x0

    aget v23, v3, v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v23

    sub-int v17, v23, v15

    .line 1096
    sub-int v23, v13, v15

    div-int/lit8 v23, v23, 0x2

    move/from16 v0, v17

    move/from16 v1, v23

    if-le v0, v1, :cond_23f

    const/16 v19, 0x1

    .line 1099
    .end local v13    # "max":I
    .end local v15    # "min":I
    :cond_1b9
    :goto_1b9
    if-eqz v17, :cond_1d6

    .line 1100
    const/16 v23, 0x0

    aget v23, v3, v23

    const/16 v24, 0x0

    aget v24, v3, v24

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v24

    sub-int v24, v24, v17

    move-object/from16 v0, p0

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 1018
    :cond_1d6
    add-int/lit8 v9, v10, 0x1

    move v10, v9

    .end local v9    # "i$":I
    .restart local v10    # "i$":I
    goto/16 :goto_c4

    .line 1060
    .end local v10    # "i$":I
    .restart local v9    # "i$":I
    :sswitch_1db
    const/16 v23, 0x0

    aget v23, v3, v23

    const/16 v24, 0x5

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_185

    .line 1064
    const/16 v23, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v23

    add-int/lit8 v17, v23, -0x1

    .line 1067
    const/16 v23, 0xf

    move/from16 v0, v17

    move/from16 v1, v23

    if-lt v0, v1, :cond_1fd

    .line 1068
    add-int/lit8 v17, v17, -0xf

    .line 1071
    :cond_1fd
    const/16 v23, 0x7

    move/from16 v0, v17

    move/from16 v1, v23

    if-le v0, v1, :cond_20b

    const/16 v19, 0x1

    .line 1072
    :goto_207
    const/16 v18, 0x1

    goto/16 :goto_185

    .line 1071
    :cond_20b
    const/16 v19, 0x0

    goto :goto_207

    .line 1076
    :sswitch_20e
    const/16 v23, 0x0

    aget v23, v3, v23

    const/16 v24, 0xb

    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_185

    .line 1079
    const/16 v23, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v17

    .line 1080
    const/16 v23, 0xc

    move/from16 v0, v17

    move/from16 v1, v23

    if-lt v0, v1, :cond_22e

    .line 1081
    add-int/lit8 v17, v17, -0xc

    .line 1083
    :cond_22e
    const/16 v23, 0x6

    move/from16 v0, v17

    move/from16 v1, v23

    if-lt v0, v1, :cond_23c

    const/16 v19, 0x1

    .line 1084
    :goto_238
    const/16 v18, 0x1

    goto/16 :goto_185

    .line 1083
    :cond_23c
    const/16 v19, 0x0

    goto :goto_238

    .line 1096
    .restart local v13    # "max":I
    .restart local v15    # "min":I
    :cond_23f
    const/16 v19, 0x0

    goto/16 :goto_1b9

    .line 1103
    .end local v3    # "aField":[I
    .end local v5    # "arr$":[I
    .end local v9    # "i$":I
    .end local v12    # "len$":I
    .end local v13    # "max":I
    .end local v15    # "min":I
    .end local v17    # "offset":I
    .end local v18    # "offsetSet":Z
    .restart local v10    # "i$":I
    :cond_243
    new-instance v23, Ljava/lang/IllegalArgumentException;

    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "The field "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, " is not supported"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-direct/range {v23 .. v24}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v23

    .line 1058
    :sswitch_data_266
    .sparse-switch
        0x9 -> :sswitch_20e
        0x3e9 -> :sswitch_1db
    .end sparse-switch
.end method

.method public static varargs parseDate(Ljava/lang/String;Ljava/util/Locale;[Ljava/lang/String;)Ljava/util/Date;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "parsePatterns"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 301
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/time/DateUtils;->parseDateWithLeniency(Ljava/lang/String;Ljava/util/Locale;[Ljava/lang/String;Z)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseDate(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "parsePatterns"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 278
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->parseDate(Ljava/lang/String;Ljava/util/Locale;[Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseDateStrictly(Ljava/lang/String;Ljava/util/Locale;[Ljava/lang/String;)Ljava/util/Date;
    .registers 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "parsePatterns"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 343
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, v0, p2, v1}, Lorg/apache/commons/lang3/time/DateUtils;->parseDateWithLeniency(Ljava/lang/String;Ljava/util/Locale;[Ljava/lang/String;Z)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static varargs parseDateStrictly(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Date;
    .registers 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "parsePatterns"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 321
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->parseDateStrictly(Ljava/lang/String;Ljava/util/Locale;[Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method private static parseDateWithLeniency(Ljava/lang/String;Ljava/util/Locale;[Ljava/lang/String;Z)Ljava/util/Date;
    .registers 16
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "locale"    # Ljava/util/Locale;
    .param p2, "parsePatterns"    # [Ljava/lang/String;
    .param p3, "lenient"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 365
    if-eqz p0, :cond_5

    if-nez p2, :cond_d

    .line 366
    :cond_5
    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "Date and Patterns must not be null"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 370
    :cond_d
    if-nez p1, :cond_5e

    .line 371
    new-instance v5, Ljava/text/SimpleDateFormat;

    invoke-direct {v5}, Ljava/text/SimpleDateFormat;-><init>()V

    .line 376
    .local v5, "parser":Ljava/text/SimpleDateFormat;
    :goto_14
    invoke-virtual {v5, p3}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    .line 377
    new-instance v7, Ljava/text/ParsePosition;

    invoke-direct {v7, v11}, Ljava/text/ParsePosition;-><init>(I)V

    .line 378
    .local v7, "pos":Ljava/text/ParsePosition;
    move-object v0, p2

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1f
    if-ge v2, v3, :cond_69

    aget-object v4, v0, v2

    .line 380
    .local v4, "parsePattern":Ljava/lang/String;
    move-object v6, v4

    .line 383
    .local v6, "pattern":Ljava/lang/String;
    const-string v9, "ZZ"

    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_36

    .line 384
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v6, v11, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 387
    :cond_36
    invoke-virtual {v5, v6}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    .line 388
    invoke-virtual {v7, v11}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 390
    move-object v8, p0

    .line 392
    .local v8, "str2":Ljava/lang/String;
    const-string v9, "ZZ"

    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 393
    const-string v9, "([-+][0-9][0-9]):([0-9][0-9])$"

    const-string v10, "$1$2"

    invoke-virtual {p0, v9, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 396
    :cond_4d
    invoke-virtual {v5, v8, v7}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v1

    .line 397
    .local v1, "date":Ljava/util/Date;
    if-eqz v1, :cond_66

    invoke-virtual {v7}, Ljava/text/ParsePosition;->getIndex()I

    move-result v9

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v10

    if-ne v9, v10, :cond_66

    .line 398
    return-object v1

    .line 373
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "date":Ljava/util/Date;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "parsePattern":Ljava/lang/String;
    .end local v5    # "parser":Ljava/text/SimpleDateFormat;
    .end local v6    # "pattern":Ljava/lang/String;
    .end local v7    # "pos":Ljava/text/ParsePosition;
    .end local v8    # "str2":Ljava/lang/String;
    :cond_5e
    new-instance v5, Ljava/text/SimpleDateFormat;

    const-string v9, ""

    invoke-direct {v5, v9, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .restart local v5    # "parser":Ljava/text/SimpleDateFormat;
    goto :goto_14

    .line 378
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "date":Ljava/util/Date;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "parsePattern":Ljava/lang/String;
    .restart local v6    # "pattern":Ljava/lang/String;
    .restart local v7    # "pos":Ljava/text/ParsePosition;
    .restart local v8    # "str2":Ljava/lang/String;
    :cond_66
    add-int/lit8 v2, v2, 0x1

    goto :goto_1f

    .line 401
    .end local v1    # "date":Ljava/util/Date;
    .end local v4    # "parsePattern":Ljava/lang/String;
    .end local v6    # "pattern":Ljava/lang/String;
    .end local v8    # "str2":Ljava/lang/String;
    :cond_69
    new-instance v9, Ljava/text/ParseException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unable to parse the date: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, -0x1

    invoke-direct {v9, v10, v11}, Ljava/text/ParseException;-><init>(Ljava/lang/String;I)V

    throw v9
.end method

.method public static round(Ljava/util/Calendar;I)Ljava/util/Calendar;
    .registers 5
    .param p0, "date"    # Ljava/util/Calendar;
    .param p1, "field"    # I

    .prologue
    .line 748
    if-nez p0, :cond_a

    .line 749
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 751
    :cond_a
    invoke-virtual {p0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    .line 752
    .local v0, "rounded":Ljava/util/Calendar;
    sget-object v1, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->ROUND:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang3/time/DateUtils;->modify(Ljava/util/Calendar;ILorg/apache/commons/lang3/time/DateUtils$ModifyType;)V

    .line 753
    return-object v0
.end method

.method public static round(Ljava/lang/Object;I)Ljava/util/Date;
    .registers 5
    .param p0, "date"    # Ljava/lang/Object;
    .param p1, "field"    # I

    .prologue
    .line 785
    if-nez p0, :cond_a

    .line 786
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 788
    :cond_a
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_15

    .line 789
    check-cast p0, Ljava/util/Date;

    .end local p0    # "date":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->round(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    .line 791
    :goto_14
    return-object v0

    .line 790
    .restart local p0    # "date":Ljava/lang/Object;
    :cond_15
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_24

    .line 791
    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "date":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->round(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    goto :goto_14

    .line 793
    .restart local p0    # "date":Ljava/lang/Object;
    :cond_24
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not round "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static round(Ljava/util/Date;I)Ljava/util/Date;
    .registers 5
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "field"    # I

    .prologue
    .line 711
    if-nez p0, :cond_a

    .line 712
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 714
    :cond_a
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 715
    .local v0, "gval":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 716
    sget-object v1, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->ROUND:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang3/time/DateUtils;->modify(Ljava/util/Calendar;ILorg/apache/commons/lang3/time/DateUtils$ModifyType;)V

    .line 717
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method private static set(Ljava/util/Date;II)Ljava/util/Date;
    .registers 6
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "calendarField"    # I
    .param p2, "amount"    # I

    .prologue
    .line 657
    if-nez p0, :cond_a

    .line 658
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 661
    :cond_a
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 662
    .local v0, "c":Ljava/util/Calendar;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setLenient(Z)V

    .line 663
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 664
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->set(II)V

    .line 665
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public static setDays(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 579
    const/4 v0, 0x5

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setHours(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 595
    const/16 v0, 0xb

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setMilliseconds(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 640
    const/16 v0, 0xe

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setMinutes(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 610
    const/16 v0, 0xc

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setMonths(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 564
    const/4 v0, 0x2

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setSeconds(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 625
    const/16 v0, 0xd

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static setYears(Ljava/util/Date;I)Ljava/util/Date;
    .registers 3
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "amount"    # I

    .prologue
    .line 549
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->set(Ljava/util/Date;II)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method public static toCalendar(Ljava/util/Date;)Ljava/util/Calendar;
    .registers 2
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 678
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 679
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 680
    return-object v0
.end method

.method public static truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;
    .registers 5
    .param p0, "date"    # Ljava/util/Calendar;
    .param p1, "field"    # I

    .prologue
    .line 839
    if-nez p0, :cond_a

    .line 840
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 842
    :cond_a
    invoke-virtual {p0}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    .line 843
    .local v0, "truncated":Ljava/util/Calendar;
    sget-object v1, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->TRUNCATE:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang3/time/DateUtils;->modify(Ljava/util/Calendar;ILorg/apache/commons/lang3/time/DateUtils$ModifyType;)V

    .line 844
    return-object v0
.end method

.method public static truncate(Ljava/lang/Object;I)Ljava/util/Date;
    .registers 5
    .param p0, "date"    # Ljava/lang/Object;
    .param p1, "field"    # I

    .prologue
    .line 864
    if-nez p0, :cond_a

    .line 865
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The date must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 867
    :cond_a
    instance-of v0, p0, Ljava/util/Date;

    if-eqz v0, :cond_15

    .line 868
    check-cast p0, Ljava/util/Date;

    .end local p0    # "date":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    .line 870
    :goto_14
    return-object v0

    .line 869
    .restart local p0    # "date":Ljava/lang/Object;
    :cond_15
    instance-of v0, p0, Ljava/util/Calendar;

    if-eqz v0, :cond_24

    .line 870
    check-cast p0, Ljava/util/Calendar;

    .end local p0    # "date":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    goto :goto_14

    .line 872
    .restart local p0    # "date":Ljava/lang/Object;
    :cond_24
    new-instance v0, Ljava/lang/ClassCastException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not truncate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static truncate(Ljava/util/Date;I)Ljava/util/Date;
    .registers 5
    .param p0, "date"    # Ljava/util/Date;
    .param p1, "field"    # I

    .prologue
    .line 814
    if-nez p0, :cond_a

    .line 815
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "The date must not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 817
    :cond_a
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 818
    .local v0, "gval":Ljava/util/Calendar;
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 819
    sget-object v1, Lorg/apache/commons/lang3/time/DateUtils$ModifyType;->TRUNCATE:Lorg/apache/commons/lang3/time/DateUtils$ModifyType;

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang3/time/DateUtils;->modify(Ljava/util/Calendar;ILorg/apache/commons/lang3/time/DateUtils$ModifyType;)V

    .line 820
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    return-object v1
.end method

.method public static truncatedCompareTo(Ljava/util/Calendar;Ljava/util/Calendar;I)I
    .registers 6
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;
    .param p2, "field"    # I

    .prologue
    .line 1772
    invoke-static {p0, p2}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v0

    .line 1773
    .local v0, "truncatedCal1":Ljava/util/Calendar;
    invoke-static {p1, p2}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Calendar;I)Ljava/util/Calendar;

    move-result-object v1

    .line 1774
    .local v1, "truncatedCal2":Ljava/util/Calendar;
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->compareTo(Ljava/util/Calendar;)I

    move-result v2

    return v2
.end method

.method public static truncatedCompareTo(Ljava/util/Date;Ljava/util/Date;I)I
    .registers 6
    .param p0, "date1"    # Ljava/util/Date;
    .param p1, "date2"    # Ljava/util/Date;
    .param p2, "field"    # I

    .prologue
    .line 1792
    invoke-static {p0, p2}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v0

    .line 1793
    .local v0, "truncatedDate1":Ljava/util/Date;
    invoke-static {p1, p2}, Lorg/apache/commons/lang3/time/DateUtils;->truncate(Ljava/util/Date;I)Ljava/util/Date;

    move-result-object v1

    .line 1794
    .local v1, "truncatedDate2":Ljava/util/Date;
    invoke-virtual {v0, v1}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    move-result v2

    return v2
.end method

.method public static truncatedEquals(Ljava/util/Calendar;Ljava/util/Calendar;I)Z
    .registers 4
    .param p0, "cal1"    # Ljava/util/Calendar;
    .param p1, "cal2"    # Ljava/util/Calendar;
    .param p2, "field"    # I

    .prologue
    .line 1737
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/time/DateUtils;->truncatedCompareTo(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static truncatedEquals(Ljava/util/Date;Ljava/util/Date;I)Z
    .registers 4
    .param p0, "date1"    # Ljava/util/Date;
    .param p1, "date2"    # Ljava/util/Date;
    .param p2, "field"    # I

    .prologue
    .line 1754
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/time/DateUtils;->truncatedCompareTo(Ljava/util/Date;Ljava/util/Date;I)I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
