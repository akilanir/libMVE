.class Lorg/simpleframework/xml/core/StructureBuilder;
.super Ljava/lang/Object;
.source "StructureBuilder.java"


# instance fields
.field private assembler:Lorg/simpleframework/xml/core/ModelAssembler;

.field private attributes:Lorg/simpleframework/xml/core/LabelMap;

.field private builder:Lorg/simpleframework/xml/core/ExpressionBuilder;

.field private elements:Lorg/simpleframework/xml/core/LabelMap;

.field private factory:Lorg/simpleframework/xml/core/Instantiator;

.field private primitive:Z

.field private resolver:Lorg/simpleframework/xml/core/InstantiatorBuilder;

.field private root:Lorg/simpleframework/xml/core/Model;

.field private scanner:Lorg/simpleframework/xml/core/Scanner;

.field private support:Lorg/simpleframework/xml/core/Support;

.field private text:Lorg/simpleframework/xml/core/Label;

.field private texts:Lorg/simpleframework/xml/core/LabelMap;

.field private version:Lorg/simpleframework/xml/core/Label;


# direct methods
.method public constructor <init>(Lorg/simpleframework/xml/core/Scanner;Lorg/simpleframework/xml/core/Detail;Lorg/simpleframework/xml/core/Support;)V
    .registers 6
    .param p1, "scanner"    # Lorg/simpleframework/xml/core/Scanner;
    .param p2, "detail"    # Lorg/simpleframework/xml/core/Detail;
    .param p3, "support"    # Lorg/simpleframework/xml/core/Support;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    new-instance v0, Lorg/simpleframework/xml/core/ExpressionBuilder;

    invoke-direct {v0, p2, p3}, Lorg/simpleframework/xml/core/ExpressionBuilder;-><init>(Lorg/simpleframework/xml/core/Detail;Lorg/simpleframework/xml/core/Support;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->builder:Lorg/simpleframework/xml/core/ExpressionBuilder;

    .line 134
    new-instance v0, Lorg/simpleframework/xml/core/ModelAssembler;

    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->builder:Lorg/simpleframework/xml/core/ExpressionBuilder;

    invoke-direct {v0, v1, p2, p3}, Lorg/simpleframework/xml/core/ModelAssembler;-><init>(Lorg/simpleframework/xml/core/ExpressionBuilder;Lorg/simpleframework/xml/core/Detail;Lorg/simpleframework/xml/core/Support;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->assembler:Lorg/simpleframework/xml/core/ModelAssembler;

    .line 135
    new-instance v0, Lorg/simpleframework/xml/core/InstantiatorBuilder;

    invoke-direct {v0, p1, p2}, Lorg/simpleframework/xml/core/InstantiatorBuilder;-><init>(Lorg/simpleframework/xml/core/Scanner;Lorg/simpleframework/xml/core/Detail;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->resolver:Lorg/simpleframework/xml/core/InstantiatorBuilder;

    .line 136
    new-instance v0, Lorg/simpleframework/xml/core/TreeModel;

    invoke-direct {v0, p1, p2}, Lorg/simpleframework/xml/core/TreeModel;-><init>(Lorg/simpleframework/xml/core/Policy;Lorg/simpleframework/xml/core/Detail;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    .line 137
    new-instance v0, Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {v0, p1}, Lorg/simpleframework/xml/core/LabelMap;-><init>(Lorg/simpleframework/xml/core/Policy;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->attributes:Lorg/simpleframework/xml/core/LabelMap;

    .line 138
    new-instance v0, Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {v0, p1}, Lorg/simpleframework/xml/core/LabelMap;-><init>(Lorg/simpleframework/xml/core/Policy;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    .line 139
    new-instance v0, Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {v0, p1}, Lorg/simpleframework/xml/core/LabelMap;-><init>(Lorg/simpleframework/xml/core/Policy;)V

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->texts:Lorg/simpleframework/xml/core/LabelMap;

    .line 140
    iput-object p1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->scanner:Lorg/simpleframework/xml/core/Scanner;

    .line 141
    iput-object p3, p0, Lorg/simpleframework/xml/core/StructureBuilder;->support:Lorg/simpleframework/xml/core/Support;

    .line 142
    return-void
.end method

.method private create(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;
    .registers 7
    .param p1, "path"    # Lorg/simpleframework/xml/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 455
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    .line 457
    .local v1, "model":Lorg/simpleframework/xml/core/Model;
    :goto_2
    if-eqz v1, :cond_1c

    .line 458
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Expression;->getPrefix()Ljava/lang/String;

    move-result-object v3

    .line 459
    .local v3, "prefix":Ljava/lang/String;
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Expression;->getFirst()Ljava/lang/String;

    move-result-object v2

    .line 460
    .local v2, "name":Ljava/lang/String;
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Expression;->getIndex()I

    move-result v0

    .line 462
    .local v0, "index":I
    if-eqz v2, :cond_16

    .line 463
    invoke-interface {v1, v2, v3, v0}, Lorg/simpleframework/xml/core/Model;->register(Ljava/lang/String;Ljava/lang/String;I)Lorg/simpleframework/xml/core/Model;

    move-result-object v1

    .line 465
    :cond_16
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Expression;->isPath()Z

    move-result v4

    if-nez v4, :cond_1d

    .line 470
    .end local v0    # "index":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "prefix":Ljava/lang/String;
    :cond_1c
    return-object v1

    .line 468
    .restart local v0    # "index":I
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "prefix":Ljava/lang/String;
    :cond_1d
    const/4 v4, 0x1

    invoke-interface {p1, v4}, Lorg/simpleframework/xml/core/Expression;->getPath(I)Lorg/simpleframework/xml/core/Expression;

    move-result-object p1

    .line 469
    goto :goto_2
.end method

.method private isAttribute(Ljava/lang/String;)Z
    .registers 6
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 392
    iget-object v3, p0, Lorg/simpleframework/xml/core/StructureBuilder;->builder:Lorg/simpleframework/xml/core/ExpressionBuilder;

    invoke-virtual {v3, p1}, Lorg/simpleframework/xml/core/ExpressionBuilder;->build(Ljava/lang/String;)Lorg/simpleframework/xml/core/Expression;

    move-result-object v2

    .line 393
    .local v2, "target":Lorg/simpleframework/xml/core/Expression;
    invoke-direct {p0, v2}, Lorg/simpleframework/xml/core/StructureBuilder;->lookup(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;

    move-result-object v0

    .line 395
    .local v0, "model":Lorg/simpleframework/xml/core/Model;
    if-eqz v0, :cond_20

    .line 396
    invoke-interface {v2}, Lorg/simpleframework/xml/core/Expression;->getLast()Ljava/lang/String;

    move-result-object v1

    .line 398
    .local v1, "name":Ljava/lang/String;
    invoke-interface {v2}, Lorg/simpleframework/xml/core/Expression;->isPath()Z

    move-result v3

    if-nez v3, :cond_1b

    .line 399
    invoke-interface {v0, p1}, Lorg/simpleframework/xml/core/Model;->isAttribute(Ljava/lang/String;)Z

    move-result v3

    .line 403
    .end local v1    # "name":Ljava/lang/String;
    :goto_1a
    return v3

    .line 401
    .restart local v1    # "name":Ljava/lang/String;
    :cond_1b
    invoke-interface {v0, v1}, Lorg/simpleframework/xml/core/Model;->isAttribute(Ljava/lang/String;)Z

    move-result v3

    goto :goto_1a

    .line 403
    .end local v1    # "name":Ljava/lang/String;
    :cond_20
    const/4 v3, 0x0

    goto :goto_1a
.end method

.method private isElement(Ljava/lang/String;)Z
    .registers 10
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 360
    iget-object v7, p0, Lorg/simpleframework/xml/core/StructureBuilder;->builder:Lorg/simpleframework/xml/core/ExpressionBuilder;

    invoke-virtual {v7, p1}, Lorg/simpleframework/xml/core/ExpressionBuilder;->build(Ljava/lang/String;)Lorg/simpleframework/xml/core/Expression;

    move-result-object v4

    .line 361
    .local v4, "target":Lorg/simpleframework/xml/core/Expression;
    invoke-direct {p0, v4}, Lorg/simpleframework/xml/core/StructureBuilder;->lookup(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;

    move-result-object v2

    .line 363
    .local v2, "model":Lorg/simpleframework/xml/core/Model;
    if-eqz v2, :cond_2f

    .line 364
    invoke-interface {v4}, Lorg/simpleframework/xml/core/Expression;->getLast()Ljava/lang/String;

    move-result-object v3

    .line 365
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v4}, Lorg/simpleframework/xml/core/Expression;->getIndex()I

    move-result v1

    .line 367
    .local v1, "index":I
    invoke-interface {v2, v3}, Lorg/simpleframework/xml/core/Model;->isElement(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1d

    .line 379
    .end local v1    # "index":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_1c
    :goto_1c
    return v5

    .line 370
    .restart local v1    # "index":I
    .restart local v3    # "name":Ljava/lang/String;
    :cond_1d
    invoke-interface {v2, v3}, Lorg/simpleframework/xml/core/Model;->isModel(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2f

    .line 371
    invoke-interface {v2, v3, v1}, Lorg/simpleframework/xml/core/Model;->lookup(Ljava/lang/String;I)Lorg/simpleframework/xml/core/Model;

    move-result-object v0

    .line 373
    .local v0, "element":Lorg/simpleframework/xml/core/Model;
    invoke-interface {v0}, Lorg/simpleframework/xml/core/Model;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1c

    move v5, v6

    .line 374
    goto :goto_1c

    .end local v0    # "element":Lorg/simpleframework/xml/core/Model;
    .end local v1    # "index":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_2f
    move v5, v6

    .line 379
    goto :goto_1c
.end method

.method private isEmpty()Z
    .registers 2

    .prologue
    .line 653
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->text:Lorg/simpleframework/xml/core/Label;

    if-eqz v0, :cond_6

    .line 654
    const/4 v0, 0x0

    .line 656
    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v0}, Lorg/simpleframework/xml/core/Model;->isEmpty()Z

    move-result v0

    goto :goto_5
.end method

.method private lookup(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;
    .registers 5
    .param p1, "path"    # Lorg/simpleframework/xml/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 417
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-interface {p1, v1, v2}, Lorg/simpleframework/xml/core/Expression;->getPath(II)Lorg/simpleframework/xml/core/Expression;

    move-result-object v0

    .line 419
    .local v0, "target":Lorg/simpleframework/xml/core/Expression;
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Expression;->isPath()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 420
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v1, v0}, Lorg/simpleframework/xml/core/Model;->lookup(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;

    move-result-object v1

    .line 422
    :goto_12
    return-object v1

    :cond_13
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    goto :goto_12
.end method

.method private process(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V
    .registers 11
    .param p1, "field"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "type"    # Ljava/lang/annotation/Annotation;
    .param p3, "map"    # Lorg/simpleframework/xml/core/LabelMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 245
    iget-object v3, p0, Lorg/simpleframework/xml/core/StructureBuilder;->support:Lorg/simpleframework/xml/core/Support;

    invoke-virtual {v3, p1, p2}, Lorg/simpleframework/xml/core/Support;->getLabel(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/Label;

    move-result-object v0

    .line 246
    .local v0, "label":Lorg/simpleframework/xml/core/Label;
    invoke-interface {v0}, Lorg/simpleframework/xml/core/Label;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, "path":Ljava/lang/String;
    invoke-interface {v0}, Lorg/simpleframework/xml/core/Label;->getName()Ljava/lang/String;

    move-result-object v1

    .line 249
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p3, v2}, Lorg/simpleframework/xml/core/LabelMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_25

    .line 250
    new-instance v3, Lorg/simpleframework/xml/core/PersistenceException;

    const-string v4, "Duplicate annotation of name \'%s\' on %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    const/4 v6, 0x1

    aput-object p1, v5, v6

    invoke-direct {v3, v4, v5}, Lorg/simpleframework/xml/core/PersistenceException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v3

    .line 252
    :cond_25
    invoke-direct {p0, p1, v0, p3}, Lorg/simpleframework/xml/core/StructureBuilder;->process(Lorg/simpleframework/xml/core/Contact;Lorg/simpleframework/xml/core/Label;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 253
    return-void
.end method

.method private process(Lorg/simpleframework/xml/core/Contact;Lorg/simpleframework/xml/core/Label;Lorg/simpleframework/xml/core/LabelMap;)V
    .registers 8
    .param p1, "field"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Lorg/simpleframework/xml/core/Label;
    .param p3, "map"    # Lorg/simpleframework/xml/core/LabelMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 269
    invoke-interface {p2}, Lorg/simpleframework/xml/core/Label;->getExpression()Lorg/simpleframework/xml/core/Expression;

    move-result-object v0

    .line 270
    .local v0, "expression":Lorg/simpleframework/xml/core/Expression;
    invoke-interface {p2}, Lorg/simpleframework/xml/core/Label;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 271
    .local v2, "path":Ljava/lang/String;
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    .line 273
    .local v1, "model":Lorg/simpleframework/xml/core/Model;
    invoke-interface {v0}, Lorg/simpleframework/xml/core/Expression;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_14

    .line 274
    invoke-direct {p0, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->register(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;

    move-result-object v1

    .line 276
    :cond_14
    iget-object v3, p0, Lorg/simpleframework/xml/core/StructureBuilder;->resolver:Lorg/simpleframework/xml/core/InstantiatorBuilder;

    invoke-virtual {v3, p2}, Lorg/simpleframework/xml/core/InstantiatorBuilder;->register(Lorg/simpleframework/xml/core/Label;)V

    .line 277
    invoke-interface {v1, p2}, Lorg/simpleframework/xml/core/Model;->register(Lorg/simpleframework/xml/core/Label;)V

    .line 278
    invoke-virtual {p3, v2, p2}, Lorg/simpleframework/xml/core/LabelMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    return-void
.end method

.method private register(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;
    .registers 4
    .param p1, "path"    # Lorg/simpleframework/xml/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 436
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v1, p1}, Lorg/simpleframework/xml/core/Model;->lookup(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;

    move-result-object v0

    .line 438
    .local v0, "model":Lorg/simpleframework/xml/core/Model;
    if-eqz v0, :cond_9

    .line 441
    .end local v0    # "model":Lorg/simpleframework/xml/core/Model;
    :goto_8
    return-object v0

    .restart local v0    # "model":Lorg/simpleframework/xml/core/Model;
    :cond_9
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/StructureBuilder;->create(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;

    move-result-object v0

    goto :goto_8
.end method

.method private text(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)V
    .registers 11
    .param p1, "field"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "type"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 293
    iget-object v4, p0, Lorg/simpleframework/xml/core/StructureBuilder;->support:Lorg/simpleframework/xml/core/Support;

    invoke-virtual {v4, p1, p2}, Lorg/simpleframework/xml/core/Support;->getLabel(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/Label;

    move-result-object v1

    .line 294
    .local v1, "label":Lorg/simpleframework/xml/core/Label;
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getExpression()Lorg/simpleframework/xml/core/Expression;

    move-result-object v0

    .line 295
    .local v0, "expression":Lorg/simpleframework/xml/core/Expression;
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 296
    .local v3, "path":Ljava/lang/String;
    iget-object v2, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    .line 298
    .local v2, "model":Lorg/simpleframework/xml/core/Model;
    invoke-interface {v0}, Lorg/simpleframework/xml/core/Expression;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1a

    .line 299
    invoke-direct {p0, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->register(Lorg/simpleframework/xml/core/Expression;)Lorg/simpleframework/xml/core/Model;

    move-result-object v2

    .line 301
    :cond_1a
    iget-object v4, p0, Lorg/simpleframework/xml/core/StructureBuilder;->texts:Lorg/simpleframework/xml/core/LabelMap;

    invoke-virtual {v4, v3}, Lorg/simpleframework/xml/core/LabelMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_30

    .line 302
    new-instance v4, Lorg/simpleframework/xml/core/TextException;

    const-string v5, "Multiple text annotations in %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p2, v6, v7

    invoke-direct {v4, v5, v6}, Lorg/simpleframework/xml/core/TextException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v4

    .line 304
    :cond_30
    iget-object v4, p0, Lorg/simpleframework/xml/core/StructureBuilder;->resolver:Lorg/simpleframework/xml/core/InstantiatorBuilder;

    invoke-virtual {v4, v1}, Lorg/simpleframework/xml/core/InstantiatorBuilder;->register(Lorg/simpleframework/xml/core/Label;)V

    .line 305
    invoke-interface {v2, v1}, Lorg/simpleframework/xml/core/Model;->register(Lorg/simpleframework/xml/core/Label;)V

    .line 306
    iget-object v4, p0, Lorg/simpleframework/xml/core/StructureBuilder;->texts:Lorg/simpleframework/xml/core/LabelMap;

    invoke-virtual {v4, v3, v1}, Lorg/simpleframework/xml/core/LabelMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    return-void
.end method

.method private union(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V
    .registers 13
    .param p1, "field"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "type"    # Ljava/lang/annotation/Annotation;
    .param p3, "map"    # Lorg/simpleframework/xml/core/LabelMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v5, p0, Lorg/simpleframework/xml/core/StructureBuilder;->support:Lorg/simpleframework/xml/core/Support;

    invoke-virtual {v5, p1, p2}, Lorg/simpleframework/xml/core/Support;->getLabels(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Ljava/util/List;

    move-result-object v2

    .line 220
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/simpleframework/xml/core/Label;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_39

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Label;

    .line 221
    .local v1, "label":Lorg/simpleframework/xml/core/Label;
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 222
    .local v4, "path":Ljava/lang/String;
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getName()Ljava/lang/String;

    move-result-object v3

    .line 224
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {p3, v4}, Lorg/simpleframework/xml/core/LabelMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_35

    .line 225
    new-instance v5, Lorg/simpleframework/xml/core/PersistenceException;

    const-string v6, "Duplicate annotation of name \'%s\' on %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    const/4 v8, 0x1

    aput-object v1, v7, v8

    invoke-direct {v5, v6, v7}, Lorg/simpleframework/xml/core/PersistenceException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v5

    .line 227
    :cond_35
    invoke-direct {p0, p1, v1, p3}, Lorg/simpleframework/xml/core/StructureBuilder;->process(Lorg/simpleframework/xml/core/Contact;Lorg/simpleframework/xml/core/Label;Lorg/simpleframework/xml/core/LabelMap;)V

    goto :goto_a

    .line 229
    .end local v1    # "label":Lorg/simpleframework/xml/core/Label;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "path":Ljava/lang/String;
    :cond_39
    return-void
.end method

.method private validateAttributes(Ljava/lang/Class;Lorg/simpleframework/xml/Order;)V
    .registers 11
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "order"    # Lorg/simpleframework/xml/Order;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 635
    if-eqz p2, :cond_26

    .line 636
    invoke-interface {p2}, Lorg/simpleframework/xml/Order;->attributes()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_8
    if-ge v1, v2, :cond_26

    aget-object v3, v0, v1

    .line 637
    .local v3, "name":Ljava/lang/String;
    invoke-direct {p0, v3}, Lorg/simpleframework/xml/core/StructureBuilder;->isAttribute(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_23

    .line 638
    new-instance v4, Lorg/simpleframework/xml/core/AttributeException;

    const-string v5, "Ordered attribute \'%s\' missing in %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    const/4 v7, 0x1

    aput-object p1, v6, v7

    invoke-direct {v4, v5, v6}, Lorg/simpleframework/xml/core/AttributeException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v4

    .line 636
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 642
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_26
    return-void
.end method

.method private validateElements(Ljava/lang/Class;Lorg/simpleframework/xml/Order;)V
    .registers 11
    .param p1, "type"    # Ljava/lang/Class;
    .param p2, "order"    # Lorg/simpleframework/xml/Order;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 617
    if-eqz p2, :cond_26

    .line 618
    invoke-interface {p2}, Lorg/simpleframework/xml/Order;->elements()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_8
    if-ge v1, v2, :cond_26

    aget-object v3, v0, v1

    .line 619
    .local v3, "name":Ljava/lang/String;
    invoke-direct {p0, v3}, Lorg/simpleframework/xml/core/StructureBuilder;->isElement(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_23

    .line 620
    new-instance v4, Lorg/simpleframework/xml/core/ElementException;

    const-string v5, "Ordered element \'%s\' missing for %s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    const/4 v7, 0x1

    aput-object p1, v6, v7

    invoke-direct {v4, v5, v6}, Lorg/simpleframework/xml/core/ElementException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v4

    .line 618
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 624
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_26
    return-void
.end method

.method private validateModel(Ljava/lang/Class;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 514
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v0}, Lorg/simpleframework/xml/core/Model;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_d

    .line 515
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v0, p1}, Lorg/simpleframework/xml/core/Model;->validate(Ljava/lang/Class;)V

    .line 517
    :cond_d
    return-void
.end method

.method private validateText(Ljava/lang/Class;)V
    .registers 8
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v3, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 527
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Model;->getText()Lorg/simpleframework/xml/core/Label;

    move-result-object v0

    .line 529
    .local v0, "label":Lorg/simpleframework/xml/core/Label;
    if-eqz v0, :cond_3d

    .line 530
    invoke-interface {v0}, Lorg/simpleframework/xml/core/Label;->isTextList()Z

    move-result v1

    if-nez v1, :cond_4b

    .line 531
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-virtual {v1}, Lorg/simpleframework/xml/core/LabelMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_27

    .line 532
    new-instance v1, Lorg/simpleframework/xml/core/TextException;

    const-string v2, "Elements used with %s in %s"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    aput-object p1, v3, v5

    invoke-direct {v1, v2, v3}, Lorg/simpleframework/xml/core/TextException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    .line 534
    :cond_27
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Model;->isComposite()Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 535
    new-instance v1, Lorg/simpleframework/xml/core/TextException;

    const-string v2, "Paths used with %s in %s"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v4

    aput-object p1, v3, v5

    invoke-direct {v1, v2, v3}, Lorg/simpleframework/xml/core/TextException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    .line 539
    :cond_3d
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->scanner:Lorg/simpleframework/xml/core/Scanner;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Scanner;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 540
    invoke-direct {p0}, Lorg/simpleframework/xml/core/StructureBuilder;->isEmpty()Z

    move-result v1

    iput-boolean v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->primitive:Z

    .line 543
    :cond_4b
    return-void
.end method

.method private validateTextList(Ljava/lang/Class;)V
    .registers 15
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 555
    iget-object v7, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v7}, Lorg/simpleframework/xml/core/Model;->getText()Lorg/simpleframework/xml/core/Label;

    move-result-object v6

    .line 557
    .local v6, "label":Lorg/simpleframework/xml/core/Label;
    if-eqz v6, :cond_72

    .line 558
    invoke-interface {v6}, Lorg/simpleframework/xml/core/Label;->isTextList()Z

    move-result v7

    if-eqz v7, :cond_72

    .line 559
    invoke-interface {v6}, Lorg/simpleframework/xml/core/Label;->getKey()Ljava/lang/Object;

    move-result-object v5

    .line 561
    .local v5, "key":Ljava/lang/Object;
    iget-object v7, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-virtual {v7}, Lorg/simpleframework/xml/core/LabelMap;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/simpleframework/xml/core/Label;

    .line 562
    .local v2, "element":Lorg/simpleframework/xml/core/Label;
    invoke-interface {v2}, Lorg/simpleframework/xml/core/Label;->getKey()Ljava/lang/Object;

    move-result-object v4

    .line 564
    .local v4, "identity":Ljava/lang/Object;
    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3f

    .line 565
    new-instance v7, Lorg/simpleframework/xml/core/TextException;

    const-string v8, "Elements used with %s in %s"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object v6, v9, v10

    aput-object p1, v9, v11

    invoke-direct {v7, v8, v9}, Lorg/simpleframework/xml/core/TextException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v7

    .line 567
    :cond_3f
    invoke-interface {v2}, Lorg/simpleframework/xml/core/Label;->getDependent()Lorg/simpleframework/xml/strategy/Type;

    move-result-object v1

    .line 568
    .local v1, "dependent":Lorg/simpleframework/xml/strategy/Type;
    invoke-interface {v1}, Lorg/simpleframework/xml/strategy/Type;->getType()Ljava/lang/Class;

    move-result-object v0

    .line 570
    .local v0, "actual":Ljava/lang/Class;
    const-class v7, Ljava/lang/String;

    if-ne v0, v7, :cond_1b

    .line 571
    new-instance v7, Lorg/simpleframework/xml/core/TextException;

    const-string v8, "Illegal entry of %s with text annotations on %s in %s"

    const/4 v9, 0x3

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v0, v9, v10

    aput-object v6, v9, v11

    aput-object p1, v9, v12

    invoke-direct {v7, v8, v9}, Lorg/simpleframework/xml/core/TextException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v7

    .line 574
    .end local v0    # "actual":Ljava/lang/Class;
    .end local v1    # "dependent":Lorg/simpleframework/xml/strategy/Type;
    .end local v2    # "element":Lorg/simpleframework/xml/core/Label;
    .end local v4    # "identity":Ljava/lang/Object;
    :cond_5c
    iget-object v7, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-interface {v7}, Lorg/simpleframework/xml/core/Model;->isComposite()Z

    move-result v7

    if-eqz v7, :cond_72

    .line 575
    new-instance v7, Lorg/simpleframework/xml/core/TextException;

    const-string v8, "Paths used with %s in %s"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object v6, v9, v10

    aput-object p1, v9, v11

    invoke-direct {v7, v8, v9}, Lorg/simpleframework/xml/core/TextException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v7

    .line 579
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "key":Ljava/lang/Object;
    :cond_72
    return-void
.end method

.method private validateUnions(Ljava/lang/Class;)V
    .registers 16
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 590
    iget-object v10, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-virtual {v10}, Lorg/simpleframework/xml/core/LabelMap;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_66

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/simpleframework/xml/core/Label;

    .line 591
    .local v4, "label":Lorg/simpleframework/xml/core/Label;
    invoke-interface {v4}, Lorg/simpleframework/xml/core/Label;->getPaths()[Ljava/lang/String;

    move-result-object v7

    .line 592
    .local v7, "options":[Ljava/lang/String;
    invoke-interface {v4}, Lorg/simpleframework/xml/core/Label;->getContact()Lorg/simpleframework/xml/core/Contact;

    move-result-object v1

    .line 594
    .local v1, "contact":Lorg/simpleframework/xml/core/Contact;
    move-object v0, v7

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1d
    if-ge v3, v5, :cond_6

    aget-object v6, v0, v3

    .line 595
    .local v6, "option":Ljava/lang/String;
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Contact;->getAnnotation()Ljava/lang/annotation/Annotation;

    move-result-object v9

    .line 596
    .local v9, "union":Ljava/lang/annotation/Annotation;
    iget-object v10, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-virtual {v10, v6}, Lorg/simpleframework/xml/core/LabelMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/simpleframework/xml/core/Label;

    .line 598
    .local v8, "other":Lorg/simpleframework/xml/core/Label;
    invoke-interface {v4}, Lorg/simpleframework/xml/core/Label;->isInline()Z

    move-result v10

    invoke-interface {v8}, Lorg/simpleframework/xml/core/Label;->isInline()Z

    move-result v11

    if-eq v10, v11, :cond_48

    .line 599
    new-instance v10, Lorg/simpleframework/xml/core/UnionException;

    const-string v11, "Inline must be consistent in %s for %s"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v9, v12, v13

    const/4 v13, 0x1

    aput-object v1, v12, v13

    invoke-direct {v10, v11, v12}, Lorg/simpleframework/xml/core/UnionException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v10

    .line 601
    :cond_48
    invoke-interface {v4}, Lorg/simpleframework/xml/core/Label;->isRequired()Z

    move-result v10

    invoke-interface {v8}, Lorg/simpleframework/xml/core/Label;->isRequired()Z

    move-result v11

    if-eq v10, v11, :cond_63

    .line 602
    new-instance v10, Lorg/simpleframework/xml/core/UnionException;

    const-string v11, "Required must be consistent in %s for %s"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v9, v12, v13

    const/4 v13, 0x1

    aput-object v1, v12, v13

    invoke-direct {v10, v11, v12}, Lorg/simpleframework/xml/core/UnionException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v10

    .line 594
    :cond_63
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 606
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "contact":Lorg/simpleframework/xml/core/Contact;
    .end local v3    # "i$":I
    .end local v4    # "label":Lorg/simpleframework/xml/core/Label;
    .end local v5    # "len$":I
    .end local v6    # "option":Ljava/lang/String;
    .end local v7    # "options":[Ljava/lang/String;
    .end local v8    # "other":Lorg/simpleframework/xml/core/Label;
    .end local v9    # "union":Ljava/lang/annotation/Annotation;
    :cond_66
    return-void
.end method

.method private version(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)V
    .registers 8
    .param p1, "field"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "type"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 321
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->support:Lorg/simpleframework/xml/core/Support;

    invoke-virtual {v1, p1, p2}, Lorg/simpleframework/xml/core/Support;->getLabel(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)Lorg/simpleframework/xml/core/Label;

    move-result-object v0

    .line 323
    .local v0, "label":Lorg/simpleframework/xml/core/Label;
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->version:Lorg/simpleframework/xml/core/Label;

    if-eqz v1, :cond_18

    .line 324
    new-instance v1, Lorg/simpleframework/xml/core/AttributeException;

    const-string v2, "Multiple version annotations in %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-direct {v1, v2, v3}, Lorg/simpleframework/xml/core/AttributeException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v1

    .line 326
    :cond_18
    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->version:Lorg/simpleframework/xml/core/Label;

    .line 327
    return-void
.end method


# virtual methods
.method public assemble(Ljava/lang/Class;)V
    .registers 5
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 153
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->scanner:Lorg/simpleframework/xml/core/Scanner;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Scanner;->getOrder()Lorg/simpleframework/xml/Order;

    move-result-object v0

    .line 155
    .local v0, "order":Lorg/simpleframework/xml/Order;
    if-eqz v0, :cond_f

    .line 156
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->assembler:Lorg/simpleframework/xml/core/ModelAssembler;

    iget-object v2, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    invoke-virtual {v1, v2, v0}, Lorg/simpleframework/xml/core/ModelAssembler;->assemble(Lorg/simpleframework/xml/core/Model;Lorg/simpleframework/xml/Order;)V

    .line 158
    :cond_f
    return-void
.end method

.method public build(Ljava/lang/Class;)Lorg/simpleframework/xml/core/Structure;
    .registers 8
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 341
    new-instance v0, Lorg/simpleframework/xml/core/Structure;

    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->factory:Lorg/simpleframework/xml/core/Instantiator;

    iget-object v2, p0, Lorg/simpleframework/xml/core/StructureBuilder;->root:Lorg/simpleframework/xml/core/Model;

    iget-object v3, p0, Lorg/simpleframework/xml/core/StructureBuilder;->version:Lorg/simpleframework/xml/core/Label;

    iget-object v4, p0, Lorg/simpleframework/xml/core/StructureBuilder;->text:Lorg/simpleframework/xml/core/Label;

    iget-boolean v5, p0, Lorg/simpleframework/xml/core/StructureBuilder;->primitive:Z

    invoke-direct/range {v0 .. v5}, Lorg/simpleframework/xml/core/Structure;-><init>(Lorg/simpleframework/xml/core/Instantiator;Lorg/simpleframework/xml/core/Model;Lorg/simpleframework/xml/core/Label;Lorg/simpleframework/xml/core/Label;Z)V

    return-object v0
.end method

.method public commit(Ljava/lang/Class;)V
    .registers 3
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 482
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->factory:Lorg/simpleframework/xml/core/Instantiator;

    if-nez v0, :cond_c

    .line 483
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->resolver:Lorg/simpleframework/xml/core/InstantiatorBuilder;

    invoke-virtual {v0}, Lorg/simpleframework/xml/core/InstantiatorBuilder;->build()Lorg/simpleframework/xml/core/Instantiator;

    move-result-object v0

    iput-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->factory:Lorg/simpleframework/xml/core/Instantiator;

    .line 485
    :cond_c
    return-void
.end method

.method public process(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)V
    .registers 4
    .param p1, "field"    # Lorg/simpleframework/xml/core/Contact;
    .param p2, "label"    # Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 172
    instance-of v0, p2, Lorg/simpleframework/xml/Attribute;

    if-eqz v0, :cond_9

    .line 173
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->attributes:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->process(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 175
    :cond_9
    instance-of v0, p2, Lorg/simpleframework/xml/ElementUnion;

    if-eqz v0, :cond_12

    .line 176
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->union(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 178
    :cond_12
    instance-of v0, p2, Lorg/simpleframework/xml/ElementListUnion;

    if-eqz v0, :cond_1b

    .line 179
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->union(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 181
    :cond_1b
    instance-of v0, p2, Lorg/simpleframework/xml/ElementMapUnion;

    if-eqz v0, :cond_24

    .line 182
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->union(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 184
    :cond_24
    instance-of v0, p2, Lorg/simpleframework/xml/ElementList;

    if-eqz v0, :cond_2d

    .line 185
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->process(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 187
    :cond_2d
    instance-of v0, p2, Lorg/simpleframework/xml/ElementArray;

    if-eqz v0, :cond_36

    .line 188
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->process(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 190
    :cond_36
    instance-of v0, p2, Lorg/simpleframework/xml/ElementMap;

    if-eqz v0, :cond_3f

    .line 191
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->process(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 193
    :cond_3f
    instance-of v0, p2, Lorg/simpleframework/xml/Element;

    if-eqz v0, :cond_48

    .line 194
    iget-object v0, p0, Lorg/simpleframework/xml/core/StructureBuilder;->elements:Lorg/simpleframework/xml/core/LabelMap;

    invoke-direct {p0, p1, p2, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->process(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;Lorg/simpleframework/xml/core/LabelMap;)V

    .line 196
    :cond_48
    instance-of v0, p2, Lorg/simpleframework/xml/Version;

    if-eqz v0, :cond_4f

    .line 197
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/StructureBuilder;->version(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)V

    .line 199
    :cond_4f
    instance-of v0, p2, Lorg/simpleframework/xml/Text;

    if-eqz v0, :cond_56

    .line 200
    invoke-direct {p0, p1, p2}, Lorg/simpleframework/xml/core/StructureBuilder;->text(Lorg/simpleframework/xml/core/Contact;Ljava/lang/annotation/Annotation;)V

    .line 202
    :cond_56
    return-void
.end method

.method public validate(Ljava/lang/Class;)V
    .registers 4
    .param p1, "type"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 495
    iget-object v1, p0, Lorg/simpleframework/xml/core/StructureBuilder;->scanner:Lorg/simpleframework/xml/core/Scanner;

    invoke-interface {v1}, Lorg/simpleframework/xml/core/Scanner;->getOrder()Lorg/simpleframework/xml/Order;

    move-result-object v0

    .line 497
    .local v0, "order":Lorg/simpleframework/xml/Order;
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/StructureBuilder;->validateUnions(Ljava/lang/Class;)V

    .line 498
    invoke-direct {p0, p1, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->validateElements(Ljava/lang/Class;Lorg/simpleframework/xml/Order;)V

    .line 499
    invoke-direct {p0, p1, v0}, Lorg/simpleframework/xml/core/StructureBuilder;->validateAttributes(Ljava/lang/Class;Lorg/simpleframework/xml/Order;)V

    .line 500
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/StructureBuilder;->validateModel(Ljava/lang/Class;)V

    .line 501
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/StructureBuilder;->validateText(Ljava/lang/Class;)V

    .line 502
    invoke-direct {p0, p1}, Lorg/simpleframework/xml/core/StructureBuilder;->validateTextList(Ljava/lang/Class;)V

    .line 503
    return-void
.end method
