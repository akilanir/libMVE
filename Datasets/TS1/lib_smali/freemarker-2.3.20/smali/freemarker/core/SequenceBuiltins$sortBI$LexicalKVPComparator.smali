.class Lfreemarker/core/SequenceBuiltins$sortBI$LexicalKVPComparator;
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
    name = "LexicalKVPComparator"
.end annotation


# instance fields
.field private collator:Ljava/text/Collator;


# direct methods
.method constructor <init>(Ljava/text/Collator;)V
    .registers 2
    .param p1, "collator"    # Ljava/text/Collator;

    .prologue
    .line 390
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 391
    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$sortBI$LexicalKVPComparator;->collator:Ljava/text/Collator;

    .line 392
    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 6
    .param p1, "arg0"    # Ljava/lang/Object;
    .param p2, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 395
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$sortBI$LexicalKVPComparator;->collator:Ljava/text/Collator;

    check-cast p1, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p1    # "arg0":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v1

    check-cast p2, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    .end local p2    # "arg1":Ljava/lang/Object;
    invoke-static {p2}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$700(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/text/Collator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method
