.class Ljavassist/bytecode/StackMapTable$Printer;
.super Ljavassist/bytecode/StackMapTable$Walker;
.source "StackMapTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMapTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Printer"
.end annotation


# instance fields
.field private offset:I

.field private writer:Ljava/io/PrintWriter;


# direct methods
.method constructor <init>([BLjava/io/PrintWriter;)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 726
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMapTable$Walker;-><init>([B)V

    .line 727
    iput-object p2, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    .line 728
    const/4 v0, -0x1

    iput v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    .line 729
    return-void
.end method

.method public static print(Ljavassist/bytecode/StackMapTable;Ljava/io/PrintWriter;)V
    .registers 5
    .param p0, "smt"    # Ljavassist/bytecode/StackMapTable;
    .param p1, "writer"    # Ljava/io/PrintWriter;

    .prologue
    .line 718
    :try_start_0
    new-instance v1, Ljavassist/bytecode/StackMapTable$Printer;

    invoke-virtual {p0}, Ljavassist/bytecode/StackMapTable;->get()[B

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljavassist/bytecode/StackMapTable$Printer;-><init>([BLjava/io/PrintWriter;)V

    invoke-virtual {v1}, Ljavassist/bytecode/StackMapTable$Printer;->parse()V
    :try_end_c
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_0 .. :try_end_c} :catch_d

    .line 723
    :goto_c
    return-void

    .line 720
    :catch_d
    move-exception v0

    .line 721
    .local v0, "e":Ljavassist/bytecode/BadBytecode;
    invoke-virtual {v0}, Ljavassist/bytecode/BadBytecode;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_c
.end method

.method private printTypeInfo(II)V
    .registers 6
    .param p1, "tag"    # I
    .param p2, "data"    # I

    .prologue
    .line 768
    const/4 v0, 0x0

    .line 769
    .local v0, "msg":Ljava/lang/String;
    packed-switch p1, :pswitch_data_5a

    .line 799
    :goto_4
    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    const-string v2, "    "

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 800
    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    invoke-virtual {v1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 801
    return-void

    .line 771
    :pswitch_11
    const-string v0, "top"

    .line 772
    goto :goto_4

    .line 774
    :pswitch_14
    const-string v0, "integer"

    .line 775
    goto :goto_4

    .line 777
    :pswitch_17
    const-string v0, "float"

    .line 778
    goto :goto_4

    .line 780
    :pswitch_1a
    const-string v0, "double"

    .line 781
    goto :goto_4

    .line 783
    :pswitch_1d
    const-string v0, "long"

    .line 784
    goto :goto_4

    .line 786
    :pswitch_20
    const-string v0, "null"

    .line 787
    goto :goto_4

    .line 789
    :pswitch_23
    const-string v0, "this"

    .line 790
    goto :goto_4

    .line 792
    :pswitch_26
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "object (cpool_index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 793
    goto :goto_4

    .line 795
    :pswitch_40
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "uninitialized (offset "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 769
    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
        :pswitch_1d
        :pswitch_20
        :pswitch_23
        :pswitch_26
        :pswitch_40
    .end packed-switch
.end method


# virtual methods
.method public appendFrame(II[I[I)V
    .registers 9
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "tags"    # [I
    .param p4, "data"    # [I

    .prologue
    .line 748
    iget v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    add-int/lit8 v2, p2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    .line 749
    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " append frame: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 750
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_26
    array-length v1, p3

    if-ge v0, v1, :cond_33

    .line 751
    aget v1, p3, v0

    aget v2, p4, v0

    invoke-direct {p0, v1, v2}, Ljavassist/bytecode/StackMapTable$Printer;->printTypeInfo(II)V

    .line 750
    add-int/lit8 v0, v0, 0x1

    goto :goto_26

    .line 752
    :cond_33
    return-void
.end method

.method public chopFrame(III)V
    .registers 7
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "k"    # I

    .prologue
    .line 743
    iget v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    add-int/lit8 v1, p2, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    .line 744
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " chop frame: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ",    "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " last locals"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 745
    return-void
.end method

.method public fullFrame(II[I[I[I[I)V
    .registers 11
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "localTags"    # [I
    .param p4, "localData"    # [I
    .param p5, "stackTags"    # [I
    .param p6, "stackData"    # [I

    .prologue
    .line 756
    iget v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    add-int/lit8 v2, p2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    .line 757
    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget v3, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " full frame: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 758
    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    const-string v2, "[locals]"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 759
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2d
    array-length v1, p3

    if-ge v0, v1, :cond_3a

    .line 760
    aget v1, p3, v0

    aget v2, p4, v0

    invoke-direct {p0, v1, v2}, Ljavassist/bytecode/StackMapTable$Printer;->printTypeInfo(II)V

    .line 759
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 762
    :cond_3a
    iget-object v1, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    const-string v2, "[stack]"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 763
    const/4 v0, 0x0

    :goto_42
    array-length v1, p5

    if-ge v0, v1, :cond_4f

    .line 764
    aget v1, p5, v0

    aget v2, p6, v0

    invoke-direct {p0, v1, v2}, Ljavassist/bytecode/StackMapTable$Printer;->printTypeInfo(II)V

    .line 763
    add-int/lit8 v0, v0, 0x1

    goto :goto_42

    .line 765
    :cond_4f
    return-void
.end method

.method public sameFrame(II)V
    .registers 6
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I

    .prologue
    .line 732
    iget v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    add-int/lit8 v1, p2, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    .line 733
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " same frame: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 734
    return-void
.end method

.method public sameLocals(IIII)V
    .registers 8
    .param p1, "pos"    # I
    .param p2, "offsetDelta"    # I
    .param p3, "stackTag"    # I
    .param p4, "stackData"    # I

    .prologue
    .line 737
    iget v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    add-int/lit8 v1, p2, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    .line 738
    iget-object v0, p0, Ljavassist/bytecode/StackMapTable$Printer;->writer:Ljava/io/PrintWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Ljavassist/bytecode/StackMapTable$Printer;->offset:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " same locals: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 739
    invoke-direct {p0, p3, p4}, Ljavassist/bytecode/StackMapTable$Printer;->printTypeInfo(II)V

    .line 740
    return-void
.end method
