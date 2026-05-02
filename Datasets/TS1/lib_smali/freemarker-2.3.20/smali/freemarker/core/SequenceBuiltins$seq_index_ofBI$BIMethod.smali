.class Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field protected final m_col:Lfreemarker/template/TemplateCollectionModel;

.field protected final m_env:Lfreemarker/core/Environment;

.field protected final m_seq:Lfreemarker/template/TemplateSequenceModel;

.field private final this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;Lfreemarker/core/Environment;)V
    .registers 7
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 567
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    .line 568
    iget-object v1, p1, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p2}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 569
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_3a

    invoke-static {v0}, Lfreemarker/core/SequenceBuiltins;->access$800(Lfreemarker/template/TemplateModel;)Z

    move-result v1

    if-nez v1, :cond_3a

    move-object v1, v0

    check-cast v1, Lfreemarker/template/TemplateSequenceModel;

    :goto_19
    iput-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    .line 580
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    if-nez v1, :cond_3c

    instance-of v1, v0, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v1, :cond_3c

    move-object v1, v0

    check-cast v1, Lfreemarker/template/TemplateCollectionModel;

    :goto_26
    iput-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_col:Lfreemarker/template/TemplateCollectionModel;

    .line 583
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    if-nez v1, :cond_3e

    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_col:Lfreemarker/template/TemplateCollectionModel;

    if-nez v1, :cond_3e

    .line 584
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p1, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->target:Lfreemarker/core/Expression;

    const-string v3, "sequence or collection"

    invoke-direct {v1, v2, v0, v3, p2}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1

    :cond_3a
    move-object v1, v2

    .line 569
    goto :goto_19

    :cond_3c
    move-object v1, v2

    .line 580
    goto :goto_26

    .line 587
    :cond_3e
    iput-object p2, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_env:Lfreemarker/core/Environment;

    .line 588
    return-void
.end method

.method constructor <init>(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;Lfreemarker/core/Environment;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;
    .param p2, "x1"    # Lfreemarker/core/Environment;
    .param p3, "x2"    # Lfreemarker/core/SequenceBuiltins$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 560
    invoke-direct {p0, p1, p2}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;-><init>(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;Lfreemarker/core/Environment;)V

    return-void
.end method

.method private findInSeq(Lfreemarker/template/TemplateModel;I)I
    .registers 7
    .param p1, "target"    # Lfreemarker/template/TemplateModel;
    .param p2, "startIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 630
    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v2}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    .line 632
    .local v0, "seqSize":I
    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    invoke-static {v2}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->access$1200(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1b

    .line 633
    if-lt p2, v0, :cond_13

    .line 648
    :goto_12
    return v1

    .line 636
    :cond_13
    if-gez p2, :cond_16

    .line 637
    const/4 p2, 0x0

    .line 648
    :cond_16
    invoke-direct {p0, p1, p2, v0}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInSeq(Lfreemarker/template/TemplateModel;II)I

    move-result v1

    goto :goto_12

    .line 640
    :cond_1b
    if-lt p2, v0, :cond_1f

    .line 641
    add-int/lit8 p2, v0, -0x1

    .line 643
    :cond_1f
    if-gez p2, :cond_16

    goto :goto_12
.end method

.method private findInSeq(Lfreemarker/template/TemplateModel;II)I
    .registers 7
    .param p1, "target"    # Lfreemarker/template/TemplateModel;
    .param p2, "scanStartIndex"    # I
    .param p3, "seqSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 654
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    invoke-static {v1}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->access$1200(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1f

    .line 655
    move v0, p2

    .local v0, "i":I
    :goto_a
    if-ge v0, p3, :cond_35

    .line 656
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1, v0}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_env:Lfreemarker/core/Environment;

    invoke-static {v0, v1, p1, v2}, Lfreemarker/core/SequenceBuiltins;->modelsEqual(ILfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v1

    if-eqz v1, :cond_1c

    move v1, v0

    .line 663
    :goto_1b
    return v1

    .line 655
    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 659
    .end local v0    # "i":I
    :cond_1f
    move v0, p2

    .restart local v0    # "i":I
    :goto_20
    if-ltz v0, :cond_35

    .line 660
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1, v0}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_env:Lfreemarker/core/Environment;

    invoke-static {v0, v1, p1, v2}, Lfreemarker/core/SequenceBuiltins;->modelsEqual(ILfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v1

    if-eqz v1, :cond_32

    move v1, v0

    goto :goto_1b

    .line 659
    :cond_32
    add-int/lit8 v0, v0, -0x1

    goto :goto_20

    .line 663
    :cond_35
    const/4 v1, -0x1

    goto :goto_1b
.end method


# virtual methods
.method public final exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 9
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 592
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 593
    .local v0, "argCnt":I
    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    const/4 v5, 0x2

    invoke-virtual {v4, v0, v6, v5}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->checkMethodArgCount(III)V

    .line 595
    const/4 v4, 0x0

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/template/TemplateModel;

    .line 597
    .local v3, "target":Lfreemarker/template/TemplateModel;
    if-le v0, v6, :cond_31

    .line 598
    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    invoke-virtual {v4, p1, v6}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->getNumberMethodArg(Ljava/util/List;I)Ljava/lang/Number;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 601
    .local v2, "startIndex":I
    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    if-eqz v4, :cond_2c

    invoke-direct {p0, v3, v2}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInSeq(Lfreemarker/template/TemplateModel;I)I

    move-result v1

    .line 611
    .end local v2    # "startIndex":I
    .local v1, "foundAtIdx":I
    :goto_26
    const/4 v4, -0x1

    if-ne v1, v4, :cond_3f

    sget-object v4, Lfreemarker/template/utility/Constants;->MINUS_ONE:Lfreemarker/template/TemplateNumberModel;

    :goto_2b
    return-object v4

    .line 601
    .end local v1    # "foundAtIdx":I
    .restart local v2    # "startIndex":I
    :cond_2c
    invoke-virtual {p0, v3, v2}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInCol(Lfreemarker/template/TemplateModel;I)I

    move-result v1

    goto :goto_26

    .line 607
    .end local v2    # "startIndex":I
    :cond_31
    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    if-eqz v4, :cond_3a

    invoke-virtual {p0, v3}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInSeq(Lfreemarker/template/TemplateModel;)I

    move-result v1

    .restart local v1    # "foundAtIdx":I
    :goto_39
    goto :goto_26

    .end local v1    # "foundAtIdx":I
    :cond_3a
    invoke-virtual {p0, v3}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInCol(Lfreemarker/template/TemplateModel;)I

    move-result v1

    goto :goto_39

    .line 611
    .restart local v1    # "foundAtIdx":I
    :cond_3f
    new-instance v4, Lfreemarker/template/SimpleNumber;

    invoke-direct {v4, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    goto :goto_2b
.end method

.method public findInCol(Lfreemarker/template/TemplateModel;)I
    .registers 4
    .param p1, "target"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 667
    const/4 v0, 0x0

    const v1, 0x7fffffff

    invoke-virtual {p0, p1, v0, v1}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInCol(Lfreemarker/template/TemplateModel;II)I

    move-result v0

    return v0
.end method

.method protected findInCol(Lfreemarker/template/TemplateModel;I)I
    .registers 5
    .param p1, "target"    # Lfreemarker/template/TemplateModel;
    .param p2, "startIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 672
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    invoke-static {v0}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->access$1200(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    .line 673
    const v0, 0x7fffffff

    invoke-virtual {p0, p1, p2, v0}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInCol(Lfreemarker/template/TemplateModel;II)I

    move-result v0

    .line 675
    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInCol(Lfreemarker/template/TemplateModel;II)I

    move-result v0

    goto :goto_10
.end method

.method protected findInCol(Lfreemarker/template/TemplateModel;II)I
    .registers 10
    .param p1, "target"    # Lfreemarker/template/TemplateModel;
    .param p2, "allowedRangeStart"    # I
    .param p3, "allowedRangeEnd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 682
    if-gez p3, :cond_4

    const/4 v1, -0x1

    .line 701
    :cond_3
    return v1

    .line 684
    :cond_4
    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_col:Lfreemarker/template/TemplateCollectionModel;

    invoke-interface {v4}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v3

    .line 686
    .local v3, "it":Lfreemarker/template/TemplateModelIterator;
    const/4 v1, -0x1

    .line 687
    .local v1, "foundAtIdx":I
    const/4 v2, 0x0

    .line 688
    .local v2, "idx":I
    :goto_c
    invoke-interface {v3}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 689
    if-gt v2, p3, :cond_3

    .line 691
    invoke-interface {v3}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 692
    .local v0, "current":Lfreemarker/template/TemplateModel;
    if-lt v2, p2, :cond_2c

    .line 693
    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_env:Lfreemarker/core/Environment;

    invoke-static {v2, v0, p1, v4}, Lfreemarker/core/SequenceBuiltins;->modelsEqual(ILfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 694
    move v1, v2

    .line 695
    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    invoke-static {v4}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->access$1200(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;)I

    move-result v4

    const/4 v5, 0x1

    if-eq v4, v5, :cond_3

    .line 699
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    .line 700
    goto :goto_c
.end method

.method public findInSeq(Lfreemarker/template/TemplateModel;)I
    .registers 6
    .param p1, "target"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 616
    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v2}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v1

    .line 619
    .local v1, "seqSize":I
    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;

    invoke-static {v2}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;->access$1200(Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_15

    .line 620
    const/4 v0, 0x0

    .line 625
    .local v0, "actualStartIndex":I
    :goto_10
    invoke-direct {p0, p1, v0, v1}, Lfreemarker/core/SequenceBuiltins$seq_index_ofBI$BIMethod;->findInSeq(Lfreemarker/template/TemplateModel;II)I

    move-result v2

    return v2

    .line 622
    .end local v0    # "actualStartIndex":I
    :cond_15
    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "actualStartIndex":I
    goto :goto_10
.end method
