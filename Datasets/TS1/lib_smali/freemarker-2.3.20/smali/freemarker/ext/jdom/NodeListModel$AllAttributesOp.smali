.class final Lfreemarker/ext/jdom/NodeListModel$AllAttributesOp;
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
    name = "AllAttributesOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 707
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 707
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$AllAttributesOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 712
    instance-of v0, p1, Lorg/jdom/Element;

    if-nez v0, :cond_6

    .line 713
    const/4 v0, 0x0

    .line 715
    .end local p1    # "node":Ljava/lang/Object;
    :goto_5
    return-object v0

    .restart local p1    # "node":Ljava/lang/Object;
    :cond_6
    check-cast p1, Lorg/jdom/Element;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Element;->getAttributes()Ljava/util/List;

    move-result-object v0

    goto :goto_5
.end method
