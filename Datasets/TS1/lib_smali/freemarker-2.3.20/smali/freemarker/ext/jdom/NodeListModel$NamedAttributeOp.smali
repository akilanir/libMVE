.class final Lfreemarker/ext/jdom/NodeListModel$NamedAttributeOp;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/ext/jdom/NodeListModel$NamedNodeOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NamedAttributeOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 723
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 723
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$NamedAttributeOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;Ljava/lang/String;Lorg/jdom/Namespace;)Ljava/util/List;
    .registers 10
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespace"    # Lorg/jdom/Namespace;

    .prologue
    .line 726
    const/4 v0, 0x0

    .line 727
    .local v0, "attr":Lorg/jdom/Attribute;
    instance-of v4, p1, Lorg/jdom/Element;

    if-eqz v4, :cond_11

    move-object v2, p1

    .line 728
    check-cast v2, Lorg/jdom/Element;

    .line 729
    .local v2, "element":Lorg/jdom/Element;
    invoke-virtual {v2, p2, p3}, Lorg/jdom/Element;->getAttribute(Ljava/lang/String;Lorg/jdom/Namespace;)Lorg/jdom/Attribute;

    move-result-object v0

    .line 756
    .end local v2    # "element":Lorg/jdom/Element;
    :cond_c
    :goto_c
    if-nez v0, :cond_8f

    sget-object v4, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_10
    return-object v4

    .line 730
    :cond_11
    instance-of v4, p1, Lorg/jdom/ProcessingInstruction;

    if-eqz v4, :cond_4a

    move-object v3, p1

    .line 731
    check-cast v3, Lorg/jdom/ProcessingInstruction;

    .line 732
    .local v3, "pi":Lorg/jdom/ProcessingInstruction;
    const-string v4, "target"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2c

    .line 733
    new-instance v0, Lorg/jdom/Attribute;

    .end local v0    # "attr":Lorg/jdom/Attribute;
    const-string v4, "target"

    invoke-virtual {v3}, Lorg/jdom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attr":Lorg/jdom/Attribute;
    goto :goto_c

    .line 734
    :cond_2c
    const-string v4, "data"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 735
    new-instance v0, Lorg/jdom/Attribute;

    .end local v0    # "attr":Lorg/jdom/Attribute;
    const-string v4, "data"

    invoke-virtual {v3}, Lorg/jdom/ProcessingInstruction;->getData()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attr":Lorg/jdom/Attribute;
    goto :goto_c

    .line 737
    :cond_40
    new-instance v0, Lorg/jdom/Attribute;

    .end local v0    # "attr":Lorg/jdom/Attribute;
    invoke-virtual {v3, p2}, Lorg/jdom/ProcessingInstruction;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, p2, v4}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attr":Lorg/jdom/Attribute;
    goto :goto_c

    .line 738
    .end local v3    # "pi":Lorg/jdom/ProcessingInstruction;
    :cond_4a
    instance-of v4, p1, Lorg/jdom/DocType;

    if-eqz v4, :cond_8d

    move-object v1, p1

    .line 739
    check-cast v1, Lorg/jdom/DocType;

    .line 740
    .local v1, "doctype":Lorg/jdom/DocType;
    const-string v4, "publicId"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_65

    .line 741
    new-instance v0, Lorg/jdom/Attribute;

    .end local v0    # "attr":Lorg/jdom/Attribute;
    const-string v4, "publicId"

    invoke-virtual {v1}, Lorg/jdom/DocType;->getPublicID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attr":Lorg/jdom/Attribute;
    goto :goto_c

    .line 742
    :cond_65
    const-string v4, "systemId"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_79

    .line 743
    new-instance v0, Lorg/jdom/Attribute;

    .end local v0    # "attr":Lorg/jdom/Attribute;
    const-string v4, "systemId"

    invoke-virtual {v1}, Lorg/jdom/DocType;->getSystemID()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attr":Lorg/jdom/Attribute;
    goto :goto_c

    .line 744
    :cond_79
    const-string v4, "elementName"

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 745
    new-instance v0, Lorg/jdom/Attribute;

    .end local v0    # "attr":Lorg/jdom/Attribute;
    const-string v4, "elementName"

    invoke-virtual {v1}, Lorg/jdom/DocType;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lorg/jdom/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attr":Lorg/jdom/Attribute;
    goto :goto_c

    .line 750
    .end local v1    # "doctype":Lorg/jdom/DocType;
    :cond_8d
    const/4 v4, 0x0

    goto :goto_10

    .line 756
    :cond_8f
    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    goto/16 :goto_10
.end method
