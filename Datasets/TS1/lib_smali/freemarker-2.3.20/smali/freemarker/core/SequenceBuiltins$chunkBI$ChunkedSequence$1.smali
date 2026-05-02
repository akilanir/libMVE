.class Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# instance fields
.field private final baseIndex:I

.field private final this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

.field private final val$chunkIndex:I


# direct methods
.method constructor <init>(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;I)V
    .registers 5

    .prologue
    .line 761
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    iput p2, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->val$chunkIndex:I

    .line 763
    iget v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->val$chunkIndex:I

    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v1}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1500(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)I

    move-result v1

    mul-int/2addr v0, v1

    iput v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->baseIndex:I

    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "relIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 767
    iget v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->baseIndex:I

    add-int v0, v1, p1

    .line 768
    .local v0, "absIndex":I
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v1}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1600(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v1

    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v1

    if-ge v0, v1, :cond_1b

    .line 769
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v1}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1600(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v1

    invoke-interface {v1, v0}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 771
    :goto_1a
    return-object v1

    :cond_1b
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v1}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1700(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)I

    move-result v1

    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v2}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1500(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)I

    move-result v2

    mul-int/2addr v1, v2

    if-ge v0, v1, :cond_31

    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v1}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1800(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_1a

    :cond_31
    const/4 v1, 0x0

    goto :goto_1a
.end method

.method public size()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 778
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v0}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1800(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    if-nez v0, :cond_14

    iget v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->val$chunkIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v1}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1700(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)I

    move-result v1

    if-ge v0, v1, :cond_1b

    :cond_14
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v0}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1500(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)I

    move-result v0

    :goto_1a
    return v0

    :cond_1b
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    invoke-static {v0}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->access$1600(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v0

    invoke-interface {v0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    iget v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;->baseIndex:I

    sub-int/2addr v0, v1

    goto :goto_1a
.end method
