.class Lorg/joda/time/tz/ZoneInfoCompiler$RuleSet;
.super Ljava/lang/Object;
.source "ZoneInfoCompiler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/tz/ZoneInfoCompiler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RuleSet"
.end annotation


# instance fields
.field private iRules:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/joda/time/tz/ZoneInfoCompiler$Rule;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lorg/joda/time/tz/ZoneInfoCompiler$Rule;)V
    .registers 3

    .prologue
    .line 720
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 721
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$RuleSet;->iRules:Ljava/util/List;

    .line 722
    iget-object v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$RuleSet;->iRules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 723
    return-void
.end method


# virtual methods
.method public addRecurring(Lorg/joda/time/tz/DateTimeZoneBuilder;Ljava/lang/String;)V
    .registers 5

    .prologue
    .line 736
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$RuleSet;->iRules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_19

    .line 737
    iget-object v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$RuleSet;->iRules:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/ZoneInfoCompiler$Rule;

    .line 738
    invoke-virtual {v0, p1, p2}, Lorg/joda/time/tz/ZoneInfoCompiler$Rule;->addRecurring(Lorg/joda/time/tz/DateTimeZoneBuilder;Ljava/lang/String;)V

    .line 736
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_2

    .line 740
    :cond_19
    return-void
.end method

.method addRule(Lorg/joda/time/tz/ZoneInfoCompiler$Rule;)V
    .registers 5

    .prologue
    .line 726
    iget-object v1, p1, Lorg/joda/time/tz/ZoneInfoCompiler$Rule;->iName:Ljava/lang/String;

    iget-object v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$RuleSet;->iRules:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/ZoneInfoCompiler$Rule;

    iget-object v0, v0, Lorg/joda/time/tz/ZoneInfoCompiler$Rule;->iName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1b

    .line 727
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Rule name mismatch"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 729
    :cond_1b
    iget-object v0, p0, Lorg/joda/time/tz/ZoneInfoCompiler$RuleSet;->iRules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 730
    return-void
.end method
