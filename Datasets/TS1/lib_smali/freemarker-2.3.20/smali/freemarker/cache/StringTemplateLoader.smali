.class public Lfreemarker/cache/StringTemplateLoader;
.super Ljava/lang/Object;
.source "StringTemplateLoader.java"

# interfaces
.implements Lfreemarker/cache/TemplateLoader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;
    }
.end annotation


# instance fields
.field private final templates:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/cache/StringTemplateLoader;->templates:Ljava/util/Map;

    .line 144
    return-void
.end method


# virtual methods
.method public closeTemplateSource(Ljava/lang/Object;)V
    .registers 2
    .param p1, "templateSource"    # Ljava/lang/Object;

    .prologue
    .line 130
    return-void
.end method

.method public findTemplateSource(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 133
    iget-object v0, p0, Lfreemarker/cache/StringTemplateLoader;->templates:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getLastModified(Ljava/lang/Object;)J
    .registers 4
    .param p1, "templateSource"    # Ljava/lang/Object;

    .prologue
    .line 137
    check-cast p1, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->access$000(Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getReader(Ljava/lang/Object;Ljava/lang/String;)Ljava/io/Reader;
    .registers 5
    .param p1, "templateSource"    # Ljava/lang/Object;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 141
    new-instance v0, Ljava/io/StringReader;

    check-cast p1, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;

    .end local p1    # "templateSource":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;->access$100(Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public putTemplate(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "templateSource"    # Ljava/lang/String;

    .prologue
    .line 107
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lfreemarker/cache/StringTemplateLoader;->putTemplate(Ljava/lang/String;Ljava/lang/String;J)V

    .line 108
    return-void
.end method

.method public putTemplate(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "templateSource"    # Ljava/lang/String;
    .param p3, "lastModified"    # J

    .prologue
    .line 126
    iget-object v0, p0, Lfreemarker/cache/StringTemplateLoader;->templates:Ljava/util/Map;

    new-instance v1, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;

    invoke-direct {v1, p1, p2, p3, p4}, Lfreemarker/cache/StringTemplateLoader$StringTemplateSource;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    return-void
.end method
