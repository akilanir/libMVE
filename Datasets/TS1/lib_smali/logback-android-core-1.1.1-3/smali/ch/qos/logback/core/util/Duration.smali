.class public Lch/qos/logback/core/util/Duration;
.super Ljava/lang/Object;


# static fields
.field static final DAYS_COEFFICIENT:J = 0x5265c00L

.field private static final DOUBLE_GROUP:I = 0x1

.field private static final DOUBLE_PART:Ljava/lang/String; = "([0-9]*(.[0-9]+)?)"

.field private static final DURATION_PATTERN:Ljava/util/regex/Pattern;

.field static final HOURS_COEFFICIENT:J = 0x36ee80L

.field static final MINUTES_COEFFICIENT:J = 0xea60L

.field static final SECONDS_COEFFICIENT:J = 0x3e8L

.field private static final UNIT_GROUP:I = 0x3

.field private static final UNIT_PART:Ljava/lang/String; = "(|milli(second)?|second(e)?|minute|hour|day)s?"


# instance fields
.field final millis:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "([0-9]*(.[0-9]+)?)\\s*(|milli(second)?|second(e)?|minute|hour|day)s?"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lch/qos/logback/core/util/Duration;->DURATION_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(J)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lch/qos/logback/core/util/Duration;->millis:J

    return-void
.end method

.method public static buildByDays(D)Lch/qos/logback/core/util/Duration;
    .registers 5

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide v1, 0x4194997000000000L    # 8.64E7

    mul-double/2addr v1, p0

    double-to-long v1, v1

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    return-object v0
.end method

.method public static buildByHours(D)Lch/qos/logback/core/util/Duration;
    .registers 5

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide v1, 0x414b774000000000L    # 3600000.0

    mul-double/2addr v1, p0

    double-to-long v1, v1

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    return-object v0
.end method

.method public static buildByMilliseconds(D)Lch/qos/logback/core/util/Duration;
    .registers 5

    new-instance v0, Lch/qos/logback/core/util/Duration;

    double-to-long v1, p0

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    return-object v0
.end method

.method public static buildByMinutes(D)Lch/qos/logback/core/util/Duration;
    .registers 5

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide v1, 0x40ed4c0000000000L    # 60000.0

    mul-double/2addr v1, p0

    double-to-long v1, v1

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    return-object v0
.end method

.method public static buildBySeconds(D)Lch/qos/logback/core/util/Duration;
    .registers 5

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide v1, 0x408f400000000000L    # 1000.0

    mul-double/2addr v1, p0

    double-to-long v1, v1

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    return-object v0
.end method

.method public static buildUnbounded()Lch/qos/logback/core/util/Duration;
    .registers 3

    new-instance v0, Lch/qos/logback/core/util/Duration;

    const-wide v1, 0x7fffffffffffffffL

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/Duration;-><init>(J)V

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/core/util/Duration;
    .registers 5

    sget-object v0, Lch/qos/logback/core/util/Duration;->DURATION_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_8e

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    const-string v3, "milli"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_34

    const-string v3, "millisecond"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_34

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_39

    :cond_34
    invoke-static {v1, v2}, Lch/qos/logback/core/util/Duration;->buildByMilliseconds(D)Lch/qos/logback/core/util/Duration;

    move-result-object v0

    :goto_38
    return-object v0

    :cond_39
    const-string v3, "second"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_49

    const-string v3, "seconde"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4e

    :cond_49
    invoke-static {v1, v2}, Lch/qos/logback/core/util/Duration;->buildBySeconds(D)Lch/qos/logback/core/util/Duration;

    move-result-object v0

    goto :goto_38

    :cond_4e
    const-string v3, "minute"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5b

    invoke-static {v1, v2}, Lch/qos/logback/core/util/Duration;->buildByMinutes(D)Lch/qos/logback/core/util/Duration;

    move-result-object v0

    goto :goto_38

    :cond_5b
    const-string v3, "hour"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_68

    invoke-static {v1, v2}, Lch/qos/logback/core/util/Duration;->buildByHours(D)Lch/qos/logback/core/util/Duration;

    move-result-object v0

    goto :goto_38

    :cond_68
    const-string v3, "day"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-static {v1, v2}, Lch/qos/logback/core/util/Duration;->buildByDays(D)Lch/qos/logback/core/util/Duration;

    move-result-object v0

    goto :goto_38

    :cond_75
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_8e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "String value ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] is not in the expected format."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public getMilliseconds()J
    .registers 3

    iget-wide v0, p0, Lch/qos/logback/core/util/Duration;->millis:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 10

    const-wide/32 v7, 0x36ee80

    const-wide/32 v5, 0xea60

    const-wide/16 v3, 0x3e8

    iget-wide v0, p0, Lch/qos/logback/core/util/Duration;->millis:J

    cmp-long v0, v0, v3

    if-gez v0, :cond_24

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lch/qos/logback/core/util/Duration;->millis:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " milliseconds"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_23
    return-object v0

    :cond_24
    iget-wide v0, p0, Lch/qos/logback/core/util/Duration;->millis:J

    cmp-long v0, v0, v5

    if-gez v0, :cond_41

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lch/qos/logback/core/util/Duration;->millis:J

    div-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " seconds"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_23

    :cond_41
    iget-wide v0, p0, Lch/qos/logback/core/util/Duration;->millis:J

    cmp-long v0, v0, v7

    if-gez v0, :cond_5e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lch/qos/logback/core/util/Duration;->millis:J

    div-long/2addr v1, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " minutes"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_23

    :cond_5e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lch/qos/logback/core/util/Duration;->millis:J

    div-long/2addr v1, v7

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " hours"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_23
.end method
