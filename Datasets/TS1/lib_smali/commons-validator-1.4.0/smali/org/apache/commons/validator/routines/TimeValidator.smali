.class public Lorg/apache/commons/validator/routines/TimeValidator;
.super Lorg/apache/commons/validator/routines/AbstractCalendarValidator;
.source "TimeValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/TimeValidator;

.field private static final serialVersionUID:J = 0x307d354d5b49d2bdL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 89
    new-instance v0, Lorg/apache/commons/validator/routines/TimeValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/TimeValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/TimeValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/TimeValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 104
    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/TimeValidator;-><init>(ZI)V

    .line 105
    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "timeStyle"    # I

    .prologue
    .line 116
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;-><init>(ZII)V

    .line 117
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/TimeValidator;
    .registers 1

    .prologue
    .line 96
    sget-object v0, Lorg/apache/commons/validator/routines/TimeValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/TimeValidator;

    return-object v0
.end method


# virtual methods
.method public compareHours(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 271
    const/16 v0, 0xb

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/TimeValidator;->compareTime(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareMinutes(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 258
    const/16 v0, 0xc

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/TimeValidator;->compareTime(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareSeconds(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 245
    const/16 v0, 0xd

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/TimeValidator;->compareTime(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareTime(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 232
    const/16 v0, 0xe

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/TimeValidator;->compareTime(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 282
    check-cast p2, Ljava/text/DateFormat;

    .end local p2    # "formatter":Ljava/text/Format;
    invoke-virtual {p2}, Ljava/text/DateFormat;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public validate(Ljava/lang/String;)Ljava/util/Calendar;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 128
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object v2, v1

    check-cast v2, Ljava/util/Locale;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, v0, v2, v1}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Calendar;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 152
    move-object v0, v1

    check-cast v0, Ljava/util/Locale;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/util/Calendar;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 204
    const/4 v0, 0x0

    check-cast v0, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/util/Calendar;
    .registers 6
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 219
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/TimeZone;)Ljava/util/Calendar;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 165
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/Calendar;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v1, 0x0

    .line 177
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, v0, p2, v1}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/util/Calendar;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 190
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/TimeZone;)Ljava/util/Calendar;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    const/4 v1, 0x0

    .line 140
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/apache/commons/validator/routines/TimeValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method
