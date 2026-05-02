.class Lfreemarker/core/DateBuiltins$iso_tz_BI;
.super Lfreemarker/core/DateBuiltins$AbstractISOBI;
.source "DateBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/DateBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "iso_tz_BI"
.end annotation


# instance fields
.field private final useUTC:Z


# direct methods
.method constructor <init>(ZIZ)V
    .registers 4
    .param p1, "showOffset"    # Z
    .param p2, "accuracy"    # I
    .param p3, "useUTC"    # Z

    .prologue
    .line 131
    invoke-direct {p0, p1, p2}, Lfreemarker/core/DateBuiltins$AbstractISOBI;-><init>(ZI)V

    .line 132
    iput-boolean p3, p0, Lfreemarker/core/DateBuiltins$iso_tz_BI;->useUTC:Z

    .line 133
    return-void
.end method


# virtual methods
.method protected calculateResult(Ljava/util/Date;ILfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 12
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "dateType"    # I
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v3, 0x0

    const/4 v0, 0x1

    .line 138
    invoke-virtual {p0, p2}, Lfreemarker/core/DateBuiltins$iso_tz_BI;->checkDateTypeNotUnknown(I)V

    .line 139
    new-instance v7, Lfreemarker/template/SimpleScalar;

    if-eq p2, v0, :cond_2a

    move v1, v0

    :goto_b
    if-eq p2, v5, :cond_2c

    move v2, v0

    :goto_e
    iget-boolean v4, p0, Lfreemarker/core/DateBuiltins$iso_tz_BI;->showOffset:Z

    if-eqz v4, :cond_15

    if-eq p2, v5, :cond_15

    move v3, v0

    :cond_15
    iget v4, p0, Lfreemarker/core/DateBuiltins$iso_tz_BI;->accuracy:I

    iget-boolean v0, p0, Lfreemarker/core/DateBuiltins$iso_tz_BI;->useUTC:Z

    if-eqz v0, :cond_2e

    sget-object v5, Lfreemarker/template/utility/DateUtil;->UTC:Ljava/util/TimeZone;

    :goto_1d
    invoke-virtual {p3}, Lfreemarker/core/Environment;->getISOBuiltInCalendar()Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;

    move-result-object v6

    move-object v0, p1

    invoke-static/range {v0 .. v6}, Lfreemarker/template/utility/DateUtil;->dateToISO8601String(Ljava/util/Date;ZZZILjava/util/TimeZone;Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v7, v0}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v7

    :cond_2a
    move v1, v3

    goto :goto_b

    :cond_2c
    move v2, v3

    goto :goto_e

    :cond_2e
    invoke-virtual {p3}, Lfreemarker/core/Environment;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v5

    goto :goto_1d
.end method
