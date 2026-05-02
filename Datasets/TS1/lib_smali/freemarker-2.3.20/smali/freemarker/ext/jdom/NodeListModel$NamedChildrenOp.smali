.class final Lfreemarker/ext/jdom/NodeListModel$NamedChildrenOp;
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
    name = "NamedChildrenOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 683
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 683
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$NamedChildrenOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;Ljava/lang/String;Lorg/jdom/Namespace;)Ljava/util/List;
    .registers 7
    .param p1, "node"    # Ljava/lang/Object;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "namespace"    # Lorg/jdom/Namespace;

    .prologue
    .line 686
    instance-of v1, p1, Lorg/jdom/Element;

    if-eqz v1, :cond_b

    .line 687
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1, p2, p3}, Lorg/jdom/Element;->getChildren(Ljava/lang/String;Lorg/jdom/Namespace;)Ljava/util/List;

    move-result-object v1

    .line 699
    :goto_a
    return-object v1

    .line 688
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v1, p1, Lorg/jdom/Document;

    if-eqz v1, :cond_37

    .line 689
    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getRootElement()Lorg/jdom/Element;

    move-result-object v0

    .line 690
    .local v0, "root":Lorg/jdom/Element;
    if-eqz v0, :cond_34

    invoke-virtual {v0}, Lorg/jdom/Element;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    invoke-virtual {v0}, Lorg/jdom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Lorg/jdom/Namespace;->getURI()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 693
    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_a

    .line 695
    :cond_34
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_a

    .line 699
    .end local v0    # "root":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_37
    const/4 v1, 0x0

    goto :goto_a
.end method
