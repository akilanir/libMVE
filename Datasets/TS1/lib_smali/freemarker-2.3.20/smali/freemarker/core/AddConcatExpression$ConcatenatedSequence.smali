.class final Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;
.super Ljava/lang/Object;
.source "AddConcatExpression.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/AddConcatExpression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ConcatenatedSequence"
.end annotation


# instance fields
.field private final left:Lfreemarker/template/TemplateSequenceModel;

.field private final right:Lfreemarker/template/TemplateSequenceModel;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateSequenceModel;Lfreemarker/template/TemplateSequenceModel;)V
    .registers 3
    .param p1, "left"    # Lfreemarker/template/TemplateSequenceModel;
    .param p2, "right"    # Lfreemarker/template/TemplateSequenceModel;

    .prologue
    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 178
    iput-object p1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;->left:Lfreemarker/template/TemplateSequenceModel;

    .line 179
    iput-object p2, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;->right:Lfreemarker/template/TemplateSequenceModel;

    .line 180
    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 193
    iget-object v1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;->left:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    .line 194
    .local v0, "ls":I
    if-ge p1, v0, :cond_f

    iget-object v1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;->left:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    :goto_e
    return-object v1

    :cond_f
    iget-object v1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;->right:Lfreemarker/template/TemplateSequenceModel;

    sub-int v2, p1, v0

    invoke-interface {v1, v2}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_e
.end method

.method public size()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 186
    iget-object v0, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;->left:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    iget-object v1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedSequence;->right:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
