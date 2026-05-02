.class Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;
.super Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/RecurrenceRule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ListValueConverter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
        "<",
        "Ljava/util/Collection",
        "<TT;>;>;"
    }
.end annotation


# instance fields
.field private final mElementConverter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter",
            "<TT;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;-><init>(Lorg/dmfs/rfc5545/recur/RecurrenceRule$1;)V

    iput-object p1, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;->mElementConverter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    return-void
.end method


# virtual methods
.method public bridge synthetic parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/util/Collection;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;",
            "Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;",
            "Z)",
            "Ljava/util/Collection",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;
        }
    .end annotation

    new-instance v2, Ljava/util/ArrayList;

    const/16 v0, 0x20

    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(I)V

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    const/4 v0, 0x0

    move v1, v0

    :goto_10
    if-ge v1, v4, :cond_47

    aget-object v0, v3, v1

    :try_start_14
    iget-object v5, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;->mElementConverter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    invoke-virtual {v5, v0, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;->parse(Ljava/lang/String;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Z)Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1d
    .catch Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException; {:try_start_14 .. :try_end_1d} :catch_21
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_1d} :catch_25

    :cond_1d
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_10

    :catch_21
    move-exception v0

    if-nez p4, :cond_1d

    throw v0

    :catch_25
    move-exception v0

    if-nez p4, :cond_1d

    new-instance v1, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "could not parse list \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_47
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_4e

    return-object v2

    :cond_4e
    new-instance v0, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;

    const-string v1, "empty lists are not allowed"

    invoke-direct {v0, v1}, Lorg/dmfs/rfc5545/recur/InvalidRecurrenceRuleException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public serialize(Ljava/lang/StringBuilder;Ljava/lang/Object;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 8

    const/4 v0, 0x1

    check-cast p2, Ljava/util/Collection;

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    if-eqz v0, :cond_1a

    const/4 v0, 0x0

    :goto_14
    iget-object v3, p0, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ListValueConverter;->mElementConverter:Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;

    invoke-virtual {v3, p1, v2, p3}, Lorg/dmfs/rfc5545/recur/RecurrenceRule$ValueConverter;->serialize(Ljava/lang/StringBuilder;Ljava/lang/Object;Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V

    goto :goto_7

    :cond_1a
    const-string v3, ","

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_14

    :cond_20
    return-void
.end method
