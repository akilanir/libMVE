.class final Lfreemarker/ext/jdom/NodeListModel$AncestorOrSelfOp;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/ext/jdom/NodeListModel$NodeOperator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AncestorOrSelfOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 888
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 888
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$AncestorOrSelfOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 891
    invoke-static {p1}, Lfreemarker/ext/jdom/NodeListModel;->access$1100(Ljava/lang/Object;)Lorg/jdom/Element;

    move-result-object v1

    .line 892
    .local v1, "parent":Lorg/jdom/Element;
    if-nez v1, :cond_b

    invoke-static {p1}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 900
    :goto_a
    return-object v0

    .line 893
    :cond_b
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 894
    .local v0, "list":Ljava/util/LinkedList;
    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 896
    :cond_13
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 897
    invoke-virtual {v1}, Lorg/jdom/Element;->getParent()Lorg/jdom/Element;

    move-result-object v1

    .line 899
    if-nez v1, :cond_13

    goto :goto_a
.end method
