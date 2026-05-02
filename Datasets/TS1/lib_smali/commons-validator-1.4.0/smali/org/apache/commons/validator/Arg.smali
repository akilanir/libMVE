.class public Lorg/apache/commons/validator/Arg;
.super Ljava/lang/Object;
.source "Arg.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x7bd3779794b67dbeL


# instance fields
.field protected bundle:Ljava/lang/String;

.field protected key:Ljava/lang/String;

.field protected name:Ljava/lang/String;

.field protected position:I

.field protected resource:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object v0, p0, Lorg/apache/commons/validator/Arg;->bundle:Ljava/lang/String;

    .line 52
    iput-object v0, p0, Lorg/apache/commons/validator/Arg;->key:Ljava/lang/String;

    .line 57
    iput-object v0, p0, Lorg/apache/commons/validator/Arg;->name:Ljava/lang/String;

    .line 64
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/validator/Arg;->position:I

    .line 71
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/validator/Arg;->resource:Z

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 79
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 81
    :catch_5
    move-exception v0

    .line 82
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
    .line 92
    iget-object v0, p0, Lorg/apache/commons/validator/Arg;->bundle:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/commons/validator/Arg;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lorg/apache/commons/validator/Arg;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPosition()I
    .registers 2

    .prologue
    .line 116
    iget v0, p0, Lorg/apache/commons/validator/Arg;->position:I

    return v0
.end method

.method public isResource()Z
    .registers 2

    .prologue
    .line 124
    iget-boolean v0, p0, Lorg/apache/commons/validator/Arg;->resource:Z

    return v0
.end method

.method public setBundle(Ljava/lang/String;)V
    .registers 2
    .param p1, "bundle"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/apache/commons/validator/Arg;->bundle:Ljava/lang/String;

    .line 134
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/apache/commons/validator/Arg;->key:Ljava/lang/String;

    .line 142
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 149
    iput-object p1, p0, Lorg/apache/commons/validator/Arg;->name:Ljava/lang/String;

    .line 150
    return-void
.end method

.method public setPosition(I)V
    .registers 2
    .param p1, "position"    # I

    .prologue
    .line 157
    iput p1, p0, Lorg/apache/commons/validator/Arg;->position:I

    .line 158
    return-void
.end method

.method public setResource(Z)V
    .registers 2
    .param p1, "resource"    # Z

    .prologue
    .line 165
    iput-boolean p1, p0, Lorg/apache/commons/validator/Arg;->resource:Z

    .line 166
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 173
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 175
    .local v0, "results":Ljava/lang/StringBuffer;
    const-string v1, "Arg: name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 176
    iget-object v1, p0, Lorg/apache/commons/validator/Arg;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    const-string v1, "  key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 178
    iget-object v1, p0, Lorg/apache/commons/validator/Arg;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 179
    const-string v1, "  position="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 180
    iget v1, p0, Lorg/apache/commons/validator/Arg;->position:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 181
    const-string v1, "  bundle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    iget-object v1, p0, Lorg/apache/commons/validator/Arg;->bundle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 183
    const-string v1, "  resource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 184
    iget-boolean v1, p0, Lorg/apache/commons/validator/Arg;->resource:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 185
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 187
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
