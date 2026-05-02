.class public final Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;
.super Ljava/lang/Object;
.source "DateUtil.java"

# interfaces
.implements Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/DateUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "TrivialDateToISO8601CalendarFactory"
.end annotation


# instance fields
.field private calendar:Ljava/util/GregorianCalendar;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 375
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Ljava/util/TimeZone;Ljava/util/Date;)Ljava/util/GregorianCalendar;
    .registers 5
    .param p1, "tz"    # Ljava/util/TimeZone;
    .param p2, "date"    # Ljava/util/Date;

    .prologue
    .line 381
    iget-object v0, p0, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;->calendar:Ljava/util/GregorianCalendar;

    if-nez v0, :cond_15

    .line 382
    new-instance v0, Ljava/util/GregorianCalendar;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, p1, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    iput-object v0, p0, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;->calendar:Ljava/util/GregorianCalendar;

    .line 386
    :goto_d
    iget-object v0, p0, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;->calendar:Ljava/util/GregorianCalendar;

    invoke-virtual {v0, p2}, Ljava/util/GregorianCalendar;->setTime(Ljava/util/Date;)V

    .line 387
    iget-object v0, p0, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;->calendar:Ljava/util/GregorianCalendar;

    return-object v0

    .line 384
    :cond_15
    iget-object v0, p0, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;->calendar:Ljava/util/GregorianCalendar;

    invoke-virtual {v0, p1}, Ljava/util/GregorianCalendar;->setTimeZone(Ljava/util/TimeZone;)V

    goto :goto_d
.end method
