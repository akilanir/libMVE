.class public final Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$SkipValueConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$RScaleConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$DateTimeConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$FreqConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNumConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$MonthConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;,
        Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;
    }
.end annotation


# static fields
.field private static final DEFAULT_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field private static final ERROR_CONVERTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
            "<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private static final FREQ_PREFIX:Ljava/lang/String;

.field private static final ONE:Ljava/lang/Integer;

.field private static final SKIP_DEFAULT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;


# instance fields
.field private mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

.field private mParts:Ljava/util/EnumMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumMap",
            "<",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mXParts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->ONE:Ljava/lang/Integer;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->FREQ_PREFIX:Ljava/lang/String;

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;

    sget-object v1, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->DEFAULT_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->SKIP_DEFAULT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;

    invoke-direct {v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;-><init>()V

    sput-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->ERROR_CONVERTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-direct {p0, p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;-><init>(Ljava/lang/String;Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->DEFAULT_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-object p2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-direct {p0, p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->parseString(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/recur/Freq;)V
    .registers 3

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-direct {p0, p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;-><init>(Lorg/dmfs/rfc5545/recur/Freq;Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/recur/Freq;Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->DEFAULT_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iput-object p2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$500()Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->ERROR_CONVERTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    return-object v0
.end method

.method private checkForInvalidNumericInByDay(Lorg/dmfs/rfc5545/recur/Freq;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1, v0}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1, v0}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_16
    :goto_16
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_62

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    iget v0, v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->pos:I

    if-eqz v0, :cond_16

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq p1, v0, :cond_42

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq p1, v0, :cond_42

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v3, :cond_3c

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "The BYDAY rule part must not be specified with a numeric value when the FREQ rule part is not set to MONTHLY or YEARLY."

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3c
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1, v0}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    :cond_42
    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne p1, v0, :cond_16

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1, v0}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v3, :cond_5c

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "The BYDAY rule part must not be specified with a numeric value with the FREQ rule part set to YEARLY when BYWEEKNO is set"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5c
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1, v0}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16

    :cond_62
    return-void
.end method

.method private parseString(Ljava/lang/String;)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "recur must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC2445_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-eq v0, v1, :cond_16

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v1, :cond_54

    :cond_16
    const/4 v0, 0x1

    move v3, v0

    :goto_18
    if-eqz v3, :cond_1e

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :cond_1e
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v0, ";"

    invoke-virtual {v4, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC2445_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v1, :cond_57

    const/4 v0, 0x0

    aget-object v0, v5, v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->FREQ_PREFIX:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_57

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "RFC 2445 requires FREQ to be the first part of the rule: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_54
    const/4 v0, 0x0

    move v3, v0

    goto :goto_18

    :cond_57
    iget-object v6, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->DEFAULT_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    iget-object v7, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->name()Ljava/lang/String;

    move-result-object v2

    array-length v8, v5

    const/4 v1, 0x0

    :goto_65
    if-ge v1, v8, :cond_98

    aget-object v9, v5, v1

    invoke-virtual {v9, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_df

    const-string v10, "="

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    if-lez v10, :cond_be

    const/4 v11, 0x0

    invoke-virtual {v9, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_df

    add-int/lit8 v0, v10, 0x1

    invoke-virtual {v9, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    iget-object v1, v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->converter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v6, v2, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v7, v1, v0}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_98
    array-length v8, v5

    const/4 v1, 0x0

    move v2, v1

    :goto_9b
    if-ge v2, v8, :cond_1bf

    aget-object v1, v5, v2

    const-string v9, "="

    invoke-virtual {v1, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-lez v9, :cond_19e

    const/4 v10, 0x0

    invoke-virtual {v1, v10, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    invoke-virtual {v1, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :try_start_b2
    invoke-static {v10}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;
    :try_end_b5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b2 .. :try_end_b5} :catch_e2

    move-result-object v9

    sget-object v10, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-ne v9, v10, :cond_156

    :cond_ba
    :goto_ba
    :pswitch_ba
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_9b

    :cond_be
    if-nez v3, :cond_df

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Missing \'=\' in part \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_df
    add-int/lit8 v1, v1, 0x1

    goto :goto_65

    :catch_e2
    move-exception v9

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v11, 0x2

    if-le v9, v11, :cond_131

    const/4 v9, 0x0

    invoke-virtual {v10, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v11, 0x58

    if-ne v9, v11, :cond_131

    const/4 v9, 0x1

    invoke-virtual {v10, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v11, 0x2d

    if-ne v9, v11, :cond_131

    sget-object v9, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$RfcMode:[I

    iget-object v11, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    invoke-virtual {v11}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->ordinal()I

    move-result v11

    aget v9, v9, v11

    packed-switch v9, :pswitch_data_202

    goto :goto_ba

    :pswitch_10a
    invoke-virtual {p0, v10, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->setXPart(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_ba

    :pswitch_10e
    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid part "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_131
    if-nez v3, :cond_ba

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid part "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_156
    if-nez v3, :cond_181

    invoke-virtual {v7, v9}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_181

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "duplicate part "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_181
    :try_start_181
    iget-object v10, v9, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->converter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    invoke-virtual {v10, v1, v6, v0, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_ba

    sget-object v10, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-ne v9, v10, :cond_195

    sget-object v10, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->ONE:Ljava/lang/Integer;

    invoke-virtual {v10, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_ba

    :cond_195
    invoke-virtual {v7, v9, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_198
    .catch Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException; {:try_start_181 .. :try_end_198} :catch_19a

    goto/16 :goto_ba

    :catch_19a
    move-exception v1

    if-nez v3, :cond_ba

    throw v1

    :cond_19e
    if-nez v3, :cond_ba

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing \'=\' in part \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1bf
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v7, v0}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d6

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v7, v0}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d6

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->SKIP_DEFAULT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    invoke-virtual {v7, v0, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1d6
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getSkip()Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    if-eq v0, v1, :cond_1ed

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$Freq:[I

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v1

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/Freq;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_20e

    :cond_1ed
    :goto_1ed
    invoke-direct {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->validate()V

    return-void

    :pswitch_1f1
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :pswitch_1f9
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHDAYSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1ed

    :pswitch_data_202
    .packed-switch 0x1
        :pswitch_10a
        :pswitch_10a
        :pswitch_ba
        :pswitch_10e
    .end packed-switch

    :pswitch_data_20e
    .packed-switch 0x1
        :pswitch_1f1
        :pswitch_1f9
    .end packed-switch
.end method

.method private validate()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    iget-object v2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v0}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/Freq;

    if-nez v0, :cond_14

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "FREQ part is missing"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC2445_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-eq v1, v3, :cond_20

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v1, v3, :cond_39

    :cond_20
    const/4 v1, 0x1

    :goto_21
    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3b

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3b

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "UNTIL and COUNT must not occur in the same rule."

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_39
    const/4 v1, 0x0

    goto :goto_21

    :cond_3b
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getInterval()I

    move-result v3

    if-gtz v3, :cond_50

    if-eqz v1, :cond_4b

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "INTERVAL must not be <= 0"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4b
    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_50
    sget-object v3, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v3, :cond_6d

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6d

    if-eqz v1, :cond_66

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "BYWEEKNO is allowed in YEARLY rules only"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_66
    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    sget-object v4, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    invoke-virtual {v2, v3, v4}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6d
    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v4, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v3, v4, :cond_a3

    sget-object v3, Lorg/dmfs/rfc5545/recur/Freq;->DAILY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v3, :cond_7f

    sget-object v3, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v3, :cond_7f

    sget-object v3, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v3, :cond_8f

    :cond_7f
    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8f

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "In RFC 5545, BYYEARDAY is not allowed in DAILY, WEEKLY or MONTHLY rules"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8f
    sget-object v3, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v3, :cond_a3

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a3

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "In RFC 5545, BYMONTHDAY is not allowed in WEEKLY rules"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a3
    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTH:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYHOUR:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMINUTE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSECOND:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v3}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_fa

    if-eqz v1, :cond_f5

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "BYSETPOS must only be used in conjunction with another BYxxx rule."

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f5
    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYSETPOS:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v2, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_fa
    invoke-direct {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->checkForInvalidNumericInByDay(Lorg/dmfs/rfc5545/recur/Freq;)V

    return-void
.end method

.method private validate(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/Freq;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v1, v2, :cond_48

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v1, :cond_20

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYWEEKNO:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-ne p1, v1, :cond_20

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "In RFC 5545, BYWEEKNO is allowed in YEARLY rules only"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->DAILY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v1, :cond_2c

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v1, :cond_2c

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_38

    :cond_2c
    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYYEARDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-ne p1, v1, :cond_38

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "In RFC 5545, BYYEARDAY is not allowed in DAILY, WEEKLY or MONTHLY rules"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_38
    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_48

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYMONTHDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-ne p1, v0, :cond_48

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "In RFC 5545, BYMONTHDAY is not allowed in WEEKLY rules"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_48
    return-void
.end method


# virtual methods
.method public getByDayPart()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_32

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a list type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_28
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0

    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
        :pswitch_28
    .end packed-switch
.end method

.method public getCount()Ljava/lang/Integer;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method public getFreq()Lorg/dmfs/rfc5545/recur/Freq;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/Freq;

    return-object v0
.end method

.method public getInterval()I
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_d
.end method

.method public getSkip()Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    if-nez v0, :cond_e

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    :cond_e
    return-object v0
.end method

.method public getUntil()Lorg/dmfs/rfc5545/DateTime;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/DateTime;

    return-object v0
.end method

.method public getWeekStart()Lorg/dmfs/rfc5545/Weekday;
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->WKST:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/Weekday;

    if-nez v0, :cond_e

    sget-object v0, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    :cond_e
    return-object v0
.end method

.method public getXPart(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    if-eqz p1, :cond_12

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-eq v0, v1, :cond_12

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v1, :cond_14

    :cond_12
    const/4 v0, 0x0

    :cond_13
    :goto_13
    return-object v0

    :cond_14
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_13

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_13
.end method

.method public hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public hasXPart(Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_13

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    if-eqz v1, :cond_13

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-eq v1, v2, :cond_13

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v1, v2, :cond_14

    :cond_13
    :goto_13
    return v0

    :cond_14
    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2a

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    :cond_2a
    const/4 v0, 0x1

    goto :goto_13
.end method

.method public isInfinite()Z
    .registers 3

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public iterator(JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;
    .registers 6

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-direct {v0, v1, p3, p1, p2}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;J)V

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getUntil()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v1

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->toAllDay()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    :cond_17
    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->iterator(Lorg/dmfs/rfc5545/DateTime;)Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator(Lorg/dmfs/rfc5545/DateTime;)Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;
    .registers 15

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getUntil()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    if-eqz v0, :cond_2b

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v2

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v3

    if-eq v2, v3, :cond_19

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "using allday start times with non-allday until values (and vice versa) is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_19
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v0

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v2

    if-eq v0, v2, :cond_2b

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "using floating start times with absolute until values (and vice versa) is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2b
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v2}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    if-nez v0, :cond_105

    new-instance v3, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;

    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getWeekStart()Lorg/dmfs/rfc5545/Weekday;

    move-result-object v0

    const/4 v2, 0x4

    invoke-direct {v3, v0, v2}, Lorg/dmfs/rfc5545/calendarmetrics/GregorianCalendarMetrics;-><init>(Lorg/dmfs/rfc5545/Weekday;I)V

    :goto_41
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getCalendarMetrics()Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->scaleEquals(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Z

    move-result v0

    if-nez v0, :cond_7f

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    invoke-direct {v0, v3, p1}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/DateTime;)V

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v4

    :goto_54
    invoke-static {p0, v3, v4, v5}, Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;->getInstance(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)Lorg/dmfs/rfc5545/recur/FastBirthdayIterator;

    move-result-object v2

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v0

    if-eqz v0, :cond_84

    move-object v12, v1

    :goto_5f
    if-eqz v2, :cond_aa

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_89

    sget-object v6, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/SanityFilter;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/rfc5545/recur/SanityFilter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    move-object v7, p0

    move-object v8, v0

    move-object v9, v3

    move-wide v10, v4

    invoke-virtual/range {v6 .. v12}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->getExpander(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RuleIterator;

    move-result-object v2

    :cond_79
    :goto_79
    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;

    invoke-direct {v0, v2, p1, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRuleIterator;-><init>(Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/DateTime;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    return-object v0

    :cond_7f
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getInstance()J

    move-result-wide v4

    goto :goto_54

    :cond_84
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v12

    goto :goto_5f

    :cond_89
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_a2

    sget-object v6, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v0, Lorg/dmfs/rfc5545/recur/SanityFilter;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/rfc5545/recur/SanityFilter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    move-object v7, p0

    move-object v8, v0

    move-object v9, v3

    move-wide v10, v4

    invoke-virtual/range {v6 .. v12}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->getExpander(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RuleIterator;

    move-result-object v2

    goto :goto_79

    :cond_a2
    new-instance v0, Lorg/dmfs/rfc5545/recur/SanityFilter;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/rfc5545/recur/SanityFilter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)V

    move-object v2, v0

    goto :goto_79

    :cond_aa
    invoke-static {p0, v3, v4, v5}, Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;->getInstance(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;J)Lorg/dmfs/rfc5545/recur/FastWeeklyIterator;

    move-result-object v2

    if-eqz v2, :cond_c1

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->hasPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;)Z

    move-result v0

    if-eqz v0, :cond_79

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    move-object v1, p0

    move-object v6, v12

    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->getExpander(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RuleIterator;

    move-result-object v2

    goto :goto_79

    :cond_c1
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v6, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_SANITY_FILTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v6, v1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    invoke-virtual {v0}, Ljava/util/EnumMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_d2
    :goto_d2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_79

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-eq v0, v1, :cond_d2

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->WKST:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-eq v0, v1, :cond_d2

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-eq v0, v1, :cond_d2

    invoke-virtual {v0, p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->expands(Lorg/dmfs/rfc5545/recur/RecurrenceRule;)Z

    move-result v1

    if-eqz v1, :cond_fa

    move-object v1, p0

    move-object v6, v12

    invoke-virtual/range {v0 .. v6}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->getExpander(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/recur/RuleIterator;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JLjava/util/TimeZone;)Lorg/dmfs/rfc5545/recur/RuleIterator;

    move-result-object v0

    if-eqz v0, :cond_d2

    move-object v2, v0

    goto :goto_d2

    :cond_fa
    move-object v1, v2

    check-cast v1, Lorg/dmfs/rfc5545/recur/ByExpander;

    invoke-virtual {v0, p0, v3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->getFilter(Lorg/dmfs/rfc5545/recur/RecurrenceRule;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)Lorg/dmfs/rfc5545/recur/ByFilter;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/dmfs/rfc5545/recur/ByExpander;->addFilter(Lorg/dmfs/rfc5545/recur/ByFilter;)V

    goto :goto_d2

    :cond_105
    move-object v3, v0

    goto/16 :goto_41
.end method

.method public setByDayPart(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_f

    :cond_8
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_f
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->BYDAY:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;Ljava/util/List;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    if-eqz p2, :cond_8

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_e

    :cond_8
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_d
    return-void

    :cond_e
    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$2;->$SwitchMap$org$dmfs$rfc5545$recur$RecurrenceRule$Part:[I

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_40

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a list type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_36
    invoke-direct {p0, p1, p2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->validate(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;Ljava/util/List;)V

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    nop

    :pswitch_data_40
    .packed-switch 0x1
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_36
    .end packed-switch
.end method

.method public varargs setByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;[Ljava/lang/Integer;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    if-eqz p2, :cond_5

    array-length v0, p2

    if-nez v0, :cond_b

    :cond_5
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    invoke-virtual {v0, p1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_a
    return-void

    :cond_b
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->setByPart(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;Ljava/util/List;)V

    goto :goto_a
.end method

.method public setCount(I)V
    .registers 5

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setFreq(Lorg/dmfs/rfc5545/recur/Freq;Z)V
    .registers 5

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->FREQ:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-eq v0, v1, :cond_13

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v1, :cond_13

    :cond_13
    return-void
.end method

.method public setInterval(I)V
    .registers 5

    const/4 v0, 0x1

    if-le p1, v0, :cond_f

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_e
    return-void

    :cond_f
    if-gtz p1, :cond_19

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Interval must be a positive integer value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_19
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->INTERVAL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e
.end method

.method public setSkip(Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;)V
    .registers 6

    const/4 v3, 0x0

    if-eqz p1, :cond_7

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;->OMIT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Skip;

    if-ne p1, v0, :cond_1d

    :cond_7
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHDAYSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    :goto_1c
    return-void

    :cond_1d
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->SKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_37

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    sget-object v2, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->DEFAULT_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_37
    invoke-virtual {p0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->getFreq()Lorg/dmfs/rfc5545/recur/Freq;

    move-result-object v0

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-eq v0, v1, :cond_43

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    if-ne v0, v1, :cond_1c

    :cond_43
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, v3}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHDAYSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, v3}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c
.end method

.method public setUntil(Lorg/dmfs/rfc5545/DateTime;)V
    .registers 9

    if-nez p1, :cond_11

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_10
    return-void

    :cond_11
    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v0

    if-nez v0, :cond_23

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    :cond_23
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getCalendarMetrics()Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4b

    :cond_2f
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    new-instance v2, Lorg/dmfs/rfc5545/DateTime;

    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    sget-object v4, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v5

    invoke-direct {v2, v3, v4, v5, v6}, Lorg/dmfs/rfc5545/DateTime;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;J)V

    invoke-virtual {v0, v1, v2}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_43
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->COUNT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    :cond_4b
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->UNTIL:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_43
.end method

.method public setWeekStart(Lorg/dmfs/rfc5545/Weekday;)V
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->setWeekStart(Lorg/dmfs/rfc5545/Weekday;Z)V

    return-void
.end method

.method public setWeekStart(Lorg/dmfs/rfc5545/Weekday;Z)V
    .registers 5

    sget-object v0, Lorg/dmfs/rfc5545/Weekday;->MO:Lorg/dmfs/rfc5545/Weekday;

    if-ne p1, v0, :cond_e

    if-nez p2, :cond_e

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->WKST:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1}, Ljava/util/EnumMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_d
    return-void

    :cond_e
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->WKST:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v1, p1}, Ljava/util/EnumMap;->put(Ljava/lang/Enum;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d
.end method

.method public setXPart(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    const/4 v2, 0x0

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v1, :cond_f

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "x-parts are not supported by RFC5545."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_f
    if-nez p2, :cond_15

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    if-eqz v0, :cond_1d

    :cond_15
    if-eqz p1, :cond_1d

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC5545_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v1, :cond_1e

    :cond_1d
    :goto_1d
    return-void

    :cond_1e
    if-nez p2, :cond_34

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1d

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d

    :cond_34
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_54

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x58

    if-eq v0, v1, :cond_4b

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x78

    if-ne v0, v1, :cond_54

    :cond_4b
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2d

    if-eq v0, v1, :cond_73

    :cond_54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid x-name: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_73
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    if-nez v0, :cond_80

    new-instance v0, Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    :cond_80
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d
.end method

.method public toString()Ljava/lang/String;
    .registers 11

    const/4 v2, 0x0

    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v0, 0xa0

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x1

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    sget-object v3, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->RSCALE:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    invoke-virtual {v0, v3}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    if-nez v0, :cond_17

    sget-object v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->DEFAULT_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    :cond_17
    invoke-static {}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->values()[Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    move-result-object v5

    array-length v6, v5

    move v3, v2

    :goto_1d
    if-ge v3, v6, :cond_53

    aget-object v7, v5, v3

    sget-object v8, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHDAYSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-eq v7, v8, :cond_2d

    sget-object v8, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_BYMONTHSKIP:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-eq v7, v8, :cond_2d

    sget-object v8, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->_SANITY_FILTER:Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;

    if-ne v7, v8, :cond_30

    :cond_2d
    :goto_2d
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    :cond_30
    iget-object v8, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mParts:Ljava/util/EnumMap;

    invoke-virtual {v8, v7}, Ljava/util/EnumMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_2d

    if-eqz v1, :cond_4d

    move v1, v2

    :goto_3b
    invoke-virtual {v7}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "="

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v7, Lorg/dmfs/rfc5545/recur/RecurrenceRule$Part;->converter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    invoke-virtual {v7, v4, v8, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;->serialize(Ljava/lang/StringBuilder;Ljava/lang/Object;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    goto :goto_2d

    :cond_4d
    const-string v9, ";"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    :cond_53
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC2445_LAX:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-eq v0, v1, :cond_5f

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mode:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    sget-object v1, Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;->RFC2445_STRICT:Lorg/dmfs/rfc5545/recur/RecurrenceRule$RfcMode;

    if-ne v0, v1, :cond_9f

    :cond_5f
    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    if-eqz v0, :cond_9f

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_9f

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule;->mXParts:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_75
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/util/Map$Entry;

    const-string v0, ";"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_75

    :cond_9f
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
