.class Lfreemarker/ext/jdom/NodeListModel$DescendantOp;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/ext/jdom/NodeListModel$NodeOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DescendantOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 904
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 904
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$DescendantOp;-><init>()V

    return-void
.end method

.method private addChildren(Lorg/jdom/Element;Ljava/util/List;)V
    .registers 7
    .param p1, "element"    # Lorg/jdom/Element;
    .param p2, "list"    # Ljava/util/List;

    .prologue
    .line 927
    invoke-virtual {p1}, Lorg/jdom/Element;->getChildren()Ljava/util/List;

    move-result-object v1

    .line 928
    .local v1, "children":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 929
    .local v2, "it":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 930
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jdom/Element;

    .line 931
    .local v0, "child":Lorg/jdom/Element;
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 932
    invoke-direct {p0, v0, p2}, Lfreemarker/ext/jdom/NodeListModel$DescendantOp;->addChildren(Lorg/jdom/Element;Ljava/util/List;)V

    goto :goto_8

    .line 934
    .end local v0    # "child":Lorg/jdom/Element;
    :cond_1b
    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 5
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 907
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 908
    .local v0, "list":Ljava/util/LinkedList;
    instance-of v2, p1, Lorg/jdom/Element;

    if-eqz v2, :cond_f

    .line 909
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-direct {p0, p1, v0}, Lfreemarker/ext/jdom/NodeListModel$DescendantOp;->addChildren(Lorg/jdom/Element;Ljava/util/List;)V

    .line 922
    .end local v0    # "list":Ljava/util/LinkedList;
    :goto_e
    return-object v0

    .line 911
    .restart local v0    # "list":Ljava/util/LinkedList;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_f
    instance-of v2, p1, Lorg/jdom/Document;

    if-eqz v2, :cond_20

    .line 912
    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getRootElement()Lorg/jdom/Element;

    move-result-object v1

    .line 913
    .local v1, "root":Lorg/jdom/Element;
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 914
    invoke-direct {p0, v1, v0}, Lfreemarker/ext/jdom/NodeListModel$DescendantOp;->addChildren(Lorg/jdom/Element;Ljava/util/List;)V

    goto :goto_e

    .line 919
    .end local v1    # "root":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_20
    const/4 v0, 0x0

    goto :goto_e
.end method
