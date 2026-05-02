.class public Lorg/junit/runners/model/FrameworkField;
.super Lorg/junit/runners/model/FrameworkMember;
.source "FrameworkField.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/junit/runners/model/FrameworkMember",
        "<",
        "Lorg/junit/runners/model/FrameworkField;",
        ">;"
    }
.end annotation


# instance fields
.field private final field:Ljava/lang/reflect/Field;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Field;)V
    .registers 4
    .param p1, "field"    # Ljava/lang/reflect/Field;

    .prologue
    .line 17
    invoke-direct {p0}, Lorg/junit/runners/model/FrameworkMember;-><init>()V

    .line 18
    if-nez p1, :cond_d

    .line 19
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "FrameworkField cannot be created without an underlying field."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_d
    iput-object p1, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    .line 23
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "annotationType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public getDeclaringClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getField()Ljava/lang/reflect/Field;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method protected getModifiers()I
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkField;->getField()Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public isShadowedBy(Lorg/junit/runners/model/FrameworkField;)Z
    .registers 4
    .param p1, "otherMember"    # Lorg/junit/runners/model/FrameworkField;

    .prologue
    .line 40
    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkField;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkField;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isShadowedBy(Lorg/junit/runners/model/FrameworkMember;)Z
    .registers 3
    .param p1, "x0"    # Lorg/junit/runners/model/FrameworkMember;

    .prologue
    .line 14
    check-cast p1, Lorg/junit/runners/model/FrameworkField;

    .end local p1    # "x0":Lorg/junit/runners/model/FrameworkMember;
    invoke-virtual {p0, p1}, Lorg/junit/runners/model/FrameworkField;->isShadowedBy(Lorg/junit/runners/model/FrameworkField;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkField;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
