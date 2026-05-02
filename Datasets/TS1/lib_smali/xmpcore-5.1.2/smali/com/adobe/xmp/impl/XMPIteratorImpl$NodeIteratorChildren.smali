.class Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;
.super Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIterator;
.source "XMPIteratorImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/xmp/impl/XMPIteratorImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NodeIteratorChildren"
.end annotation


# instance fields
.field private childrenIterator:Ljava/util/Iterator;

.field private index:I

.field private parentPath:Ljava/lang/String;

.field final synthetic this$0:Lcom/adobe/xmp/impl/XMPIteratorImpl;


# direct methods
.method public constructor <init>(Lcom/adobe/xmp/impl/XMPIteratorImpl;Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)V
    .registers 5
    .param p2, "parentNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p3, "parentPath"    # Ljava/lang/String;

    .prologue
    .line 548
    iput-object p1, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->this$0:Lcom/adobe/xmp/impl/XMPIteratorImpl;

    invoke-direct {p0, p1}, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIterator;-><init>(Lcom/adobe/xmp/impl/XMPIteratorImpl;)V

    .line 539
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->index:I

    .line 549
    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 551
    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/adobe/xmp/impl/XMPIteratorImpl;->setBaseNS(Ljava/lang/String;)V

    .line 553
    :cond_19
    const/4 v0, 0x1

    invoke-virtual {p0, p2, p3, v0}, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->accumulatePath(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->parentPath:Ljava/lang/String;

    .line 555
    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->childrenIterator:Ljava/util/Iterator;

    .line 556
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 566
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->getReturnProperty()Lcom/adobe/xmp/properties/XMPPropertyInfo;

    move-result-object v4

    if-eqz v4, :cond_9

    .line 604
    :goto_8
    return v2

    .line 571
    :cond_9
    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->this$0:Lcom/adobe/xmp/impl/XMPIteratorImpl;

    iget-boolean v4, v4, Lcom/adobe/xmp/impl/XMPIteratorImpl;->skipSiblings:Z

    if-eqz v4, :cond_11

    move v2, v3

    .line 573
    goto :goto_8

    .line 575
    :cond_11
    iget-object v4, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->childrenIterator:Ljava/util/Iterator;

    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6f

    .line 577
    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->childrenIterator:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 578
    .local v0, "child":Lcom/adobe/xmp/impl/XMPNode;
    iget v3, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->index:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->index:I

    .line 580
    const/4 v1, 0x0

    .line 581
    .local v1, "path":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/xmp/options/PropertyOptions;->isSchemaNode()Z

    move-result v3

    if-eqz v3, :cond_5b

    .line 583
    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->this$0:Lcom/adobe/xmp/impl/XMPIteratorImpl;

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/adobe/xmp/impl/XMPIteratorImpl;->setBaseNS(Ljava/lang/String;)V

    .line 592
    :cond_3b
    :goto_3b
    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->this$0:Lcom/adobe/xmp/impl/XMPIteratorImpl;

    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPIteratorImpl;->getOptions()Lcom/adobe/xmp/options/IteratorOptions;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/xmp/options/IteratorOptions;->isJustLeafnodes()Z

    move-result v3

    if-eqz v3, :cond_4d

    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v3

    if-nez v3, :cond_6a

    .line 594
    :cond_4d
    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->this$0:Lcom/adobe/xmp/impl/XMPIteratorImpl;

    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPIteratorImpl;->getBaseNS()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3, v1}, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->createPropertyInfo(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPPropertyInfo;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->setReturnProperty(Lcom/adobe/xmp/properties/XMPPropertyInfo;)V

    goto :goto_8

    .line 585
    :cond_5b
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->getParent()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v3

    if-eqz v3, :cond_3b

    .line 588
    iget-object v3, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->parentPath:Ljava/lang/String;

    iget v4, p0, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->index:I

    invoke-virtual {p0, v0, v3, v4}, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->accumulatePath(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_3b

    .line 599
    :cond_6a
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPIteratorImpl$NodeIteratorChildren;->hasNext()Z

    move-result v2

    goto :goto_8

    .end local v0    # "child":Lcom/adobe/xmp/impl/XMPNode;
    .end local v1    # "path":Ljava/lang/String;
    :cond_6f
    move v2, v3

    .line 604
    goto :goto_8
.end method
