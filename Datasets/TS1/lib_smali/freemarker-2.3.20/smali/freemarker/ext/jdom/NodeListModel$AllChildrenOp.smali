.class final Lfreemarker/ext/jdom/NodeListModel$AllChildrenOp;
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
    name = "AllChildrenOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 664
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 664
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$AllChildrenOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 667
    instance-of v1, p1, Lorg/jdom/Element;

    if-eqz v1, :cond_b

    .line 668
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getChildren()Ljava/util/List;

    move-result-object v1

    .line 675
    :goto_a
    return-object v1

    .line 669
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_b
    instance-of v1, p1, Lorg/jdom/Document;

    if-eqz v1, :cond_1f

    .line 670
    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getRootElement()Lorg/jdom/Element;

    move-result-object v0

    .line 671
    .local v0, "root":Lorg/jdom/Element;
    if-nez v0, :cond_1a

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_a

    :cond_1a
    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_a

    .line 675
    .end local v0    # "root":Lorg/jdom/Element;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_1f
    const/4 v1, 0x0

    goto :goto_a
.end method
