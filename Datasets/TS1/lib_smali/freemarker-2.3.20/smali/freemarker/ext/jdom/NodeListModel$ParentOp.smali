.class final Lfreemarker/ext/jdom/NodeListModel$ParentOp;
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
    name = "ParentOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 865
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 865
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$ParentOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 868
    invoke-static {p1}, Lfreemarker/ext/jdom/NodeListModel;->access$1100(Ljava/lang/Object;)Lorg/jdom/Element;

    move-result-object v0

    .line 869
    .local v0, "parent":Lorg/jdom/Element;
    if-nez v0, :cond_9

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_8
    return-object v1

    :cond_9
    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_8
.end method
