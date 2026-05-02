.class final Lfreemarker/ext/jdom/NodeListModel$AncestorOp;
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
    name = "AncestorOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 873
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 873
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$AncestorOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 876
    invoke-static {p1}, Lfreemarker/ext/jdom/NodeListModel;->access$1100(Ljava/lang/Object;)Lorg/jdom/Element;

    move-result-object v1

    .line 877
    .local v1, "parent":Lorg/jdom/Element;
    if-nez v1, :cond_9

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 884
    :goto_8
    return-object v0

    .line 878
    :cond_9
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 880
    .local v0, "list":Ljava/util/LinkedList;
    :cond_e
    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 881
    invoke-virtual {v1}, Lorg/jdom/Element;->getParent()Lorg/jdom/Element;

    move-result-object v1

    .line 883
    if-nez v1, :cond_e

    goto :goto_8
.end method
