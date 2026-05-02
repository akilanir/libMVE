.class Lezvcard/io/xml/XCardReader$XCardStructure;
.super Ljava/lang/Object;
.source "XCardReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/xml/XCardReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "XCardStructure"
.end annotation


# instance fields
.field private final stack:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lezvcard/io/xml/XCardReader$ElementType;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lezvcard/io/xml/XCardReader;


# direct methods
.method private constructor <init>(Lezvcard/io/xml/XCardReader;)V
    .registers 3

    .prologue
    .line 486
    iput-object p1, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->this$0:Lezvcard/io/xml/XCardReader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 487
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lezvcard/io/xml/XCardReader;Lezvcard/io/xml/XCardReader$1;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/io/xml/XCardReader;
    .param p2, "x1"    # Lezvcard/io/xml/XCardReader$1;

    .prologue
    .line 486
    invoke-direct {p0, p1}, Lezvcard/io/xml/XCardReader$XCardStructure;-><init>(Lezvcard/io/xml/XCardReader;)V

    return-void
.end method


# virtual methods
.method public isEmpty()Z
    .registers 2

    .prologue
    .line 537
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public isUnderParameters()Z
    .registers 5

    .prologue
    .line 520
    const/4 v1, 0x0

    .line 521
    .local v1, "nonNull":Lezvcard/io/xml/XCardReader$ElementType;
    iget-object v3, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_9
    if-ltz v0, :cond_16

    .line 522
    iget-object v3, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezvcard/io/xml/XCardReader$ElementType;

    .line 523
    .local v2, "type":Lezvcard/io/xml/XCardReader$ElementType;
    if-eqz v2, :cond_24

    .line 524
    move-object v1, v2

    .line 529
    .end local v2    # "type":Lezvcard/io/xml/XCardReader$ElementType;
    :cond_16
    sget-object v3, Lezvcard/io/xml/XCardReader$ElementType;->parameters:Lezvcard/io/xml/XCardReader$ElementType;

    if-eq v1, v3, :cond_22

    sget-object v3, Lezvcard/io/xml/XCardReader$ElementType;->parameter:Lezvcard/io/xml/XCardReader$ElementType;

    if-eq v1, v3, :cond_22

    sget-object v3, Lezvcard/io/xml/XCardReader$ElementType;->parameterValue:Lezvcard/io/xml/XCardReader$ElementType;

    if-ne v1, v3, :cond_27

    :cond_22
    const/4 v3, 0x1

    :goto_23
    return v3

    .line 521
    .restart local v2    # "type":Lezvcard/io/xml/XCardReader$ElementType;
    :cond_24
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 529
    .end local v2    # "type":Lezvcard/io/xml/XCardReader$ElementType;
    :cond_27
    const/4 v3, 0x0

    goto :goto_23
.end method

.method public peek()Lezvcard/io/xml/XCardReader$ElementType;
    .registers 3

    .prologue
    .line 502
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    iget-object v1, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/io/xml/XCardReader$ElementType;

    goto :goto_9
.end method

.method public pop()Lezvcard/io/xml/XCardReader$ElementType;
    .registers 3

    .prologue
    .line 494
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    iget-object v1, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/io/xml/XCardReader$ElementType;

    goto :goto_9
.end method

.method public push(Lezvcard/io/xml/XCardReader$ElementType;)V
    .registers 3
    .param p1, "type"    # Lezvcard/io/xml/XCardReader$ElementType;

    .prologue
    .line 511
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$XCardStructure;->stack:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 512
    return-void
.end method
