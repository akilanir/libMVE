.class public Lorg/apache/commons/validator/Var;
.super Ljava/lang/Object;
.source "Var.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final JSTYPE_INT:Ljava/lang/String; = "int"

.field public static final JSTYPE_REGEXP:Ljava/lang/String; = "regexp"

.field public static final JSTYPE_STRING:Ljava/lang/String; = "string"


# instance fields
.field private bundle:Ljava/lang/String;

.field private jsType:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private resource:Z

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->name:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->value:Ljava/lang/String;

    .line 61
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->jsType:Ljava/lang/String;

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/validator/Var;->resource:Z

    .line 71
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->bundle:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "jsType"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->name:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->value:Ljava/lang/String;

    .line 61
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->jsType:Ljava/lang/String;

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/validator/Var;->resource:Z

    .line 71
    iput-object v1, p0, Lorg/apache/commons/validator/Var;->bundle:Ljava/lang/String;

    .line 88
    iput-object p1, p0, Lorg/apache/commons/validator/Var;->name:Ljava/lang/String;

    .line 89
    iput-object p2, p0, Lorg/apache/commons/validator/Var;->value:Ljava/lang/String;

    .line 90
    iput-object p3, p0, Lorg/apache/commons/validator/Var;->jsType:Ljava/lang/String;

    .line 91
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 183
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 185
    :catch_5
    move-exception v0

    .line 186
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
    .line 149
    iget-object v0, p0, Lorg/apache/commons/validator/Var;->bundle:Ljava/lang/String;

    return-object v0
.end method

.method public getJsType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lorg/apache/commons/validator/Var;->jsType:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lorg/apache/commons/validator/Var;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/apache/commons/validator/Var;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isResource()Z
    .registers 2

    .prologue
    .line 131
    iget-boolean v0, p0, Lorg/apache/commons/validator/Var;->resource:Z

    return v0
.end method

.method public setBundle(Ljava/lang/String;)V
    .registers 2
    .param p1, "bundle"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lorg/apache/commons/validator/Var;->bundle:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public setJsType(Ljava/lang/String;)V
    .registers 2
    .param p1, "jsType"    # Ljava/lang/String;

    .prologue
    .line 174
    iput-object p1, p0, Lorg/apache/commons/validator/Var;->jsType:Ljava/lang/String;

    .line 175
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lorg/apache/commons/validator/Var;->name:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setResource(Z)V
    .registers 2
    .param p1, "resource"    # Z

    .prologue
    .line 140
    iput-boolean p1, p0, Lorg/apache/commons/validator/Var;->resource:Z

    .line 141
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 122
    iput-object p1, p0, Lorg/apache/commons/validator/Var;->value:Ljava/lang/String;

    .line 123
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 195
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 197
    .local v0, "results":Ljava/lang/StringBuffer;
    const-string v1, "Var: name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 198
    iget-object v1, p0, Lorg/apache/commons/validator/Var;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 199
    const-string v1, "  value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 200
    iget-object v1, p0, Lorg/apache/commons/validator/Var;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 201
    const-string v1, "  resource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 202
    iget-boolean v1, p0, Lorg/apache/commons/validator/Var;->resource:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 203
    iget-boolean v1, p0, Lorg/apache/commons/validator/Var;->resource:Z

    if-eqz v1, :cond_31

    .line 204
    const-string v1, "  bundle="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 205
    iget-object v1, p0, Lorg/apache/commons/validator/Var;->bundle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 207
    :cond_31
    const-string v1, "  jsType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 208
    iget-object v1, p0, Lorg/apache/commons/validator/Var;->jsType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 209
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 211
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
