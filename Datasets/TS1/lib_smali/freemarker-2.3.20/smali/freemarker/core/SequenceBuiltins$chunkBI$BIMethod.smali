.class Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$chunkBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethod"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/core/SequenceBuiltins$chunkBI;

.field private final tsm:Lfreemarker/template/TemplateSequenceModel;


# direct methods
.method private constructor <init>(Lfreemarker/core/SequenceBuiltins$chunkBI;Lfreemarker/template/TemplateSequenceModel;)V
    .registers 3
    .param p2, "tsm"    # Lfreemarker/template/TemplateSequenceModel;

    .prologue
    .line 717
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI;

    .line 718
    iput-object p2, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;->tsm:Lfreemarker/template/TemplateSequenceModel;

    .line 719
    return-void
.end method

.method constructor <init>(Lfreemarker/core/SequenceBuiltins$chunkBI;Lfreemarker/template/TemplateSequenceModel;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 4
    .param p1, "x0"    # Lfreemarker/core/SequenceBuiltins$chunkBI;
    .param p2, "x1"    # Lfreemarker/template/TemplateSequenceModel;
    .param p3, "x2"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 713
    invoke-direct {p0, p1, p2}, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;-><init>(Lfreemarker/core/SequenceBuiltins$chunkBI;Lfreemarker/template/TemplateSequenceModel;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 8
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x1

    .line 722
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI;

    const/4 v3, 0x2

    invoke-virtual {v1, p1, v5, v3}, Lfreemarker/core/SequenceBuiltins$chunkBI;->checkMethodArgCount(Ljava/util/List;II)V

    .line 723
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$chunkBI;

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v3}, Lfreemarker/core/SequenceBuiltins$chunkBI;->getNumberMethodArg(Ljava/util/List;I)Ljava/lang/Number;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 725
    .local v0, "chunkSize":I
    new-instance v3, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;

    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$chunkBI$BIMethod;->tsm:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v5, :cond_27

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/template/TemplateModel;

    :goto_23
    invoke-direct {v3, v4, v0, v1, v2}, Lfreemarker/core/SequenceBuiltins$chunkBI$ChunkedSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/SequenceBuiltins$1;)V

    return-object v3

    :cond_27
    move-object v1, v2

    goto :goto_23
.end method
