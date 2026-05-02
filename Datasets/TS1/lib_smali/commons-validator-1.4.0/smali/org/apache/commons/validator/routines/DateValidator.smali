.class public Lorg/apache/commons/validator/routines/DateValidator;
.super Lorg/apache/commons/validator/routines/AbstractCalendarValidator;
.source "DateValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/DateValidator;

.field private static final serialVersionUID:J = -0x370b3aaa6c8e0aa6L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 89
    new-instance v0, Lorg/apache/commons/validator/routines/DateValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/DateValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/DateValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/DateValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 104
    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/DateValidator;-><init>(ZI)V

    .line 105
    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "dateStyle"    # I

    .prologue
    .line 116
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;-><init>(ZII)V

    .line 117
    return-void
.end method

.method private getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;
    .registers 4
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 338
    const/4 v0, 0x0

    .line 339
    .local v0, "calendar":Ljava/util/Calendar;
    if-eqz p2, :cond_b

    .line 340
    invoke-static {p2}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 344
    :goto_7
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 345
    return-object v0

    .line 342
    :cond_b
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    goto :goto_7
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/DateValidator;
    .registers 1

    .prologue
    .line 96
    sget-object v0, Lorg/apache/commons/validator/routines/DateValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/DateValidator;

    return-object v0
.end method


# virtual methods
.method public compareDates(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;)I
    .registers 7
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "compare"    # Ljava/util/Date;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 235
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v1

    .line 236
    .local v1, "calendarValue":Ljava/util/Calendar;
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 237
    .local v0, "calendarCompare":Ljava/util/Calendar;
    const/4 v2, 0x5

    invoke-virtual {p0, v1, v0, v2}, Lorg/apache/commons/validator/routines/DateValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v2

    return v2
.end method

.method public compareMonths(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;)I
    .registers 7
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "compare"    # Ljava/util/Date;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 267
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v1

    .line 268
    .local v1, "calendarValue":Ljava/util/Calendar;
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 269
    .local v0, "calendarCompare":Ljava/util/Calendar;
    const/4 v2, 0x2

    invoke-virtual {p0, v1, v0, v2}, Lorg/apache/commons/validator/routines/DateValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v2

    return v2
.end method

.method public compareQuarters(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;)I
    .registers 5
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "compare"    # Ljava/util/Date;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 283
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/validator/routines/DateValidator;->compareQuarters(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;I)I

    move-result v0

    return v0
.end method

.method public compareQuarters(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;I)I
    .registers 8
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "compare"    # Ljava/util/Date;
    .param p3, "timeZone"    # Ljava/util/TimeZone;
    .param p4, "monthOfFirstQuarter"    # I

    .prologue
    .line 298
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v1

    .line 299
    .local v1, "calendarValue":Ljava/util/Calendar;
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 300
    .local v0, "calendarCompare":Ljava/util/Calendar;
    invoke-super {p0, v1, v0, p4}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->compareQuarters(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v2

    return v2
.end method

.method public compareWeeks(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;)I
    .registers 7
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "compare"    # Ljava/util/Date;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 251
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v1

    .line 252
    .local v1, "calendarValue":Ljava/util/Calendar;
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 253
    .local v0, "calendarCompare":Ljava/util/Calendar;
    const/4 v2, 0x3

    invoke-virtual {p0, v1, v0, v2}, Lorg/apache/commons/validator/routines/DateValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v2

    return v2
.end method

.method public compareYears(Ljava/util/Date;Ljava/util/Date;Ljava/util/TimeZone;)I
    .registers 7
    .param p1, "value"    # Ljava/util/Date;
    .param p2, "compare"    # Ljava/util/Date;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 314
    invoke-direct {p0, p1, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v1

    .line 315
    .local v1, "calendarValue":Ljava/util/Calendar;
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/validator/routines/DateValidator;->getCalendar(Ljava/util/Date;Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    .line 316
    .local v0, "calendarCompare":Ljava/util/Calendar;
    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Lorg/apache/commons/validator/routines/DateValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v2

    return v2
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 327
    return-object p1
.end method

.method public validate(Ljava/lang/String;)Ljava/util/Date;
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

    invoke-virtual {p0, p1, v0, v2, v1}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Date;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 153
    move-object v0, v1

    check-cast v0, Ljava/util/Locale;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;)Ljava/util/Date;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;

    .prologue
    .line 206
    const/4 v0, 0x0

    check-cast v0, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/util/Date;
    .registers 6
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "locale"    # Ljava/util/Locale;
    .param p4, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 221
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/lang/String;Ljava/util/TimeZone;)Ljava/util/Date;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 167
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;)Ljava/util/Date;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v1, 0x0

    .line 179
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, v0, p2, v1}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/util/Date;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "locale"    # Ljava/util/Locale;
    .param p3, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 192
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method

.method public validate(Ljava/lang/String;Ljava/util/TimeZone;)Ljava/util/Date;
    .registers 5
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    const/4 v1, 0x0

    .line 140
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/apache/commons/validator/routines/DateValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    return-object v0
.end method
