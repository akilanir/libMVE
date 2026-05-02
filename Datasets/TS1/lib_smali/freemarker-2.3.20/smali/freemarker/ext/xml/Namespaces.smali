.class Lfreemarker/ext/xml/Namespaces;
.super Ljava/lang/Object;
.source "Namespaces.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModel;
.implements Ljava/lang/Cloneable;


# instance fields
.field private namespaces:Ljava/util/HashMap;

.field private shared:Z


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    .line 74
    iget-object v0, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    const-string v1, ""

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    iget-object v0, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    const-string v1, "xml"

    const-string v2, "http://www.w3.org/XML/1998/namespace"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/ext/xml/Namespaces;->shared:Z

    .line 77
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 81
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/xml/Namespaces;

    .line 82
    .local v0, "clone":Lfreemarker/ext/xml/Namespaces;
    iget-object v2, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    iput-object v2, v0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    .line 83
    const/4 v2, 0x0

    iput-boolean v2, v0, Lfreemarker/ext/xml/Namespaces;->shared:Z
    :try_end_13
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_13} :catch_14

    .line 84
    return-object v0

    .line 86
    .end local v0    # "clone":Lfreemarker/ext/xml/Namespaces;
    :catch_14
    move-exception v1

    .line 87
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/Error;

    invoke-direct {v2}, Ljava/lang/Error;-><init>()V

    throw v2
.end method

.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 4
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 98
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_f

    .line 99
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v1, "_registerNamespace(prefix, uri) requires two arguments"

    invoke-direct {v0, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_f
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lfreemarker/ext/xml/Namespaces;->registerNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    sget-object v0, Lfreemarker/template/TemplateScalarModel;->EMPTY_STRING:Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method isShared()Z
    .registers 2

    .prologue
    .line 118
    iget-boolean v0, p0, Lfreemarker/ext/xml/Namespaces;->shared:Z

    return v0
.end method

.method markShared()V
    .registers 2

    .prologue
    .line 112
    iget-boolean v0, p0, Lfreemarker/ext/xml/Namespaces;->shared:Z

    if-nez v0, :cond_7

    .line 113
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/ext/xml/Namespaces;->shared:Z

    .line 115
    :cond_7
    return-void
.end method

.method registerNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-object v1, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    monitor-enter v1

    .line 107
    :try_start_3
    iget-object v0, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    monitor-exit v1

    .line 109
    return-void

    .line 108
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public translateNamespacePrefixToUri(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 92
    iget-object v1, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    monitor-enter v1

    .line 93
    :try_start_3
    iget-object v0, p0, Lfreemarker/ext/xml/Namespaces;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 94
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method
