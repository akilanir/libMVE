.class final Lfreemarker/ext/jdom/NodeListModel$DocTypeOp;
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
    name = "DocTypeOp"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 976
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 2
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 976
    invoke-direct {p0}, Lfreemarker/ext/jdom/NodeListModel$DocTypeOp;-><init>()V

    return-void
.end method


# virtual methods
.method public operate(Ljava/lang/Object;)Ljava/util/List;
    .registers 4
    .param p1, "node"    # Ljava/lang/Object;

    .prologue
    .line 979
    instance-of v1, p1, Lorg/jdom/Document;

    if-eqz v1, :cond_14

    .line 980
    check-cast p1, Lorg/jdom/Document;

    .end local p1    # "node":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/jdom/Document;->getDocType()Lorg/jdom/DocType;

    move-result-object v0

    .line 981
    .local v0, "doctype":Lorg/jdom/DocType;
    if-nez v0, :cond_f

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 985
    .end local v0    # "doctype":Lorg/jdom/DocType;
    :goto_e
    return-object v1

    .line 981
    .restart local v0    # "doctype":Lorg/jdom/DocType;
    :cond_f
    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    goto :goto_e

    .line 985
    .end local v0    # "doctype":Lorg/jdom/DocType;
    .restart local p1    # "node":Ljava/lang/Object;
    :cond_14
    const/4 v1, 0x0

    goto :goto_e
.end method
