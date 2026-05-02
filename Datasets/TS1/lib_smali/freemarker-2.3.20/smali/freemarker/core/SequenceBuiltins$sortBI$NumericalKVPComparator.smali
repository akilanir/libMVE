.class Lfreemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$sortBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NumericalKVPComparator"
.end annotation


# instance fields
.field private ae:Lfreemarker/core/ArithmeticEngine;


# direct methods
.method private constructor <init>(Lfreemarker/core/ArithmeticEngine;)V
    .registers 2
    .param p1, "ae"    # Lfreemarker/core/ArithmeticEngine;

    .prologue
    .line 371
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 372
    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator;->ae:Lfreemarker/core/ArithmeticEngine;

    .line 373
    return-void
.end method

.method constructor <init>(Lfreemarker/core/ArithmeticEngine;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/core/ArithmeticEngine;
    .param p2, "x1"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 368
    invoke-direct {p0, p1}, Lfreemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator;-><init>(Lfreemarker/core/ArithmeticEngine;)V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7
    .param p1, "arg0"    # Ljava/lang/Object;
    .param p2, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 377
    :try_start_0
    iget-object v3, p0, Lfreemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator;->ae:Lfreemarker/core/ArithmeticEngine;

    check-cast p1, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p1    # "arg0":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    check-cast p2, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p2    # "arg1":Ljava/lang/Object;
    invoke-static {p2}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v3, v1, v2}, Lfreemarker/core/ArithmeticEngine;->compareNumbers(Ljava/lang/Number;Ljava/lang/Number;)I
    :try_end_15
    .catch Lfreemarker/template/TemplateException; {:try_start_0 .. :try_end_15} :catch_17

    move-result v1

    return v1

    .line 380
    :catch_17
    move-exception v0

    .line 381
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v1, Ljava/lang/ClassCastException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Failed to compare numbers: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
