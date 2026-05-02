.class Lfreemarker/core/SequenceBuiltins$sortBI$DateKVPComparator;
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
    name = "DateKVPComparator"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 400
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 400
    invoke-direct {p0}, Lfreemarker/core/SequenceBuiltins$sortBI$DateKVPComparator;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5
    .param p1, "arg0"    # Ljava/lang/Object;
    .param p2, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 403
    check-cast p1, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p1    # "arg0":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    check-cast p2, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p2    # "arg1":Ljava/lang/Object;
    invoke-static {p2}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    move-result v0

    return v0
.end method
