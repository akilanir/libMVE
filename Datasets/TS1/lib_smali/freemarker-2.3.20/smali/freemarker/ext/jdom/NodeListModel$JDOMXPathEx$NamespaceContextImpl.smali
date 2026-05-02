.class final Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx$NamespaceContextImpl;
.super Ljava/lang/Object;
.source "NodeListModel.java"

# interfaces
.implements Lorg/jaxen/NamespaceContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NamespaceContextImpl"
.end annotation


# instance fields
.field private final namespaces:Ljava/util/Map;


# direct methods
.method constructor <init>(Ljava/util/Map;)V
    .registers 2
    .param p1, "namespaces"    # Ljava/util/Map;

    .prologue
    .line 1302
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1303
    iput-object p1, p0, Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx$NamespaceContextImpl;->namespaces:Ljava/util/Map;

    .line 1304
    return-void
.end method


# virtual methods
.method public translateNamespacePrefixToUri(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 1309
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_7

    .line 1316
    .end local p1    # "prefix":Ljava/lang/String;
    :goto_6
    return-object p1

    .line 1313
    .restart local p1    # "prefix":Ljava/lang/String;
    :cond_7
    iget-object v2, p0, Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx$NamespaceContextImpl;->namespaces:Ljava/util/Map;

    monitor-enter v2

    .line 1315
    :try_start_a
    iget-object v1, p0, Lfreemarker/ext/jdom/NodeListModel$JDOMXPathEx$NamespaceContextImpl;->namespaces:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jdom/Namespace;

    .line 1316
    .local v0, "ns":Lorg/jdom/Namespace;
    if-nez v0, :cond_1a

    const/4 p1, 0x0

    .end local p1    # "prefix":Ljava/lang/String;
    :goto_15
    monitor-exit v2

    goto :goto_6

    .line 1317
    .end local v0    # "ns":Lorg/jdom/Namespace;
    :catchall_17
    move-exception v1

    monitor-exit v2
    :try_end_19
    .catchall {:try_start_a .. :try_end_19} :catchall_17

    throw v1

    .line 1316
    .restart local v0    # "ns":Lorg/jdom/Namespace;
    .restart local p1    # "prefix":Ljava/lang/String;
    :cond_1a
    :try_start_1a
    invoke-virtual {v0}, Lorg/jdom/Namespace;->getURI()Ljava/lang/String;
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_17

    move-result-object p1

    goto :goto_15
.end method
