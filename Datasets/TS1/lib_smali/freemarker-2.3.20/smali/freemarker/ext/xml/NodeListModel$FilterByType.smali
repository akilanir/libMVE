.class Lfreemarker/ext/xml/NodeListModel$FilterByType;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/xml/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FilterByType"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/ext/xml/NodeListModel;


# direct methods
.method private constructor <init>(Lfreemarker/ext/xml/NodeListModel;)V
    .registers 2

    .prologue
    .line 499
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/xml/NodeListModel$FilterByType;->this$0:Lfreemarker/ext/xml/NodeListModel;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/xml/NodeListModel;Lfreemarker/ext/xml/NodeListModel$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/xml/NodeListModel;
    .param p2, "x1"    # Lfreemarker/ext/xml/NodeListModel$1;

    .prologue
    .line 499
    invoke-direct {p0, p1}, Lfreemarker/ext/xml/NodeListModel$FilterByType;-><init>(Lfreemarker/ext/xml/NodeListModel;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 6
    .param p1, "arguments"    # Ljava/util/List;

    .prologue
    .line 505
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 506
    .local v0, "filteredNodes":Ljava/util/List;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 508
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 509
    .local v2, "node":Ljava/lang/Object;
    iget-object v3, p0, Lfreemarker/ext/xml/NodeListModel$FilterByType;->this$0:Lfreemarker/ext/xml/NodeListModel;

    invoke-static {v3}, Lfreemarker/ext/xml/NodeListModel;->access$100(Lfreemarker/ext/xml/NodeListModel;)Lfreemarker/ext/xml/Navigator;

    move-result-object v3

    invoke-virtual {v3, v2}, Lfreemarker/ext/xml/Navigator;->getType(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 510
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 513
    .end local v2    # "node":Ljava/lang/Object;
    :cond_27
    iget-object v3, p0, Lfreemarker/ext/xml/NodeListModel$FilterByType;->this$0:Lfreemarker/ext/xml/NodeListModel;

    invoke-static {v3, v0}, Lfreemarker/ext/xml/NodeListModel;->access$200(Lfreemarker/ext/xml/NodeListModel;Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;

    move-result-object v3

    return-object v3
.end method
