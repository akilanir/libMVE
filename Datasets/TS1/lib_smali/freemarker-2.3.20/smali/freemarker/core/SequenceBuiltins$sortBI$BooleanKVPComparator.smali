.class Lfreemarker/core/SequenceBuiltins$sortBI$BooleanKVPComparator;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$sortBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BooleanKVPComparator"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 408
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 408
    invoke-direct {p0}, Lfreemarker/core/SequenceBuiltins$sortBI$BooleanKVPComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7
    .param p1, "arg0"    # Ljava/lang/Object;
    .param p2, "arg1"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 412
    check-cast p1, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p1    # "arg0":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 413
    .local v0, "b0":Z
    check-cast p2, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p2    # "arg1":Ljava/lang/Object;
    invoke-static {p2}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 414
    .local v1, "b1":Z
    if-eqz v0, :cond_21

    .line 415
    if-eqz v1, :cond_1f

    move v2, v3

    .line 417
    :goto_1e
    return v2

    .line 415
    :cond_1f
    const/4 v2, 0x1

    goto :goto_1e

    .line 417
    :cond_21
    if-eqz v1, :cond_24

    const/4 v3, -0x1

    :cond_24
    move v2, v3

    goto :goto_1e
.end method
