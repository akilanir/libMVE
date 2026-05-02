.class Lfreemarker/template/utility/DOMNodeModel$AncestorByName;
.super Ljava/lang/Object;
.source "DOMNodeModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/utility/DOMNodeModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AncestorByName"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/template/utility/DOMNodeModel;


# direct methods
.method constructor <init>(Lfreemarker/template/utility/DOMNodeModel;)V
    .registers 2

    .prologue
    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/template/utility/DOMNodeModel$AncestorByName;->this$0:Lfreemarker/template/utility/DOMNodeModel;

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 6
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 266
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_f

    .line 267
    new-instance v2, Lfreemarker/template/TemplateModelException;

    const-string v3, "Expecting exactly one string argument here"

    invoke-direct {v2, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 269
    :cond_f
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 270
    .local v1, "nodeName":Ljava/lang/String;
    iget-object v2, p0, Lfreemarker/template/utility/DOMNodeModel$AncestorByName;->this$0:Lfreemarker/template/utility/DOMNodeModel;

    const-string v3, "parent"

    invoke-virtual {v2, v3}, Lfreemarker/template/utility/DOMNodeModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/utility/DOMNodeModel;

    .line 271
    .local v0, "ancestor":Lfreemarker/template/utility/DOMNodeModel;
    :goto_20
    if-eqz v0, :cond_36

    .line 272
    invoke-virtual {v0}, Lfreemarker/template/utility/DOMNodeModel;->getNodeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 277
    .end local v0    # "ancestor":Lfreemarker/template/utility/DOMNodeModel;
    :goto_2c
    return-object v0

    .line 275
    .restart local v0    # "ancestor":Lfreemarker/template/utility/DOMNodeModel;
    :cond_2d
    const-string v2, "parent"

    invoke-virtual {v0, v2}, Lfreemarker/template/utility/DOMNodeModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .end local v0    # "ancestor":Lfreemarker/template/utility/DOMNodeModel;
    check-cast v0, Lfreemarker/template/utility/DOMNodeModel;

    .restart local v0    # "ancestor":Lfreemarker/template/utility/DOMNodeModel;
    goto :goto_20

    .line 277
    :cond_36
    const/4 v0, 0x0

    goto :goto_2c
.end method
