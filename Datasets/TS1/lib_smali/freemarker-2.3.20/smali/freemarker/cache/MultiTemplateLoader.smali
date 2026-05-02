.class public Lfreemarker/cache/MultiTemplateLoader;
.super Ljava/lang/Object;
.source "MultiTemplateLoader.java"

# interfaces
.implements Lfreemarker/cache/StatefulTemplateLoader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/cache/MultiTemplateLoader$MultiSource;
    }
.end annotation


# instance fields
.field private final lastLoaderForName:Ljava/util/Map;

.field private final loaders:[Lfreemarker/cache/TemplateLoader;


# direct methods
.method public constructor <init>([Lfreemarker/cache/TemplateLoader;)V
    .registers 3
    .param p1, "loaders"    # [Lfreemarker/cache/TemplateLoader;

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/cache/MultiTemplateLoader;->lastLoaderForName:Ljava/util/Map;

    .line 87
    invoke-virtual {p1}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lfreemarker/cache/TemplateLoader;

    check-cast v0, [Lfreemarker/cache/TemplateLoader;

    iput-object v0, p0, Lfreemarker/cache/MultiTemplateLoader;->loaders:[Lfreemarker/cache/TemplateLoader;

    .line 88
    return-void
.end method


# virtual methods
.method public closeTemplateSource(Ljava/lang/Object;)V
    .registers 2
    .param p1, "templateSource"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    check-cast p1, Lfreemarker/cache/MultiTemplateLoader$MultiSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->close()V

    .line 143
    return-void
.end method

.method public findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v4, p0, Lfreemarker/cache/MultiTemplateLoader;->lastLoaderForName:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/cache/TemplateLoader;

    .line 97
    .local v1, "lastLoader":Lfreemarker/cache/TemplateLoader;
    if-eqz v1, :cond_16

    .line 99
    invoke-interface {v1, p1}, Lfreemarker/cache/TemplateLoader;->findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 100
    .local v3, "source":Ljava/lang/Object;
    if-eqz v3, :cond_16

    .line 102
    new-instance v4, Lfreemarker/cache/MultiTemplateLoader$MultiSource;

    invoke-direct {v4, v3, v1}, Lfreemarker/cache/MultiTemplateLoader$MultiSource;-><init>(Ljava/lang/Object;Lfreemarker/cache/TemplateLoader;)V

    .line 123
    .end local v3    # "source":Ljava/lang/Object;
    :goto_15
    return-object v4

    .line 110
    :cond_16
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    iget-object v4, p0, Lfreemarker/cache/MultiTemplateLoader;->loaders:[Lfreemarker/cache/TemplateLoader;

    array-length v4, v4

    if-ge v0, v4, :cond_34

    .line 112
    iget-object v4, p0, Lfreemarker/cache/MultiTemplateLoader;->loaders:[Lfreemarker/cache/TemplateLoader;

    aget-object v2, v4, v0

    .line 113
    .local v2, "loader":Lfreemarker/cache/TemplateLoader;
    invoke-interface {v2, p1}, Lfreemarker/cache/TemplateLoader;->findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 114
    .restart local v3    # "source":Ljava/lang/Object;
    if-eqz v3, :cond_31

    .line 116
    iget-object v4, p0, Lfreemarker/cache/MultiTemplateLoader;->lastLoaderForName:Ljava/util/Map;

    invoke-interface {v4, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    new-instance v4, Lfreemarker/cache/MultiTemplateLoader$MultiSource;

    invoke-direct {v4, v3, v2}, Lfreemarker/cache/MultiTemplateLoader$MultiSource;-><init>(Ljava/lang/Object;Lfreemarker/cache/TemplateLoader;)V

    goto :goto_15

    .line 110
    :cond_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 121
    .end local v2    # "loader":Lfreemarker/cache/TemplateLoader;
    .end local v3    # "source":Ljava/lang/Object;
    :cond_34
    iget-object v4, p0, Lfreemarker/cache/MultiTemplateLoader;->lastLoaderForName:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    const/4 v4, 0x0

    goto :goto_15
.end method

.method public getLastModified(Ljava/lang/Object;)J
    .registers 4
    .param p1, "templateSource"    # Ljava/lang/Object;

    .prologue
    .line 128
    check-cast p1, Lfreemarker/cache/MultiTemplateLoader$MultiSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1}, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->getLastModified()J

    move-result-wide v0

    return-wide v0
.end method

.method public getReader(Ljava/lang/Object;Ljava/lang/String;)Ljava/io/Reader;
    .registers 4
    .param p1, "templateSource"    # Ljava/lang/Object;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    check-cast p1, Lfreemarker/cache/MultiTemplateLoader$MultiSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-virtual {p1, p2}, Lfreemarker/cache/MultiTemplateLoader$MultiSource;->getReader(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method public resetState()V
    .registers 4

    .prologue
    .line 147
    iget-object v2, p0, Lfreemarker/cache/MultiTemplateLoader;->lastLoaderForName:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 148
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    iget-object v2, p0, Lfreemarker/cache/MultiTemplateLoader;->loaders:[Lfreemarker/cache/TemplateLoader;

    array-length v2, v2

    if-ge v0, v2, :cond_1b

    .line 149
    iget-object v2, p0, Lfreemarker/cache/MultiTemplateLoader;->loaders:[Lfreemarker/cache/TemplateLoader;

    aget-object v1, v2, v0

    .line 150
    .local v1, "loader":Lfreemarker/cache/TemplateLoader;
    instance-of v2, v1, Lfreemarker/cache/StatefulTemplateLoader;

    if-eqz v2, :cond_18

    .line 151
    check-cast v1, Lfreemarker/cache/StatefulTemplateLoader;

    .end local v1    # "loader":Lfreemarker/cache/TemplateLoader;
    invoke-interface {v1}, Lfreemarker/cache/StatefulTemplateLoader;->resetState()V

    .line 148
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 154
    :cond_1b
    return-void
.end method
