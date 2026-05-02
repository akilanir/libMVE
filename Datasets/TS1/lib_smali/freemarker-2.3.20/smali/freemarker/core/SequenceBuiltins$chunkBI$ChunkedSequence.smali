.class Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$chunkBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ChunkedSequence"
.end annotation


# instance fields
.field private final chunkSize:I

.field private final fillerItem:Lfreemarker/template/TemplateModel;

.field private final numberOfChunks:I

.field private final wrappedTsm:Lfreemarker/template/TemplateSequenceModel;


# direct methods
.method private constructor <init>(Lfreemarker/template/TemplateSequenceModel;ILfreemarker/template/TemplateModel;)V
    .registers 8
    .param p1, "wrappedTsm"    # Lfreemarker/template/TemplateSequenceModel;
    .param p2, "chunkSize"    # I
    .param p3, "fillerItem"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 744
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 745
    if-ge p2, v1, :cond_13

    .line 746
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "The 1st argument to ?\', key, \' (...) must be at least 1."

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v0

    .line 749
    :cond_13
    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->wrappedTsm:Lfreemarker/template/TemplateSequenceModel;

    .line 750
    iput p2, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->chunkSize:I

    .line 751
    iput-object p3, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->fillerItem:Lfreemarker/template/TemplateModel;

    .line 752
    invoke-interface {p1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    add-int/2addr v0, p2

    add-int/lit8 v0, v0, -0x1

    div-int/2addr v0, p2

    iput v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->numberOfChunks:I

    .line 753
    return-void
.end method

.method constructor <init>(Lfreemarker/template/TemplateSequenceModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 5
    .param p1, "x0"    # Lfreemarker/template/TemplateSequenceModel;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lfreemarker/template/TemplateModel;
    .param p4, "x3"    # Lfreemarker/core/SequenceBuiltins$1;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 732
    invoke-direct {p0, p1, p2, p3}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;ILfreemarker/template/TemplateModel;)V

    return-void
.end method

.method static access$1500(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    .prologue
    .line 732
    iget v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->chunkSize:I

    return v0
.end method

.method static access$1600(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)Lfreemarker/template/TemplateSequenceModel;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    .prologue
    .line 732
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->wrappedTsm:Lfreemarker/template/TemplateSequenceModel;

    return-object v0
.end method

.method static access$1700(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)I
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    .prologue
    .line 732
    iget v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->numberOfChunks:I

    return v0
.end method

.method static access$1800(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;)Lfreemarker/template/TemplateModel;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    .prologue
    .line 732
    iget-object v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->fillerItem:Lfreemarker/template/TemplateModel;

    return-object v0
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "chunkIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 757
    iget v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->numberOfChunks:I

    if-lt p1, v0, :cond_6

    .line 758
    const/4 v0, 0x0

    .line 761
    :goto_5
    return-object v0

    :cond_6
    new-instance v0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence$1;-><init>(Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;I)V

    goto :goto_5
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 787
    iget v0, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;->numberOfChunks:I

    return v0
.end method
