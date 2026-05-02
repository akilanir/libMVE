.class Lfreemarker/core/AddConcatExpression$ConcatenatedHash;
.super Ljava/lang/Object;
.source "AddConcatExpression.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/AddConcatExpression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConcatenatedHash"
.end annotation


# instance fields
.field protected final left:Lfreemarker/template/TemplateHashModel;

.field protected final right:Lfreemarker/template/TemplateHashModel;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateHashModel;Lfreemarker/template/TemplateHashModel;)V
    .registers 3
    .param p1, "left"    # Lfreemarker/template/TemplateHashModel;
    .param p2, "right"    # Lfreemarker/template/TemplateHashModel;

    .prologue
    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 206
    iput-object p1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;->left:Lfreemarker/template/TemplateHashModel;

    .line 207
    iput-object p2, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;->right:Lfreemarker/template/TemplateHashModel;

    .line 208
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 213
    iget-object v1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;->right:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 214
    .local v0, "model":Lfreemarker/template/TemplateModel;
    if-eqz v0, :cond_9

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    :goto_8
    return-object v0

    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_9
    iget-object v1, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;->left:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_8
.end method

.method public isEmpty()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 220
    iget-object v0, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;->left:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateHashModel;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;->right:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v0}, Lfreemarker/template/TemplateHashModel;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method
