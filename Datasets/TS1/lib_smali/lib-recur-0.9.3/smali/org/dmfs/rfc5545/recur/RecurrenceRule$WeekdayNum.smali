.class public Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WeekdayNum"
.end annotation


# instance fields
.field public final pos:I

.field public final weekday:Lorg/dmfs/rfc5545/Weekday;


# direct methods
.method public constructor <init>(ILorg/dmfs/rfc5545/Weekday;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, -0x35

    if-lt p1, v0, :cond_b

    const/16 v0, 0x35

    if-le p1, v0, :cond_2a

    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " of week day out of range"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2a
    iput p1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->pos:I

    iput-object p2, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->weekday:Lorg/dmfs/rfc5545/Weekday;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->valueOf(Ljava/lang/String;Z)Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    move-result-object v0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;Z)Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-le v1, v2, :cond_77

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2b

    if-ne v2, v3, :cond_12

    const/4 v0, 0x1

    :cond_12
    add-int/lit8 v2, v1, -0x2

    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    if-nez p1, :cond_67

    if-eqz v2, :cond_28

    const/16 v0, -0x35

    if-lt v2, v0, :cond_28

    const/16 v0, 0x35

    if-le v2, v0, :cond_67

    :cond_28
    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid weeknum: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_47} :catch_47

    :catch_47
    move-exception v0

    new-instance v1, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid weeknum: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_67
    :try_start_67
    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/dmfs/rfc5545/Weekday;->valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/Weekday;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;-><init>(ILorg/dmfs/rfc5545/Weekday;)V

    :goto_76
    return-object v0

    :cond_77
    new-instance v0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;

    const/4 v1, 0x0

    invoke-static {p0}, Lorg/dmfs/rfc5545/Weekday;->valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/Weekday;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;-><init>(ILorg/dmfs/rfc5545/Weekday;)V
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_81} :catch_47

    goto :goto_76
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    iget v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->pos:I

    if-nez v0, :cond_b

    iget-object v0, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->weekday:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/Weekday;->name()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->pos:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$WeekdayNum;->weekday:Lorg/dmfs/rfc5545/Weekday;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/Weekday;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method
