.class final Lfreemarker/ext/jdom/NodeListModel$NameFilter;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "NameFilter"
.end annotation


# instance fields
.field private final this$0:Lfreemarker/ext/jdom/NodeListModel;


# direct methods
.method private constructor <init>(Lfreemarker/ext/jdom/NodeListModel;)V
    .registers 2

    .prologue
    .line 1161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/ext/jdom/NodeListModel$NameFilter;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    return-void
.end method

.method constructor <init>(Lfreemarker/ext/jdom/NodeListModel;Lfreemarker/ext/jdom/NodeListModel$1;)V
    .registers 3
    .param p1, "x0"    # Lfreemarker/ext/jdom/NodeListModel;
    .param p2, "x1"    # Lfreemarker/ext/jdom/NodeListModel$1;

    .prologue
    .line 1161
    invoke-direct {p0, p1}, Lfreemarker/ext/jdom/NodeListModel$NameFilter;-><init>(Lfreemarker/ext/jdom/NodeListModel;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 8
    .param p1, "arguments"    # Ljava/util/List;

    .prologue
    .line 1169
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, p1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 1170
    .local v3, "names":Ljava/util/Set;
    new-instance v1, Ljava/util/LinkedList;

    iget-object v5, p0, Lfreemarker/ext/jdom/NodeListModel$NameFilter;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    invoke-static {v5}, Lfreemarker/ext/jdom/NodeListModel;->access$800(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 1171
    .local v1, "list":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1172
    .local v0, "it":Ljava/util/Iterator;
    :cond_14
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_61

    .line 1173
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 1174
    .local v4, "node":Ljava/lang/Object;
    const/4 v2, 0x0

    .line 1175
    .local v2, "name":Ljava/lang/String;
    instance-of v5, v4, Lorg/jdom/Element;

    if-eqz v5, :cond_35

    .line 1176
    check-cast v4, Lorg/jdom/Element;

    .end local v4    # "node":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/jdom/Element;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1186
    :cond_29
    :goto_29
    if-eqz v2, :cond_31

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_14

    .line 1187
    :cond_31
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_14

    .line 1177
    .restart local v4    # "node":Ljava/lang/Object;
    :cond_35
    instance-of v5, v4, Lorg/jdom/Attribute;

    if-eqz v5, :cond_40

    .line 1178
    check-cast v4, Lorg/jdom/Attribute;

    .end local v4    # "node":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/jdom/Attribute;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_29

    .line 1179
    .restart local v4    # "node":Ljava/lang/Object;
    :cond_40
    instance-of v5, v4, Lorg/jdom/ProcessingInstruction;

    if-eqz v5, :cond_4b

    .line 1180
    check-cast v4, Lorg/jdom/ProcessingInstruction;

    .end local v4    # "node":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/jdom/ProcessingInstruction;->getTarget()Ljava/lang/String;

    move-result-object v2

    goto :goto_29

    .line 1181
    .restart local v4    # "node":Ljava/lang/Object;
    :cond_4b
    instance-of v5, v4, Lorg/jdom/EntityRef;

    if-eqz v5, :cond_56

    .line 1182
    check-cast v4, Lorg/jdom/EntityRef;

    .end local v4    # "node":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/jdom/EntityRef;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_29

    .line 1183
    .restart local v4    # "node":Ljava/lang/Object;
    :cond_56
    instance-of v5, v4, Lorg/jdom/DocType;

    if-eqz v5, :cond_29

    .line 1184
    check-cast v4, Lorg/jdom/DocType;

    .end local v4    # "node":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/jdom/DocType;->getPublicID()Ljava/lang/String;

    move-result-object v2

    goto :goto_29

    .line 1189
    .end local v2    # "name":Ljava/lang/String;
    :cond_61
    iget-object v5, p0, Lfreemarker/ext/jdom/NodeListModel$NameFilter;->this$0:Lfreemarker/ext/jdom/NodeListModel;

    invoke-static {v5}, Lfreemarker/ext/jdom/NodeListModel;->access$900(Lfreemarker/ext/jdom/NodeListModel;)Ljava/util/Map;

    move-result-object v5

    invoke-static {v1, v5}, Lfreemarker/ext/jdom/NodeListModel;->access$2600(Ljava/util/List;Ljava/util/Map;)Lfreemarker/ext/jdom/NodeListModel;

    move-result-object v5

    return-object v5
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 1164
    const/4 v0, 0x0

    return v0
.end method
