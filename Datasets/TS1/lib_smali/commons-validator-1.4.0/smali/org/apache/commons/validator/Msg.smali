.class public Lorg/apache/commons/validator/Msg;
.super Ljava/lang/Object;
.source "Msg.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x4ef6ff29d5283f94L


# instance fields
.field protected bundle:Ljava/lang/String;

.field protected key:Ljava/lang/String;

.field protected name:Ljava/lang/String;

.field protected resource:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object v0, p0, Lorg/apache/commons/validator/Msg;->bundle:Ljava/lang/String;

    .line 43
    iput-object v0, p0, Lorg/apache/commons/validator/Msg;->key:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lorg/apache/commons/validator/Msg;->name:Ljava/lang/String;

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/validator/Msg;->resource:Z

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 132
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 134
    :catch_5
    move-exception v0

    .line 135
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getBundle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/commons/validator/Msg;->bundle:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/commons/validator/Msg;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/commons/validator/Msg;->name:Ljava/lang/String;

    return-object v0
.end method

.method public isResource()Z
    .registers 2

    .prologue
    .line 114
    iget-boolean v0, p0, Lorg/apache/commons/validator/Msg;->resource:Z

    return v0
.end method

.method public setBundle(Ljava/lang/String;)V
    .registers 2
    .param p1, "bundle"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lorg/apache/commons/validator/Msg;->bundle:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/apache/commons/validator/Msg;->key:Ljava/lang/String;

    .line 106
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/commons/validator/Msg;->name:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public setResource(Z)V
    .registers 2
    .param p1, "resource"    # Z

    .prologue
    .line 123
    iput-boolean p1, p0, Lorg/apache/commons/validator/Msg;->resource:Z

    .line 124
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 144
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 146
    .local v0, "results":Ljava/lang/StringBuffer;
    const-string v1, "Msg: name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 147
    iget-object v1, p0, Lorg/apache/commons/validator/Msg;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 148
    const-string v1, "  key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 149
    iget-object v1, p0, Lorg/apache/commons/validator/Msg;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 150
    const-string v1, "  resource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 151
    iget-boolean v1, p0, Lorg/apache/commons/validator/Msg;->resource:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 152
    const-string v1, "  bundle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 153
    iget-object v1, p0, Lorg/apache/commons/validator/Msg;->bundle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 154
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
