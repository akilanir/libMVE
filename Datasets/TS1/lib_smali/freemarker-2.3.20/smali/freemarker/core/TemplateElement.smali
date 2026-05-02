.class public abstract Lfreemarker/core/TemplateElement;
.super Lfreemarker/core/TemplateObject;
.source "TemplateElement.java"

# interfaces
.implements Ljavax/swing/tree/TreeNode;


# instance fields
.field nestedBlock:Lfreemarker/core/TemplateElement;

.field nestedElements:Ljava/util/List;

.field parent:Lfreemarker/core/TemplateElement;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 75
    invoke-direct {p0}, Lfreemarker/core/TemplateObject;-><init>()V

    return-void
.end method

.method private getFirstChild()Lfreemarker/core/TemplateElement;
    .registers 3

    .prologue
    .line 372
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_7

    .line 373
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 378
    :goto_6
    return-object v0

    .line 375
    :cond_7
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1d

    .line 376
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/TemplateElement;

    goto :goto_6

    .line 378
    :cond_1d
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private getFirstLeaf()Lfreemarker/core/TemplateElement;
    .registers 3

    .prologue
    .line 393
    move-object v0, p0

    .line 394
    .local v0, "te":Lfreemarker/core/TemplateElement;
    :goto_1
    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->isLeaf()Z

    move-result v1

    if-nez v1, :cond_14

    instance-of v1, v0, Lfreemarker/core/Macro;

    if-nez v1, :cond_14

    instance-of v1, v0, Lfreemarker/core/BlockAssignment;

    if-nez v1, :cond_14

    .line 396
    invoke-direct {v0}, Lfreemarker/core/TemplateElement;->getFirstChild()Lfreemarker/core/TemplateElement;

    move-result-object v0

    goto :goto_1

    .line 398
    :cond_14
    return-object v0
.end method

.method private getLastChild()Lfreemarker/core/TemplateElement;
    .registers 3

    .prologue
    .line 382
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_7

    .line 383
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 388
    :goto_6
    return-object v0

    .line 385
    :cond_7
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_24

    .line 386
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    iget-object v1, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/TemplateElement;

    goto :goto_6

    .line 388
    :cond_24
    const/4 v0, 0x0

    goto :goto_6
.end method

.method private getLastLeaf()Lfreemarker/core/TemplateElement;
    .registers 3

    .prologue
    .line 402
    move-object v0, p0

    .line 403
    .local v0, "te":Lfreemarker/core/TemplateElement;
    :goto_1
    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->isLeaf()Z

    move-result v1

    if-nez v1, :cond_14

    instance-of v1, v0, Lfreemarker/core/Macro;

    if-nez v1, :cond_14

    instance-of v1, v0, Lfreemarker/core/BlockAssignment;

    if-nez v1, :cond_14

    .line 405
    invoke-direct {v0}, Lfreemarker/core/TemplateElement;->getLastChild()Lfreemarker/core/TemplateElement;

    move-result-object v0

    goto :goto_1

    .line 407
    :cond_14
    return-object v0
.end method


# virtual methods
.method abstract accept(Lfreemarker/core/Environment;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public children()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 206
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    instance-of v0, v0, Lfreemarker/core/MixedContent;

    if-eqz v0, :cond_d

    .line 207
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->children()Ljava/util/Enumeration;

    move-result-object v0

    .line 215
    :goto_c
    return-object v0

    .line 209
    :cond_d
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_1c

    .line 210
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    goto :goto_c

    .line 212
    :cond_1c
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_27

    .line 213
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    goto :goto_c

    .line 215
    :cond_27
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    goto :goto_c
.end method

.method protected abstract dump(Z)Ljava/lang/String;
.end method

.method public getAllowsChildren()Z
    .registers 2

    .prologue
    .line 174
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->isLeaf()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public final getCanonicalForm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 112
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lfreemarker/core/TemplateElement;->dump(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getChildAt(I)Ljavax/swing/tree/TreeNode;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 219
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    instance-of v0, v0, Lfreemarker/core/MixedContent;

    if-eqz v0, :cond_d

    .line 220
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0, p1}, Lfreemarker/core/TemplateElement;->getChildAt(I)Ljavax/swing/tree/TreeNode;

    move-result-object v0

    .line 229
    :goto_c
    return-object v0

    .line 222
    :cond_d
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_1e

    .line 223
    if-nez p1, :cond_16

    .line 224
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    goto :goto_c

    .line 226
    :cond_16
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "invalid index"

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_1e
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_2b

    .line 229
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/swing/tree/TreeNode;

    goto :goto_c

    .line 231
    :cond_2b
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v1, "element has no children"

    invoke-direct {v0, v1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getChildCount()I
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    instance-of v0, v0, Lfreemarker/core/MixedContent;

    if-eqz v0, :cond_d

    .line 194
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0}, Lfreemarker/core/TemplateElement;->getChildCount()I

    move-result v0

    .line 202
    :goto_c
    return v0

    .line 196
    :cond_d
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_13

    .line 197
    const/4 v0, 0x1

    goto :goto_c

    .line 199
    :cond_13
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_1e

    .line 200
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_c

    .line 202
    :cond_1e
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getChildNodes()Lfreemarker/template/TemplateSequenceModel;
    .registers 3

    .prologue
    .line 150
    iget-object v1, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v1, :cond_c

    .line 151
    new-instance v0, Lfreemarker/template/SimpleSequence;

    iget-object v1, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;)V

    .line 157
    :cond_b
    :goto_b
    return-object v0

    .line 153
    :cond_c
    new-instance v0, Lfreemarker/template/SimpleSequence;

    invoke-direct {v0}, Lfreemarker/template/SimpleSequence;-><init>()V

    .line 154
    .local v0, "result":Lfreemarker/template/SimpleSequence;
    iget-object v1, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_b

    .line 155
    iget-object v1, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0, v1}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    goto :goto_b
.end method

.method public final getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lfreemarker/core/TemplateElement;->dump(Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIndex(Ljavax/swing/tree/TreeNode;)I
    .registers 3
    .param p1, "node"    # Ljavax/swing/tree/TreeNode;

    .prologue
    .line 178
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    instance-of v0, v0, Lfreemarker/core/MixedContent;

    if-eqz v0, :cond_d

    .line 179
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0, p1}, Lfreemarker/core/TemplateElement;->getIndex(Ljavax/swing/tree/TreeNode;)I

    move-result v0

    .line 189
    :goto_c
    return v0

    .line 181
    :cond_d
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_17

    .line 182
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-ne p1, v0, :cond_22

    .line 183
    const/4 v0, 0x0

    goto :goto_c

    .line 186
    :cond_17
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_22

    .line 187
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    goto :goto_c

    .line 189
    :cond_22
    const/4 v0, -0x1

    goto :goto_c
.end method

.method public getNodeName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 161
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, "classname":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 163
    .local v1, "shortNameOffset":I
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getNodeNamespace()Ljava/lang/String;
    .registers 2

    .prologue
    .line 142
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNodeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 146
    const-string v0, "element"

    return-object v0
.end method

.method public getParent()Ljavax/swing/tree/TreeNode;
    .registers 2

    .prologue
    .line 257
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    return-object v0
.end method

.method public getParentNode()Lfreemarker/template/TemplateNodeModel;
    .registers 2

    .prologue
    .line 138
    const/4 v0, 0x0

    return-object v0
.end method

.method heedsOpeningWhitespace()Z
    .registers 2

    .prologue
    .line 416
    const/4 v0, 0x0

    return v0
.end method

.method heedsTrailingWhitespace()Z
    .registers 2

    .prologue
    .line 425
    const/4 v0, 0x0

    return v0
.end method

.method isIgnorable()Z
    .registers 2

    .prologue
    .line 309
    const/4 v0, 0x0

    return v0
.end method

.method public isLeaf()Z
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-nez v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method isShownInStackTrace()Z
    .registers 2

    .prologue
    .line 122
    const/4 v0, 0x1

    return v0
.end method

.method nextSibling()Lfreemarker/core/TemplateElement;
    .registers 6

    .prologue
    const/4 v2, 0x0

    .line 356
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    if-nez v3, :cond_6

    .line 368
    :cond_5
    :goto_5
    return-object v2

    .line 359
    :cond_6
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    iget-object v1, v3, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    .line 360
    .local v1, "siblings":Ljava/util/List;
    if-eqz v1, :cond_5

    .line 363
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_d
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_5

    .line 364
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p0, :cond_2a

    .line 365
    add-int/lit8 v3, v0, 0x1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_5

    add-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/TemplateElement;

    goto :goto_5

    .line 363
    :cond_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_d
.end method

.method nextTerminalNode()Lfreemarker/core/TemplateElement;
    .registers 3

    .prologue
    .line 327
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->nextSibling()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 328
    .local v0, "next":Lfreemarker/core/TemplateElement;
    if-eqz v0, :cond_b

    .line 329
    invoke-direct {v0}, Lfreemarker/core/TemplateElement;->getFirstLeaf()Lfreemarker/core/TemplateElement;

    move-result-object v1

    .line 334
    :goto_a
    return-object v1

    .line 331
    :cond_b
    iget-object v1, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_16

    .line 332
    iget-object v1, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->nextTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v1

    goto :goto_a

    .line 334
    :cond_16
    const/4 v1, 0x0

    goto :goto_a
.end method

.method postParseCleanup(Z)Lfreemarker/core/TemplateElement;
    .registers 6
    .param p1, "stripWhitespace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 278
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v3, :cond_4e

    .line 279
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_23

    .line 280
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/TemplateElement;

    .line 281
    .local v2, "te":Lfreemarker/core/TemplateElement;
    invoke-virtual {v2, p1}, Lfreemarker/core/TemplateElement;->postParseCleanup(Z)Lfreemarker/core/TemplateElement;

    move-result-object v2

    .line 282
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v3, v0, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 283
    iput-object p0, v2, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    .line 279
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 285
    .end local v2    # "te":Lfreemarker/core/TemplateElement;
    :cond_23
    if-eqz p1, :cond_41

    .line 286
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :cond_2b
    :goto_2b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_41

    .line 287
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/TemplateElement;

    .line 288
    .restart local v2    # "te":Lfreemarker/core/TemplateElement;
    invoke-virtual {v2}, Lfreemarker/core/TemplateElement;->isIgnorable()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 289
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_2b

    .line 293
    .end local v1    # "it":Ljava/util/Iterator;
    .end local v2    # "te":Lfreemarker/core/TemplateElement;
    :cond_41
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    instance-of v3, v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_4e

    .line 294
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->trimToSize()V

    .line 297
    .end local v0    # "i":I
    :cond_4e
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v3, :cond_65

    .line 298
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v3, p1}, Lfreemarker/core/TemplateElement;->postParseCleanup(Z)Lfreemarker/core/TemplateElement;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 299
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v3}, Lfreemarker/core/TemplateElement;->isIgnorable()Z

    move-result v3

    if-eqz v3, :cond_66

    .line 300
    const/4 v3, 0x0

    iput-object v3, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 305
    :cond_65
    :goto_65
    return-object p0

    .line 302
    :cond_66
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    iput-object p0, v3, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    goto :goto_65
.end method

.method prevTerminalNode()Lfreemarker/core/TemplateElement;
    .registers 3

    .prologue
    .line 316
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->previousSibling()Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 317
    .local v0, "prev":Lfreemarker/core/TemplateElement;
    if-eqz v0, :cond_b

    .line 318
    invoke-direct {v0}, Lfreemarker/core/TemplateElement;->getLastLeaf()Lfreemarker/core/TemplateElement;

    move-result-object v1

    .line 323
    :goto_a
    return-object v1

    .line 320
    :cond_b
    iget-object v1, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    if-eqz v1, :cond_16

    .line 321
    iget-object v1, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    invoke-virtual {v1}, Lfreemarker/core/TemplateElement;->prevTerminalNode()Lfreemarker/core/TemplateElement;

    move-result-object v1

    goto :goto_a

    .line 323
    :cond_16
    const/4 v1, 0x0

    goto :goto_a
.end method

.method previousSibling()Lfreemarker/core/TemplateElement;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 340
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    if-nez v3, :cond_6

    .line 352
    :cond_5
    :goto_5
    return-object v2

    .line 343
    :cond_6
    iget-object v3, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    iget-object v1, v3, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    .line 344
    .local v1, "siblings":Ljava/util/List;
    if-eqz v1, :cond_5

    .line 347
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_12
    if-ltz v0, :cond_5

    .line 348
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p0, :cond_25

    .line 349
    if-lez v0, :cond_5

    add-int/lit8 v2, v0, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/TemplateElement;

    goto :goto_5

    .line 347
    :cond_25
    add-int/lit8 v0, v0, -0x1

    goto :goto_12
.end method

.method public setChildAt(ILfreemarker/core/TemplateElement;)V
    .registers 5
    .param p1, "index"    # I
    .param p2, "element"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 235
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    instance-of v0, v0, Lfreemarker/core/MixedContent;

    if-eqz v0, :cond_c

    .line 236
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v0, p1, p2}, Lfreemarker/core/TemplateElement;->setChildAt(ILfreemarker/core/TemplateElement;)V

    .line 254
    :goto_b
    return-void

    .line 238
    :cond_c
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v0, :cond_1f

    .line 239
    if-nez p1, :cond_17

    .line 240
    iput-object p2, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    .line 241
    iput-object p0, p2, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    goto :goto_b

    .line 244
    :cond_17
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "invalid index"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 247
    :cond_1f
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-eqz v0, :cond_2b

    .line 248
    iget-object v0, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 249
    iput-object p0, p2, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    goto :goto_b

    .line 252
    :cond_2b
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "element has no children"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method setParentRecursively(Lfreemarker/core/TemplateElement;)V
    .registers 5
    .param p1, "parent"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 263
    iput-object p1, p0, Lfreemarker/core/TemplateElement;->parent:Lfreemarker/core/TemplateElement;

    .line 264
    iget-object v2, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    if-nez v2, :cond_18

    const/4 v1, 0x0

    .line 265
    .local v1, "nestedSize":I
    :goto_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_1f

    .line 266
    iget-object v2, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/TemplateElement;

    invoke-virtual {v2, p0}, Lfreemarker/core/TemplateElement;->setParentRecursively(Lfreemarker/core/TemplateElement;)V

    .line 265
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 264
    .end local v0    # "i":I
    .end local v1    # "nestedSize":I
    :cond_18
    iget-object v2, p0, Lfreemarker/core/TemplateElement;->nestedElements:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    goto :goto_7

    .line 268
    .restart local v0    # "i":I
    .restart local v1    # "nestedSize":I
    :cond_1f
    iget-object v2, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v2, :cond_28

    .line 269
    iget-object v2, p0, Lfreemarker/core/TemplateElement;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {v2, p0}, Lfreemarker/core/TemplateElement;->setParentRecursively(Lfreemarker/core/TemplateElement;)V

    .line 271
    :cond_28
    return-void
.end method
