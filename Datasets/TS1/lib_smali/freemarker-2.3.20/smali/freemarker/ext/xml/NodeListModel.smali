.class public Lfreemarker/ext/xml/NodeListModel;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;
.implements Lfreemarker/template/TemplateMethodModel;
.implements Lfreemarker/template/TemplateScalarModel;
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Lfreemarker/template/TemplateNodeModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/xml/NodeListModel$1;,
        Lfreemarker/ext/xml/NodeListModel$FilterByType;
    }
.end annotation


# static fields
.field private static final DOM4J_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

.field private static final DOM4J_NODE_CLASS:Ljava/lang/Class;

.field private static final DOM_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

.field private static final DOM_NODE_CLASS:Ljava/lang/Class;

.field private static final JDOM_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

.field private static final logger:Lfreemarker/log/Logger;

.field private static volatile useJaxenNamespaces:Z


# instance fields
.field private namespaces:Lfreemarker/ext/xml/Namespaces;

.field private final navigator:Lfreemarker/ext/xml/Navigator;

.field private final nodes:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 108
    const-string v0, "freemarker.xml"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/xml/NodeListModel;->logger:Lfreemarker/log/Logger;

    .line 110
    const-string v0, "org.w3c.dom.Node"

    invoke-static {v0}, Lfreemarker/ext/xml/NodeListModel;->getClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/xml/NodeListModel;->DOM_NODE_CLASS:Ljava/lang/Class;

    .line 111
    const-string v0, "org.dom4j.Node"

    invoke-static {v0}, Lfreemarker/ext/xml/NodeListModel;->getClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/xml/NodeListModel;->DOM4J_NODE_CLASS:Ljava/lang/Class;

    .line 112
    const-string v0, "Dom"

    invoke-static {v0}, Lfreemarker/ext/xml/NodeListModel;->getNavigator(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/xml/NodeListModel;->DOM_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

    .line 113
    const-string v0, "Dom4j"

    invoke-static {v0}, Lfreemarker/ext/xml/NodeListModel;->getNavigator(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/xml/NodeListModel;->DOM4J_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

    .line 114
    const-string v0, "Jdom"

    invoke-static {v0}, Lfreemarker/ext/xml/NodeListModel;->getNavigator(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/xml/NodeListModel;->JDOM_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

    .line 115
    const/4 v0, 0x1

    sput-boolean v0, Lfreemarker/ext/xml/NodeListModel;->useJaxenNamespaces:Z

    return-void
.end method

.method private constructor <init>(Lfreemarker/ext/xml/Navigator;Ljava/util/List;Lfreemarker/ext/xml/Namespaces;)V
    .registers 4
    .param p1, "navigator"    # Lfreemarker/ext/xml/Navigator;
    .param p2, "nodes"    # Ljava/util/List;
    .param p3, "namespaces"    # Lfreemarker/ext/xml/Namespaces;

    .prologue
    .line 175
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    iput-object p1, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    .line 177
    iput-object p2, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    .line 178
    iput-object p3, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    .line 179
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 5
    .param p1, "nodes"    # Ljava/lang/Object;

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    move-object v0, p1

    .line 138
    .local v0, "node":Ljava/lang/Object;
    instance-of v1, p1, Ljava/util/Collection;

    if-eqz v1, :cond_39

    .line 139
    new-instance v1, Ljava/util/ArrayList;

    check-cast p1, Ljava/util/Collection;

    .end local p1    # "nodes":Ljava/lang/Object;
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    .line 140
    iget-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_31

    const/4 v0, 0x0

    .line 148
    :goto_1a
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->DOM_NODE_CLASS:Ljava/lang/Class;

    if-eqz v1, :cond_4a

    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->DOM_NODE_CLASS:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4a

    .line 149
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->DOM_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

    iput-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    .line 158
    :goto_2a
    invoke-direct {p0}, Lfreemarker/ext/xml/NodeListModel;->createNamespaces()Lfreemarker/ext/xml/Namespaces;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    .line 159
    return-void

    .line 140
    :cond_31
    iget-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1a

    .line 142
    .restart local p1    # "nodes":Ljava/lang/Object;
    :cond_39
    if-eqz p1, :cond_42

    .line 143
    invoke-static {p1}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    goto :goto_1a

    .line 146
    :cond_42
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "nodes == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 151
    .end local p1    # "nodes":Ljava/lang/Object;
    :cond_4a
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->DOM4J_NODE_CLASS:Ljava/lang/Class;

    if-eqz v1, :cond_5b

    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->DOM4J_NODE_CLASS:Ljava/lang/Class;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 152
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->DOM4J_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

    iput-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    goto :goto_2a

    .line 156
    :cond_5b
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->JDOM_NAVIGATOR:Lfreemarker/ext/xml/Navigator;

    iput-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    goto :goto_2a
.end method

.method static access$100(Lfreemarker/ext/xml/NodeListModel;)Lfreemarker/ext/xml/Navigator;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/xml/NodeListModel;

    .prologue
    .line 100
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    return-object v0
.end method

.method static access$200(Lfreemarker/ext/xml/NodeListModel;Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;
    .registers 3
    .param p0, "x0"    # Lfreemarker/ext/xml/NodeListModel;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lfreemarker/ext/xml/NodeListModel;->deriveModel(Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;

    move-result-object v0

    return-object v0
.end method

.method private createNamespaces()Lfreemarker/ext/xml/Namespaces;
    .registers 3

    .prologue
    .line 162
    sget-boolean v1, Lfreemarker/ext/xml/NodeListModel;->useJaxenNamespaces:Z

    if-eqz v1, :cond_15

    .line 164
    :try_start_4
    const-string v1, "freemarker.ext.xml._JaxenNamespaces"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/ext/xml/Namespaces;
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_10} :catch_11

    .line 172
    :goto_10
    return-object v1

    .line 168
    :catch_11
    move-exception v0

    .line 169
    .local v0, "t":Ljava/lang/Throwable;
    const/4 v1, 0x0

    sput-boolean v1, Lfreemarker/ext/xml/NodeListModel;->useJaxenNamespaces:Z

    .line 172
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_15
    new-instance v1, Lfreemarker/ext/xml/Namespaces;

    invoke-direct {v1}, Lfreemarker/ext/xml/Namespaces;-><init>()V

    goto :goto_10
.end method

.method private deriveModel(Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;
    .registers 5
    .param p1, "derivedNodes"    # Ljava/util/List;

    .prologue
    .line 182
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v0}, Lfreemarker/ext/xml/Namespaces;->markShared()V

    .line 183
    new-instance v0, Lfreemarker/ext/xml/NodeListModel;

    iget-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    iget-object v2, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-direct {v0, v1, p1, v2}, Lfreemarker/ext/xml/NodeListModel;-><init>(Lfreemarker/ext/xml/Navigator;Ljava/util/List;Lfreemarker/ext/xml/Namespaces;)V

    return-object v0
.end method

.method private static getClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 5
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    .line 534
    :try_start_0
    invoke-static {p0}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 540
    :goto_4
    return-object v1

    .line 536
    :catch_5
    move-exception v0

    .line 537
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 538
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Couldn\'t load class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 540
    :cond_26
    const/4 v1, 0x0

    goto :goto_4
.end method

.method private static getNavigator(Ljava/lang/String;)Lfreemarker/ext/xml/Navigator;
    .registers 5
    .param p0, "navType"    # Ljava/lang/String;

    .prologue
    .line 546
    :try_start_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "freemarker.ext.xml._"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "Navigator"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/ext/xml/Navigator;
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_23} :catch_24

    .line 553
    :goto_23
    return-object v1

    .line 549
    :catch_24
    move-exception v0

    .line 550
    .local v0, "t":Ljava/lang/Throwable;
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v1}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_45

    .line 551
    sget-object v1, Lfreemarker/ext/xml/NodeListModel;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Could not load navigator for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 553
    :cond_45
    const/4 v1, 0x0

    goto :goto_23
.end method

.method private getUniqueText(Lfreemarker/ext/xml/NodeListModel;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p1, "model"    # Lfreemarker/ext/xml/NodeListModel;
    .param p2, "property"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 582
    const/4 v2, 0x0

    .line 583
    .local v2, "s1":Ljava/lang/String;
    const/4 v1, 0x0

    .line 584
    .local v1, "s":Ljava/util/Set;
    iget-object v4, p1, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :cond_8
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 585
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 586
    .local v3, "s2":Ljava/lang/String;
    if-eqz v3, :cond_8

    .line 588
    if-nez v2, :cond_1a

    .line 589
    move-object v2, v3

    goto :goto_8

    .line 593
    :cond_1a
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 594
    if-nez v1, :cond_2a

    .line 595
    new-instance v1, Ljava/util/HashSet;

    .end local v1    # "s":Ljava/util/Set;
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 596
    .restart local v1    # "s":Ljava/util/Set;
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 598
    :cond_2a
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 603
    .end local v3    # "s2":Ljava/lang/String;
    :cond_2e
    if-nez v1, :cond_31

    .line 604
    return-object v2

    .line 607
    :cond_31
    new-instance v4, Lfreemarker/template/TemplateModelException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Value for node "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " is ambiguos: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private static final removeDuplicates(Ljava/util/List;)Ljava/util/List;
    .registers 8
    .param p0, "list"    # Ljava/util/List;

    .prologue
    .line 519
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .line 520
    .local v2, "s":I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 521
    .local v4, "ulist":Ljava/util/ArrayList;
    new-instance v3, Ljava/util/HashSet;

    mul-int/lit8 v5, v2, 0x4

    div-int/lit8 v5, v5, 0x3

    const/high16 v6, 0x3f400000    # 0.75f

    invoke-direct {v3, v5, v6}, Ljava/util/HashSet;-><init>(IF)V

    .line 522
    .local v3, "set":Ljava/util/Set;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 523
    .local v0, "it":Ljava/util/Iterator;
    :cond_18
    :goto_18
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 524
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 525
    .local v1, "o":Ljava/lang/Object;
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 526
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_18

    .line 529
    .end local v1    # "o":Ljava/lang/Object;
    :cond_2c
    return-object v4
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
    .line 203
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_f

    .line 204
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "Expecting exactly one argument - an XPath expression"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :cond_f
    iget-object v1, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    iget-object v2, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v3, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v1, v2, v0, v3}, Lfreemarker/ext/xml/Navigator;->applyXPath(Ljava/util/List;Ljava/lang/String;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lfreemarker/ext/xml/NodeListModel;->deriveModel(Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;

    move-result-object v0

    return-object v0
.end method

.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 242
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lfreemarker/template/utility/Collections12;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lfreemarker/ext/xml/NodeListModel;->deriveModel(Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 13
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 425
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    invoke-virtual {v8, p1}, Lfreemarker/ext/xml/Navigator;->getOperator(Ljava/lang/String;)Lfreemarker/ext/xml/NodeOperator;

    move-result-object v5

    .line 426
    .local v5, "op":Lfreemarker/ext/xml/NodeOperator;
    const/4 v3, 0x0

    .line 427
    .local v3, "localName":Ljava/lang/String;
    const-string v4, ""

    .line 429
    .local v4, "namespaceUri":Ljava/lang/String;
    if-nez v5, :cond_5e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_5e

    invoke-virtual {p1, v10}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x5f

    if-ne v8, v9, :cond_5e

    .line 430
    const-string v8, "_unique"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2d

    .line 431
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-static {v8}, Lfreemarker/ext/xml/NodeListModel;->removeDuplicates(Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    invoke-direct {p0, v8}, Lfreemarker/ext/xml/NodeListModel;->deriveModel(Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;

    move-result-object v8

    .line 475
    :goto_2c
    return-object v8

    .line 433
    :cond_2d
    const-string v8, "_filterType"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3d

    const-string v8, "_ftype"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_44

    .line 434
    :cond_3d
    new-instance v8, Lfreemarker/ext/xml/NodeListModel$FilterByType;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v9}, Lfreemarker/ext/xml/NodeListModel$FilterByType;-><init>(Lfreemarker/ext/xml/NodeListModel;Lfreemarker/ext/xml/NodeListModel$1;)V

    goto :goto_2c

    .line 436
    :cond_44
    const-string v8, "_registerNamespace"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5e

    .line 437
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v8}, Lfreemarker/ext/xml/Namespaces;->isShared()Z

    move-result v8

    if-eqz v8, :cond_5e

    .line 438
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v8}, Lfreemarker/ext/xml/Namespaces;->clone()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfreemarker/ext/xml/Namespaces;

    iput-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    .line 443
    :cond_5e
    if-nez v5, :cond_7d

    .line 444
    const/16 v8, 0x3a

    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 445
    .local v0, "colon":I
    const/4 v8, -0x1

    if-ne v0, v8, :cond_9d

    .line 447
    move-object v3, p1

    .line 458
    :cond_6a
    invoke-virtual {v3, v10}, Ljava/lang/String;->charAt(I)C

    move-result v8

    const/16 v9, 0x40

    if-ne v8, v9, :cond_ce

    .line 459
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    invoke-virtual {v8}, Lfreemarker/ext/xml/Navigator;->getAttributeOperator()Lfreemarker/ext/xml/NodeOperator;

    move-result-object v5

    .line 460
    const/4 v8, 0x1

    invoke-virtual {v3, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 466
    .end local v0    # "colon":I
    :cond_7d
    :goto_7d
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 467
    .local v7, "result":Ljava/util/List;
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iter":Ljava/util/Iterator;
    :goto_88
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_d5

    .line 469
    :try_start_8e
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v5, v8, v3, v4, v7}, Lfreemarker/ext/xml/NodeOperator;->process(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    :try_end_95
    .catch Ljava/lang/RuntimeException; {:try_start_8e .. :try_end_95} :catch_96

    goto :goto_88

    .line 471
    :catch_96
    move-exception v1

    .line 472
    .local v1, "e":Ljava/lang/RuntimeException;
    new-instance v8, Lfreemarker/template/TemplateModelException;

    invoke-direct {v8, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v8

    .line 451
    .end local v1    # "e":Ljava/lang/RuntimeException;
    .end local v2    # "iter":Ljava/util/Iterator;
    .end local v7    # "result":Ljava/util/List;
    .restart local v0    # "colon":I
    :cond_9d
    add-int/lit8 v8, v0, 0x1

    invoke-virtual {p1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 452
    invoke-virtual {p1, v10, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 453
    .local v6, "prefix":Ljava/lang/String;
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v8, v6}, Lfreemarker/ext/xml/Namespaces;->translateNamespacePrefixToUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 454
    if-nez v4, :cond_6a

    .line 455
    new-instance v8, Lfreemarker/template/TemplateModelException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Namespace prefix "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " is not registered."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 463
    .end local v6    # "prefix":Ljava/lang/String;
    :cond_ce
    iget-object v8, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    invoke-virtual {v8}, Lfreemarker/ext/xml/Navigator;->getChildrenOperator()Lfreemarker/ext/xml/NodeOperator;

    move-result-object v5

    goto :goto_7d

    .line 475
    .end local v0    # "colon":I
    .restart local v2    # "iter":Ljava/util/Iterator;
    .restart local v7    # "result":Ljava/util/List;
    :cond_d5
    invoke-direct {p0, v7}, Lfreemarker/ext/xml/NodeListModel;->deriveModel(Ljava/util/List;)Lfreemarker/ext/xml/NodeListModel;

    move-result-object v8

    goto/16 :goto_2c
.end method

.method public getAsString()Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 222
    new-instance v2, Ljava/io/StringWriter;

    invoke-virtual {p0}, Lfreemarker/ext/xml/NodeListModel;->size()I

    move-result v3

    mul-int/lit16 v3, v3, 0x80

    invoke-direct {v2, v3}, Ljava/io/StringWriter;-><init>(I)V

    .line 223
    .local v2, "sw":Ljava/io/StringWriter;
    iget-object v3, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 224
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 225
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_25

    .line 226
    check-cast v1, Ljava/lang/String;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v2, v1}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    goto :goto_11

    .line 229
    .restart local v1    # "o":Ljava/lang/Object;
    :cond_25
    iget-object v3, p0, Lfreemarker/ext/xml/NodeListModel;->navigator:Lfreemarker/ext/xml/Navigator;

    invoke-virtual {v3, v1, v2}, Lfreemarker/ext/xml/Navigator;->getAsString(Ljava/lang/Object;Ljava/io/StringWriter;)V

    goto :goto_11

    .line 232
    .end local v1    # "o":Ljava/lang/Object;
    :cond_2b
    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getChildNodes()Lfreemarker/template/TemplateSequenceModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 559
    const-string v0, "_content"

    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/NodeListModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateSequenceModel;

    return-object v0
.end method

.method public getNodeName()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 564
    const-string v0, "_name"

    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/NodeListModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/xml/NodeListModel;

    const-string v1, "name"

    invoke-direct {p0, v0, v1}, Lfreemarker/ext/xml/NodeListModel;->getUniqueText(Lfreemarker/ext/xml/NodeListModel;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeNamespace()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 569
    const-string v0, "_nsuri"

    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/NodeListModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/xml/NodeListModel;

    const-string v1, "namespace"

    invoke-direct {p0, v0, v1}, Lfreemarker/ext/xml/NodeListModel;->getUniqueText(Lfreemarker/ext/xml/NodeListModel;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeType()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 574
    const-string v0, "_type"

    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/NodeListModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/xml/NodeListModel;

    const-string v1, "type"

    invoke-direct {p0, v0, v1}, Lfreemarker/ext/xml/NodeListModel;->getUniqueText(Lfreemarker/ext/xml/NodeListModel;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParentNode()Lfreemarker/template/TemplateNodeModel;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 578
    const-string v0, "_parent"

    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/NodeListModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateNodeModel;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 483
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public registerNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 493
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v0}, Lfreemarker/ext/xml/Namespaces;->isShared()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 494
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v0}, Lfreemarker/ext/xml/Namespaces;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/xml/Namespaces;

    iput-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    .line 496
    :cond_12
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->namespaces:Lfreemarker/ext/xml/Namespaces;

    invoke-virtual {v0, p1, p2}, Lfreemarker/ext/xml/Namespaces;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 497
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lfreemarker/ext/xml/NodeListModel;->nodes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
