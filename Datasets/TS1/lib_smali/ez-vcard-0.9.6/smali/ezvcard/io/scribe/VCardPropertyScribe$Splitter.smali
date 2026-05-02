.class public Lezvcard/io/scribe/VCardPropertyScribe$Splitter;
.super Ljava/lang/Object;
.source "VCardPropertyScribe.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/scribe/VCardPropertyScribe;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Splitter"
.end annotation


# instance fields
.field private delimiter:C

.field private limit:I

.field private nullEmpties:Z

.field private unescape:Z


# direct methods
.method public constructor <init>(C)V
    .registers 3
    .param p1, "delimiter"    # C

    .prologue
    const/4 v0, 0x0

    .line 692
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 684
    iput-boolean v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->unescape:Z

    .line 685
    iput-boolean v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->nullEmpties:Z

    .line 686
    const/4 v0, -0x1

    iput v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->limit:I

    .line 693
    iput-char p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->delimiter:C

    .line 694
    return-void
.end method

.method private add(Ljava/lang/String;Ljava/util/List;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 768
    .local p2, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 770
    iget-boolean v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->nullEmpties:Z

    if-eqz v0, :cond_13

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_13

    .line 771
    const/4 p1, 0x0

    .line 776
    :cond_f
    :goto_f
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 777
    return-void

    .line 772
    :cond_13
    iget-boolean v0, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->unescape:Z

    if-eqz v0, :cond_f

    .line 773
    invoke-static {p1}, Lezvcard/io/scribe/VCardPropertyScribe;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_f
.end method


# virtual methods
.method public limit(I)Lezvcard/io/scribe/VCardPropertyScribe$Splitter;
    .registers 2
    .param p1, "limit"    # I

    .prologue
    .line 723
    iput p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->limit:I

    .line 724
    return-object p0
.end method

.method public nullEmpties(Z)Lezvcard/io/scribe/VCardPropertyScribe$Splitter;
    .registers 2
    .param p1, "nullEmpties"    # Z

    .prologue
    .line 713
    iput-boolean p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->nullEmpties:Z

    .line 714
    return-object p0
.end method

.method public split(Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .param p1, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 735
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 736
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 737
    .local v1, "escaped":Z
    const/4 v4, 0x0

    .line 738
    .local v4, "start":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_33

    .line 739
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 741
    .local v0, "ch":C
    if-eqz v1, :cond_18

    .line 742
    const/4 v1, 0x0

    .line 738
    :cond_15
    :goto_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 746
    :cond_18
    iget-char v5, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->delimiter:C

    if-ne v0, v5, :cond_3b

    .line 747
    invoke-virtual {p1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5, v3}, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->add(Ljava/lang/String;Ljava/util/List;)V

    .line 748
    add-int/lit8 v4, v2, 0x1

    .line 749
    iget v5, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->limit:I

    if-lez v5, :cond_15

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    iget v6, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->limit:I

    add-int/lit8 v6, v6, -0x1

    if-ne v5, v6, :cond_15

    .line 762
    .end local v0    # "ch":C
    :cond_33
    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5, v3}, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->add(Ljava/lang/String;Ljava/util/List;)V

    .line 764
    return-object v3

    .line 756
    .restart local v0    # "ch":C
    :cond_3b
    const/16 v5, 0x5c

    if-ne v0, v5, :cond_15

    .line 757
    const/4 v1, 0x1

    .line 758
    goto :goto_15
.end method

.method public unescape(Z)Lezvcard/io/scribe/VCardPropertyScribe$Splitter;
    .registers 2
    .param p1, "unescape"    # Z

    .prologue
    .line 702
    iput-boolean p1, p0, Lezvcard/io/scribe/VCardPropertyScribe$Splitter;->unescape:Z

    .line 703
    return-object p0
.end method
