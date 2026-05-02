.class public Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;
.super Lcom/jjoe64/graphview/DefaultLabelFormatter;
.source "DateAsXAxisLabelFormatter.java"


# instance fields
.field protected final mCalendar:Ljava/util/Calendar;

.field protected final mDateFormat:Ljava/text/DateFormat;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/jjoe64/graphview/DefaultLabelFormatter;-><init>()V

    .line 61
    invoke-static {p1}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;->mDateFormat:Ljava/text/DateFormat;

    .line 62
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;->mCalendar:Ljava/util/Calendar;

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/text/DateFormat;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dateFormat"    # Ljava/text/DateFormat;

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/jjoe64/graphview/DefaultLabelFormatter;-><init>()V

    .line 73
    iput-object p2, p0, Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;->mDateFormat:Ljava/text/DateFormat;

    .line 74
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;->mCalendar:Ljava/util/Calendar;

    .line 75
    return-void
.end method


# virtual methods
.method public formatLabel(DZ)Ljava/lang/String;
    .registers 7
    .param p1, "value"    # D
    .param p3, "isValueX"    # Z

    .prologue
    .line 86
    if-eqz p3, :cond_19

    .line 88
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;->mCalendar:Ljava/util/Calendar;

    double-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 89
    iget-object v0, p0, Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;->mDateFormat:Ljava/text/DateFormat;

    iget-object v1, p0, Lcom/jjoe64/graphview/helper/DateAsXAxisLabelFormatter;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 91
    :goto_18
    return-object v0

    :cond_19
    invoke-super {p0, p1, p2, p3}, Lcom/jjoe64/graphview/DefaultLabelFormatter;->formatLabel(DZ)Ljava/lang/String;

    move-result-object v0

    goto :goto_18
.end method
