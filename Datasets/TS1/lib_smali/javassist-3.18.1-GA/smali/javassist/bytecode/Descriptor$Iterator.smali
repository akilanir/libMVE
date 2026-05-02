.class public Ljavassist/bytecode/Descriptor$Iterator;
.super Ljava/lang/Object;
.source "Descriptor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/Descriptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Iterator"
.end annotation


# instance fields
.field private curPos:I

.field private desc:Ljava/lang/String;

.field private index:I

.field private param:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 806
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 807
    iput-object p1, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    .line 808
    iput v0, p0, Ljavassist/bytecode/Descriptor$Iterator;->curPos:I

    iput v0, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    .line 809
    iput-boolean v0, p0, Ljavassist/bytecode/Descriptor$Iterator;->param:Z

    .line 810
    return-void
.end method


# virtual methods
.method public currentChar()C
    .registers 3

    .prologue
    .line 827
    iget-object v0, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    iget v1, p0, Ljavassist/bytecode/Descriptor$Iterator;->curPos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public hasNext()Z
    .registers 3

    .prologue
    .line 816
    iget v0, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    iget-object v1, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public is2byte()Z
    .registers 3

    .prologue
    .line 833
    invoke-virtual {p0}, Ljavassist/bytecode/Descriptor$Iterator;->currentChar()C

    move-result v0

    .line 834
    .local v0, "c":C
    const/16 v1, 0x44

    if-eq v0, v1, :cond_c

    const/16 v1, 0x4a

    if-ne v0, v1, :cond_e

    :cond_c
    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public isParameter()Z
    .registers 2

    .prologue
    .line 822
    iget-boolean v0, p0, Ljavassist/bytecode/Descriptor$Iterator;->param:Z

    return v0
.end method

.method public next()I
    .registers 5

    .prologue
    .line 842
    iget v1, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    .line 843
    .local v1, "nextPos":I
    iget-object v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 844
    .local v0, "c":C
    const/16 v2, 0x28

    if-ne v0, v2, :cond_1d

    .line 845
    iget v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    .line 846
    iget-object v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 847
    const/4 v2, 0x1

    iput-boolean v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->param:Z

    .line 850
    :cond_1d
    const/16 v2, 0x29

    if-ne v0, v2, :cond_32

    .line 851
    iget v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    .line 852
    iget-object v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 853
    const/4 v2, 0x0

    iput-boolean v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->param:Z

    .line 856
    :cond_32
    :goto_32
    const/16 v2, 0x5b

    if-ne v0, v2, :cond_3f

    .line 857
    iget-object v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_32

    .line 859
    :cond_3f
    const/16 v2, 0x4c

    if-ne v0, v2, :cond_57

    .line 860
    iget-object v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->desc:Ljava/lang/String;

    const/16 v3, 0x3b

    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 861
    if-gtz v1, :cond_59

    .line 862
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    const-string v3, "bad descriptor"

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 865
    :cond_57
    add-int/lit8 v1, v1, 0x1

    .line 867
    :cond_59
    iget v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    iput v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->curPos:I

    .line 868
    iput v1, p0, Ljavassist/bytecode/Descriptor$Iterator;->index:I

    .line 869
    iget v2, p0, Ljavassist/bytecode/Descriptor$Iterator;->curPos:I

    return v2
.end method
