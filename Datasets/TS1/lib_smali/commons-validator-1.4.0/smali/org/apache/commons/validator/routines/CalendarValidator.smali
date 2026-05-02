.class public Lorg/apache/commons/validator/routines/CalendarValidator;
.super Lorg/apache/commons/validator/routines/AbstractCalendarValidator;
.source "CalendarValidator.java"


# static fields
.field private static final VALIDATOR:Lorg/apache/commons/validator/routines/CalendarValidator;

.field private static final serialVersionUID:J = 0x7e6bfc84d7216a97L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 92
    new-instance v0, Lorg/apache/commons/validator/routines/CalendarValidator;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/CalendarValidator;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/CalendarValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/CalendarValidator;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 107
    const/4 v0, 0x1

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/validator/routines/CalendarValidator;-><init>(ZI)V

    .line 108
    return-void
.end method

.method public constructor <init>(ZI)V
    .registers 4
    .param p1, "strict"    # Z
    .param p2, "dateStyle"    # I

    .prologue
    .line 119
    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;-><init>(ZII)V

    .line 120
    return-void
.end method

.method public static adjustToTimeZone(Ljava/util/Calendar;Ljava/util/TimeZone;)V
    .registers 8
    .param p0, "value"    # Ljava/util/Calendar;
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 233
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/TimeZone;->hasSameRules(Ljava/util/TimeZone;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 234
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 244
    :goto_d
    return-void

    .line 236
    :cond_e
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 237
    .local v1, "year":I
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 238
    .local v2, "month":I
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 239
    .local v3, "date":I
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 240
    .local v4, "hour":I
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 241
    .local v5, "minute":I
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    move-object v0, p0

    .line 242
    invoke-virtual/range {v0 .. v5}, Ljava/util/Calendar;->set(IIIII)V

    goto :goto_d
.end method

.method public static getInstance()Lorg/apache/commons/validator/routines/CalendarValidator;
    .registers 1

    .prologue
    .line 99
    sget-object v0, Lorg/apache/commons/validator/routines/CalendarValidator;->VALIDATOR:Lorg/apache/commons/validator/routines/CalendarValidator;

    return-object v0
.end method


# virtual methods
.method public compareDates(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 256
    const/4 v0, 0x5

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/CalendarValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareMonths(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 282
    const/4 v0, 0x2

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/CalendarValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareQuarters(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 295
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/CalendarValidator;->compareQuarters(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareQuarters(Ljava/util/Calendar;Ljava/util/Calendar;I)I
    .registers 5
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;
    .param p3, "monthOfFirstQuarter"    # I

    .prologue
    .line 309
    invoke-super {p0, p1, p2, p3}, Lorg/apache/commons/validator/routines/AbstractCalendarValidator;->compareQuarters(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareWeeks(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 269
    const/4 v0, 0x3

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/CalendarValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method public compareYears(Ljava/util/Calendar;Ljava/util/Calendar;)I
    .registers 4
    .param p1, "value"    # Ljava/util/Calendar;
    .param p2, "compare"    # Ljava/util/Calendar;

    .prologue
    .line 322
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/validator/routines/CalendarValidator;->compare(Ljava/util/Calendar;Ljava/util/Calendar;I)I

    move-result v0

    return v0
.end method

.method protected processParsedValue(Ljava/lang/Object;Ljava/text/Format;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "formatter"    # Ljava/text/Format;

    .prologue
    .line 333
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

    .line 131
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    move-object v2, v1

    check-cast v2, Ljava/util/Locale;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, v0, v2, v1}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

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

    .line 156
    move-object v0, v1

    check-cast v0, Ljava/util/Locale;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

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
    .line 208
    const/4 v0, 0x0

    check-cast v0, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

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
    .line 223
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

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
    .line 169
    const/4 v0, 0x0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

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

    .line 181
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/TimeZone;

    invoke-virtual {p0, p1, v0, p2, v1}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

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
    .line 194
    const/4 v0, 0x0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p1, v0, p2, p3}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

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

    .line 144
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    check-cast v1, Ljava/util/Locale;

    invoke-virtual {p0, p1, v0, v1, p2}, Lorg/apache/commons/validator/routines/CalendarValidator;->parse(Ljava/lang/String;Ljava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    return-object v0
.end method
