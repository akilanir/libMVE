.class Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;
.super Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IntegerConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final mMaxValue:I

.field private final mMinValue:I

.field private mNoZero:Z


# direct methods
.method public constructor <init>(II)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->mNoZero:Z

    iput p2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->mMaxValue:I

    iput p1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->mMinValue:I

    return-void
.end method


# virtual methods
.method public noZero()Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->mNoZero:Z

    return-object p0
.end method

.method public parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Integer;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iget v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->mMinValue:I

    if-lt v0, v1, :cond_12

    iget v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->mMaxValue:I

    if-gt v0, v1, :cond_12

    iget-boolean v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->mNoZero:Z

    if-eqz v1, :cond_45

    if-nez v0, :cond_45

    :cond_12
    new-instance v1, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "int value out of range: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2b
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_2b} :catch_2b

    :catch_2b
    move-exception v0

    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal int value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_45
    :try_start_45
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_48
    .catch Ljava/lang/NumberFormatException; {:try_start_45 .. :try_end_48} :catch_2b

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$IntegerConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
