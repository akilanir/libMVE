.class public Lorg/msgpack/template/FieldList;
.super Ljava/lang/Object;
.source "FieldList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/FieldList$Entry;
    }
.end annotation


# instance fields
.field private list:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/msgpack/template/FieldList$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    .line 55
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 58
    sget-object v0, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    invoke-virtual {p0, p1, v0}, Lorg/msgpack/template/FieldList;->add(Ljava/lang/String;Lorg/msgpack/template/FieldOption;)V

    .line 59
    return-void
.end method

.method public add(Ljava/lang/String;Lorg/msgpack/template/FieldOption;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "option"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    new-instance v1, Lorg/msgpack/template/FieldList$Entry;

    invoke-direct {v1, p1, p2}, Lorg/msgpack/template/FieldList$Entry;-><init>(Ljava/lang/String;Lorg/msgpack/template/FieldOption;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    return-void
.end method

.method public getList()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/msgpack/template/FieldList$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    return-object v0
.end method

.method public put(ILjava/lang/String;)V
    .registers 4
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 66
    sget-object v0, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    invoke-virtual {p0, p1, p2, v0}, Lorg/msgpack/template/FieldList;->put(ILjava/lang/String;Lorg/msgpack/template/FieldOption;)V

    .line 67
    return-void
.end method

.method public put(ILjava/lang/String;Lorg/msgpack/template/FieldOption;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "option"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v0, p1, :cond_25

    .line 72
    :cond_8
    iget-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    new-instance v1, Lorg/msgpack/template/FieldList$Entry;

    invoke-direct {v1}, Lorg/msgpack/template/FieldList$Entry;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 73
    iget-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt v0, p1, :cond_8

    .line 74
    iget-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    new-instance v1, Lorg/msgpack/template/FieldList$Entry;

    invoke-direct {v1, p2, p3}, Lorg/msgpack/template/FieldList$Entry;-><init>(Ljava/lang/String;Lorg/msgpack/template/FieldOption;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    :goto_24
    return-void

    .line 76
    :cond_25
    iget-object v0, p0, Lorg/msgpack/template/FieldList;->list:Ljava/util/ArrayList;

    new-instance v1, Lorg/msgpack/template/FieldList$Entry;

    invoke-direct {v1, p2, p3}, Lorg/msgpack/template/FieldList$Entry;-><init>(Ljava/lang/String;Lorg/msgpack/template/FieldOption;)V

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_24
.end method
