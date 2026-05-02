.class Lorg/simpleframework/xml/core/TemplateFilter;
.super Ljava/lang/Object;
.source "TemplateFilter.java"

# interfaces
.implements Lorg/simpleframework/xml/filter/Filter;


# instance fields
.field private context:Lorg/simpleframework/xml/core/Context;

.field private filter:Lorg/simpleframework/xml/filter/Filter;


# direct methods
.method public constructor <init>(Lorg/simpleframework/xml/core/Context;Lorg/simpleframework/xml/filter/Filter;)V
    .registers 3
    .param p1, "context"    # Lorg/simpleframework/xml/core/Context;
    .param p2, "filter"    # Lorg/simpleframework/xml/filter/Filter;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/simpleframework/xml/core/TemplateFilter;->context:Lorg/simpleframework/xml/core/Context;

    .line 57
    iput-object p2, p0, Lorg/simpleframework/xml/core/TemplateFilter;->filter:Lorg/simpleframework/xml/filter/Filter;

    .line 58
    return-void
.end method


# virtual methods
.method public replace(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v1, p0, Lorg/simpleframework/xml/core/TemplateFilter;->context:Lorg/simpleframework/xml/core/Context;

    invoke-interface {v1, p1}, Lorg/simpleframework/xml/core/Context;->getAttribute(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 72
    .local v0, "value":Ljava/lang/Object;
    if-eqz v0, :cond_d

    .line 73
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 75
    :goto_c
    return-object v1

    :cond_d
    iget-object v1, p0, Lorg/simpleframework/xml/core/TemplateFilter;->filter:Lorg/simpleframework/xml/filter/Filter;

    invoke-interface {v1, p1}, Lorg/simpleframework/xml/filter/Filter;->replace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_c
.end method
