.class public Lorg/apache/commons/lang3/time/FastDatePrinter;
.super Ljava/lang/Object;
.source "FastDatePrinter.java"

# interfaces
.implements Lorg/apache/commons/lang3/time/DatePrinter;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneDisplayKey;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNumberRule;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNameRule;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TwentyFourHourField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TwelveHourField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitMonthField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitYearField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitNumberField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedMonthField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$StringLiteral;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$CharacterLiteral;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;,
        Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    }
.end annotation


# static fields
.field public static final FULL:I = 0x0

.field public static final LONG:I = 0x1

.field public static final MEDIUM:I = 0x2

.field public static final SHORT:I = 0x3

.field private static final cTimeZoneDisplayCache:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneDisplayKey;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final mLocale:Ljava/util/Locale;

.field private transient mMaxLengthEstimate:I

.field private final mPattern:Ljava/lang/String;

.field private transient mRules:[Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;

.field private final mTimeZone:Ljava/util/TimeZone;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 1088
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->cTimeZoneDisplayCache:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "timeZone"    # Ljava/util/TimeZone;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    iput-object p1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    .line 139
    iput-object p2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    .line 140
    iput-object p3, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    .line 142
    invoke-direct {p0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->init()V

    .line 143
    return-void
.end method

.method private applyRulesToString(Ljava/util/Calendar;)Ljava/lang/String;
    .registers 4
    .param p1, "c"    # Ljava/util/Calendar;

    .prologue
    .line 409
    new-instance v0, Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mMaxLengthEstimate:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getTimeZoneDisplay(Ljava/util/TimeZone;ZILjava/util/Locale;)Ljava/lang/String;
    .registers 8
    .param p0, "tz"    # Ljava/util/TimeZone;
    .param p1, "daylight"    # Z
    .param p2, "style"    # I
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 1100
    new-instance v0, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneDisplayKey;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneDisplayKey;-><init>(Ljava/util/TimeZone;ZILjava/util/Locale;)V

    .line 1101
    .local v0, "key":Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneDisplayKey;
    sget-object v3, Lorg/apache/commons/lang3/time/FastDatePrinter;->cTimeZoneDisplayCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v0}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1102
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_1e

    .line 1104
    invoke-virtual {p0, p1, p2, p3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    .line 1105
    sget-object v3, Lorg/apache/commons/lang3/time/FastDatePrinter;->cTimeZoneDisplayCache:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v0, v2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1106
    .local v1, "prior":Ljava/lang/String;
    if-eqz v1, :cond_1e

    .line 1107
    move-object v2, v1

    .line 1110
    .end local v1    # "prior":Ljava/lang/String;
    :cond_1e
    return-object v2
.end method

.method private init()V
    .registers 5

    .prologue
    .line 149
    invoke-virtual {p0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->parsePattern()Ljava/util/List;

    move-result-object v2

    .line 150
    .local v2, "rulesList":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;

    iput-object v3, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mRules:[Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;

    .line 152
    const/4 v1, 0x0

    .line 153
    .local v1, "len":I
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mRules:[Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;

    array-length v0, v3

    .local v0, "i":I
    :goto_16
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_24

    .line 154
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mRules:[Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;

    aget-object v3, v3, v0

    invoke-interface {v3}, Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;->estimateLength()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_16

    .line 157
    :cond_24
    iput v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mMaxLengthEstimate:I

    .line 158
    return-void
.end method

.method private newCalendar()Ljava/util/GregorianCalendar;
    .registers 4

    .prologue
    .line 418
    new-instance v0, Ljava/util/GregorianCalendar;

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 2
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 569
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 570
    invoke-direct {p0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->init()V

    .line 571
    return-void
.end method


# virtual methods
.method protected applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .registers 7
    .param p1, "calendar"    # Ljava/util/Calendar;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 474
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mRules:[Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;

    .local v0, "arr$":[Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v2, :cond_e

    aget-object v3, v0, v1

    .line 475
    .local v3, "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    invoke-interface {v3, p2, p1}, Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;->appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V

    .line 474
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 477
    .end local v3    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_e
    return-object p2
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 529
    instance-of v2, p1, Lorg/apache/commons/lang3/time/FastDatePrinter;

    if-nez v2, :cond_6

    .line 533
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 532
    check-cast v0, Lorg/apache/commons/lang3/time/FastDatePrinter;

    .line 533
    .local v0, "other":Lorg/apache/commons/lang3/time/FastDatePrinter;
    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public format(J)Ljava/lang/String;
    .registers 5
    .param p1, "millis"    # J

    .prologue
    .line 398
    invoke-direct {p0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->newCalendar()Ljava/util/GregorianCalendar;

    move-result-object v0

    .line 399
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 400
    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->applyRulesToString(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public format(Ljava/util/Calendar;)Ljava/lang/String;
    .registers 4
    .param p1, "calendar"    # Ljava/util/Calendar;

    .prologue
    .line 436
    new-instance v0, Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mMaxLengthEstimate:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;)Ljava/lang/String;
    .registers 4
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 426
    invoke-direct {p0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->newCalendar()Ljava/util/GregorianCalendar;

    move-result-object v0

    .line 427
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 428
    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->applyRulesToString(Ljava/util/Calendar;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public format(JLjava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .registers 5
    .param p1, "millis"    # J
    .param p3, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 444
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0, p3}, Lorg/apache/commons/lang3/time/FastDatePrinter;->format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "toAppendTo"    # Ljava/lang/StringBuffer;
    .param p3, "pos"    # Ljava/text/FieldPosition;

    .prologue
    .line 381
    instance-of v0, p1, Ljava/util/Date;

    if-eqz v0, :cond_b

    .line 382
    check-cast p1, Ljava/util/Date;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 386
    :goto_a
    return-object v0

    .line 383
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_b
    instance-of v0, p1, Ljava/util/Calendar;

    if-eqz v0, :cond_16

    .line 384
    check-cast p1, Ljava/util/Calendar;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_a

    .line 385
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_16
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_25

    .line 386
    check-cast p1, Ljava/lang/Long;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->format(JLjava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_a

    .line 388
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_25
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown class: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-nez p1, :cond_42

    const-string v0, "<null>"

    :goto_36
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_42
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_36
.end method

.method public format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .registers 4
    .param p1, "calendar"    # Ljava/util/Calendar;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 462
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "buf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 452
    invoke-direct {p0}, Lorg/apache/commons/lang3/time/FastDatePrinter;->newCalendar()Ljava/util/GregorianCalendar;

    move-result-object v0

    .line 453
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 454
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v1

    return-object v1
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 503
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    return-object v0
.end method

.method public getMaxLengthEstimate()I
    .registers 2

    .prologue
    .line 516
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mMaxLengthEstimate:I

    return v0
.end method

.method public getPattern()Ljava/lang/String;
    .registers 2

    .prologue
    .line 487
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .registers 2

    .prologue
    .line 495
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 545
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->hashCode()I

    move-result v2

    mul-int/lit8 v2, v2, 0xd

    add-int/2addr v1, v2

    mul-int/lit8 v1, v1, 0xd

    add-int/2addr v0, v1

    return v0
.end method

.method protected parsePattern()Ljava/util/List;
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 169
    new-instance v15, Ljava/text/DateFormatSymbols;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 170
    .local v15, "symbols":Ljava/text/DateFormatSymbols;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v11, "rules":Ljava/util/List;, "Ljava/util/List<Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;>;"
    invoke-virtual {v15}, Ljava/text/DateFormatSymbols;->getEras()[Ljava/lang/String;

    move-result-object v4

    .line 173
    .local v4, "ERAs":[Ljava/lang/String;
    invoke-virtual {v15}, Ljava/text/DateFormatSymbols;->getMonths()[Ljava/lang/String;

    move-result-object v9

    .line 174
    .local v9, "months":[Ljava/lang/String;
    invoke-virtual {v15}, Ljava/text/DateFormatSymbols;->getShortMonths()[Ljava/lang/String;

    move-result-object v12

    .line 175
    .local v12, "shortMonths":[Ljava/lang/String;
    invoke-virtual {v15}, Ljava/text/DateFormatSymbols;->getWeekdays()[Ljava/lang/String;

    move-result-object v18

    .line 176
    .local v18, "weekdays":[Ljava/lang/String;
    invoke-virtual {v15}, Ljava/text/DateFormatSymbols;->getShortWeekdays()[Ljava/lang/String;

    move-result-object v13

    .line 177
    .local v13, "shortWeekdays":[Ljava/lang/String;
    invoke-virtual {v15}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v3

    .line 179
    .local v3, "AmPmStrings":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v8

    .line 180
    .local v8, "length":I
    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v7, v0, [I

    .line 182
    .local v7, "indexRef":[I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3b
    if-ge v6, v8, :cond_59

    .line 183
    const/16 v19, 0x0

    aput v6, v7, v19

    .line 184
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Lorg/apache/commons/lang3/time/FastDatePrinter;->parseToken(Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v16

    .line 185
    .local v16, "token":Ljava/lang/String;
    const/16 v19, 0x0

    aget v6, v7, v19

    .line 187
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v17

    .line 188
    .local v17, "tokenLen":I
    if-nez v17, :cond_5a

    .line 288
    .end local v16    # "token":Ljava/lang/String;
    .end local v17    # "tokenLen":I
    :cond_59
    return-object v11

    .line 193
    .restart local v16    # "token":Ljava/lang/String;
    .restart local v17    # "tokenLen":I
    :cond_5a
    const/16 v19, 0x0

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 195
    .local v5, "c":C
    sparse-switch v5, :sswitch_data_23c

    .line 282
    new-instance v19, Ljava/lang/IllegalArgumentException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Illegal pattern component: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 197
    :sswitch_84
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;

    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-direct {v10, v0, v4}, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;-><init>(I[Ljava/lang/String;)V

    .line 285
    .end local v17    # "tokenLen":I
    .local v10, "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :goto_8d
    invoke-interface {v11, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 182
    add-int/lit8 v6, v6, 0x1

    goto :goto_3b

    .line 200
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    .restart local v17    # "tokenLen":I
    :sswitch_93
    const/16 v19, 0x2

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_9e

    .line 201
    sget-object v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitYearField;->INSTANCE:Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitYearField;

    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 203
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_9e
    const/16 v19, 0x1

    const/16 v20, 0x4

    move/from16 v0, v17

    move/from16 v1, v20

    if-ge v0, v1, :cond_aa

    const/16 v17, 0x4

    .end local v17    # "tokenLen":I
    :cond_aa
    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 205
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 207
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    .restart local v17    # "tokenLen":I
    :sswitch_b5
    const/16 v19, 0x4

    move/from16 v0, v17

    move/from16 v1, v19

    if-lt v0, v1, :cond_c7

    .line 208
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;

    const/16 v19, 0x2

    move/from16 v0, v19

    invoke-direct {v10, v0, v9}, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;-><init>(I[Ljava/lang/String;)V

    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 209
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_c7
    const/16 v19, 0x3

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_d9

    .line 210
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;

    const/16 v19, 0x2

    move/from16 v0, v19

    invoke-direct {v10, v0, v12}, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;-><init>(I[Ljava/lang/String;)V

    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 211
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_d9
    const/16 v19, 0x2

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_e4

    .line 212
    sget-object v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitMonthField;->INSTANCE:Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitMonthField;

    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 214
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_e4
    sget-object v10, Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedMonthField;->INSTANCE:Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedMonthField;

    .line 216
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 218
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_e7
    const/16 v19, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 219
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 221
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_f4
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TwelveHourField;

    const/16 v19, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v10, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter$TwelveHourField;-><init>(Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;)V

    .line 222
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto :goto_8d

    .line 224
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_108
    const/16 v19, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 225
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 227
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_116
    const/16 v19, 0xc

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 228
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 230
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_124
    const/16 v19, 0xd

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 231
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 233
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_132
    const/16 v19, 0xe

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 234
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 236
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_140
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;

    const/16 v20, 0x7

    const/16 v19, 0x4

    move/from16 v0, v17

    move/from16 v1, v19

    if-ge v0, v1, :cond_157

    move-object/from16 v19, v13

    :goto_14e
    move/from16 v0, v20

    move-object/from16 v1, v19

    invoke-direct {v10, v0, v1}, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;-><init>(I[Ljava/lang/String;)V

    .line 237
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_157
    move-object/from16 v19, v18

    .line 236
    goto :goto_14e

    .line 239
    :sswitch_15a
    const/16 v19, 0x6

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 240
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 242
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_168
    const/16 v19, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 243
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 245
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_176
    const/16 v19, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 246
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 248
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_184
    const/16 v19, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 249
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 251
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_192
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;

    const/16 v19, 0x9

    move/from16 v0, v19

    invoke-direct {v10, v0, v3}, Lorg/apache/commons/lang3/time/FastDatePrinter$TextField;-><init>(I[Ljava/lang/String;)V

    .line 252
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 254
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_19d
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TwentyFourHourField;

    const/16 v19, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v10, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter$TwentyFourHourField;-><init>(Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;)V

    .line 255
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 257
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_1b2
    const/16 v19, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;

    move-result-object v10

    .line 258
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 260
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_1c0
    const/16 v19, 0x4

    move/from16 v0, v17

    move/from16 v1, v19

    if-lt v0, v1, :cond_1e3

    .line 261
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNameRule;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    move-object/from16 v20, v0

    const/16 v21, 0x1

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v10, v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNameRule;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;I)V

    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 263
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_1e3
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNameRule;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-direct {v10, v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNameRule;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;I)V

    .line 265
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 267
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_1fe
    const/16 v19, 0x1

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_20a

    .line 268
    sget-object v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNumberRule;->INSTANCE_NO_COLON:Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNumberRule;

    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 270
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_20a
    sget-object v10, Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNumberRule;->INSTANCE_COLON:Lorg/apache/commons/lang3/time/FastDatePrinter$TimeZoneNumberRule;

    .line 272
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 274
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :sswitch_20e
    const/16 v19, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 275
    .local v14, "sub":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_235

    .line 276
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$CharacterLiteral;

    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->charAt(I)C

    move-result v19

    move/from16 v0, v19

    invoke-direct {v10, v0}, Lorg/apache/commons/lang3/time/FastDatePrinter$CharacterLiteral;-><init>(C)V

    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 278
    .end local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    :cond_235
    new-instance v10, Lorg/apache/commons/lang3/time/FastDatePrinter$StringLiteral;

    invoke-direct {v10, v14}, Lorg/apache/commons/lang3/time/FastDatePrinter$StringLiteral;-><init>(Ljava/lang/String;)V

    .line 280
    .restart local v10    # "rule":Lorg/apache/commons/lang3/time/FastDatePrinter$Rule;
    goto/16 :goto_8d

    .line 195
    :sswitch_data_23c
    .sparse-switch
        0x27 -> :sswitch_20e
        0x44 -> :sswitch_15a
        0x45 -> :sswitch_140
        0x46 -> :sswitch_168
        0x47 -> :sswitch_84
        0x48 -> :sswitch_108
        0x4b -> :sswitch_1b2
        0x4d -> :sswitch_b5
        0x53 -> :sswitch_132
        0x57 -> :sswitch_184
        0x5a -> :sswitch_1fe
        0x61 -> :sswitch_192
        0x64 -> :sswitch_e7
        0x68 -> :sswitch_f4
        0x6b -> :sswitch_19d
        0x6d -> :sswitch_116
        0x73 -> :sswitch_124
        0x77 -> :sswitch_176
        0x79 -> :sswitch_93
        0x7a -> :sswitch_1c0
    .end sparse-switch
.end method

.method protected parseToken(Ljava/lang/String;[I)Ljava/lang/String;
    .registers 15
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "indexRef"    # [I

    .prologue
    const/16 v11, 0x61

    const/16 v10, 0x5a

    const/16 v9, 0x41

    const/16 v8, 0x27

    const/4 v6, 0x0

    .line 299
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 301
    .local v0, "buf":Ljava/lang/StringBuilder;
    aget v2, p2, v6

    .line 302
    .local v2, "i":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 304
    .local v4, "length":I
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 305
    .local v1, "c":C
    if-lt v1, v9, :cond_1c

    if-le v1, v10, :cond_22

    :cond_1c
    if-lt v1, v11, :cond_37

    const/16 v7, 0x7a

    if-gt v1, v7, :cond_37

    .line 308
    :cond_22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 310
    :goto_25
    add-int/lit8 v7, v2, 0x1

    if-ge v7, v4, :cond_6b

    .line 311
    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 312
    .local v5, "peek":C
    if-ne v5, v1, :cond_6b

    .line 313
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 314
    add-int/lit8 v2, v2, 0x1

    .line 318
    goto :goto_25

    .line 321
    .end local v5    # "peek":C
    :cond_37
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    const/4 v3, 0x0

    .line 325
    .local v3, "inLiteral":Z
    :goto_3b
    if-ge v2, v4, :cond_6b

    .line 326
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 328
    if-ne v1, v8, :cond_5d

    .line 329
    add-int/lit8 v7, v2, 0x1

    if-ge v7, v4, :cond_57

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_57

    .line 331
    add-int/lit8 v2, v2, 0x1

    .line 332
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 325
    :goto_54
    add-int/lit8 v2, v2, 0x1

    goto :goto_3b

    .line 334
    :cond_57
    if-nez v3, :cond_5b

    const/4 v3, 0x1

    :goto_5a
    goto :goto_54

    :cond_5b
    move v3, v6

    goto :goto_5a

    .line 336
    :cond_5d
    if-nez v3, :cond_72

    if-lt v1, v9, :cond_63

    if-le v1, v10, :cond_69

    :cond_63
    if-lt v1, v11, :cond_72

    const/16 v7, 0x7a

    if-gt v1, v7, :cond_72

    .line 338
    :cond_69
    add-int/lit8 v2, v2, -0x1

    .line 346
    .end local v3    # "inLiteral":Z
    :cond_6b
    aput v2, p2, v6

    .line 347
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 341
    .restart local v3    # "inLiteral":Z
    :cond_72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_54
.end method

.method protected selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDatePrinter$NumberRule;
    .registers 4
    .param p1, "field"    # I
    .param p2, "padding"    # I

    .prologue
    .line 358
    packed-switch p2, :pswitch_data_16

    .line 364
    new-instance v0, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/lang3/time/FastDatePrinter$PaddedNumberField;-><init>(II)V

    :goto_8
    return-object v0

    .line 360
    :pswitch_9
    new-instance v0, Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang3/time/FastDatePrinter$UnpaddedNumberField;-><init>(I)V

    goto :goto_8

    .line 362
    :pswitch_f
    new-instance v0, Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitNumberField;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang3/time/FastDatePrinter$TwoDigitNumberField;-><init>(I)V

    goto :goto_8

    .line 358
    nop

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_9
        :pswitch_f
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 555
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "FastDatePrinter["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mPattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mLocale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDatePrinter;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
