.class final Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;
.super Lfreemarker/core/AddConcatExpression$ConcatenatedHash;
.source "AddConcatExpression.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/AddConcatExpression;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ConcatenatedHashEx"
.end annotation


# instance fields
.field private keys:Lfreemarker/core/CollectionAndSequence;

.field private size:I

.field private values:Lfreemarker/core/CollectionAndSequence;


# direct methods
.method constructor <init>(Lfreemarker/template/TemplateHashModelEx;Lfreemarker/template/TemplateHashModelEx;)V
    .registers 3
    .param p1, "left"    # Lfreemarker/template/TemplateHashModelEx;
    .param p2, "right"    # Lfreemarker/template/TemplateHashModelEx;

    .prologue
    .line 234
    invoke-direct {p0, p1, p2}, Lfreemarker/core/AddConcatExpression$ConcatenatedHash;-><init>(Lfreemarker/template/TemplateHashModel;Lfreemarker/template/TemplateHashModel;)V

    .line 235
    return-void
.end method

.method private static addKeys(Ljava/util/Set;Lfreemarker/template/SimpleSequence;Lfreemarker/template/TemplateHashModelEx;)V
    .registers 6
    .param p0, "set"    # Ljava/util/Set;
    .param p1, "keySeq"    # Lfreemarker/template/SimpleSequence;
    .param p2, "hash"    # Lfreemarker/template/TemplateHashModelEx;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-interface {p2}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v2

    invoke-interface {v2}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v0

    .line 274
    .local v0, "it":Lfreemarker/template/TemplateModelIterator;
    :cond_8
    :goto_8
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 275
    invoke-interface {v0}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v1

    check-cast v1, Lfreemarker/template/TemplateScalarModel;

    .line 276
    .local v1, "tsm":Lfreemarker/template/TemplateScalarModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 279
    invoke-virtual {p1, v1}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    goto :goto_8

    .line 282
    .end local v1    # "tsm":Lfreemarker/template/TemplateScalarModel;
    :cond_22
    return-void
.end method

.method private initKeys()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 260
    iget-object v2, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->keys:Lfreemarker/core/CollectionAndSequence;

    if-nez v2, :cond_2b

    .line 261
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 262
    .local v1, "keySet":Ljava/util/HashSet;
    new-instance v0, Lfreemarker/template/SimpleSequence;

    const/16 v2, 0x20

    invoke-direct {v0, v2}, Lfreemarker/template/SimpleSequence;-><init>(I)V

    .line 263
    .local v0, "keySeq":Lfreemarker/template/SimpleSequence;
    iget-object v2, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->left:Lfreemarker/template/TemplateHashModel;

    check-cast v2, Lfreemarker/template/TemplateHashModelEx;

    invoke-static {v1, v0, v2}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->addKeys(Ljava/util/Set;Lfreemarker/template/SimpleSequence;Lfreemarker/template/TemplateHashModelEx;)V

    .line 264
    iget-object v2, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->right:Lfreemarker/template/TemplateHashModel;

    check-cast v2, Lfreemarker/template/TemplateHashModelEx;

    invoke-static {v1, v0, v2}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->addKeys(Ljava/util/Set;Lfreemarker/template/SimpleSequence;Lfreemarker/template/TemplateHashModelEx;)V

    .line 265
    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v2

    iput v2, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->size:I

    .line 266
    new-instance v2, Lfreemarker/core/CollectionAndSequence;

    invoke-direct {v2, v0}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    iput-object v2, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->keys:Lfreemarker/core/CollectionAndSequence;

    .line 268
    .end local v0    # "keySeq":Lfreemarker/template/SimpleSequence;
    .end local v1    # "keySet":Ljava/util/HashSet;
    :cond_2b
    return-void
.end method

.method private initValues()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 287
    iget-object v3, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->values:Lfreemarker/core/CollectionAndSequence;

    if-nez v3, :cond_33

    .line 288
    new-instance v2, Lfreemarker/template/SimpleSequence;

    invoke-virtual {p0}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->size()I

    move-result v3

    invoke-direct {v2, v3}, Lfreemarker/template/SimpleSequence;-><init>(I)V

    .line 291
    .local v2, "seq":Lfreemarker/template/SimpleSequence;
    iget-object v3, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->keys:Lfreemarker/core/CollectionAndSequence;

    invoke-virtual {v3}, Lfreemarker/core/CollectionAndSequence;->size()I

    move-result v1

    .line 292
    .local v1, "ln":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_14
    if-ge v0, v1, :cond_2c

    .line 293
    iget-object v3, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->keys:Lfreemarker/core/CollectionAndSequence;

    invoke-virtual {v3, v0}, Lfreemarker/core/CollectionAndSequence;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v3

    check-cast v3, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v3}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    invoke-virtual {v2, v3}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    .line 292
    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    .line 295
    :cond_2c
    new-instance v3, Lfreemarker/core/CollectionAndSequence;

    invoke-direct {v3, v2}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    iput-object v3, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->values:Lfreemarker/core/CollectionAndSequence;

    .line 297
    .end local v0    # "i":I
    .end local v1    # "ln":I
    .end local v2    # "seq":Lfreemarker/template/SimpleSequence;
    :cond_33
    return-void
.end method


# virtual methods
.method public keys()Lfreemarker/template/TemplateCollectionModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-direct {p0}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->initKeys()V

    .line 247
    iget-object v0, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->keys:Lfreemarker/core/CollectionAndSequence;

    return-object v0
.end method

.method public size()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 239
    invoke-direct {p0}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->initKeys()V

    .line 240
    iget v0, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->size:I

    return v0
.end method

.method public values()Lfreemarker/template/TemplateCollectionModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 253
    invoke-direct {p0}, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->initValues()V

    .line 254
    iget-object v0, p0, Lfreemarker/core/AddConcatExpression$ConcatenatedHashEx;->values:Lfreemarker/core/CollectionAndSequence;

    return-object v0
.end method
