.class Lcom/google/common/reflect/Element;
.super Ljava/lang/reflect/AccessibleObject;
.source "Element.java"

# interfaces
.implements Ljava/lang/reflect/Member;


# instance fields
.field private final accessibleObject:Ljava/lang/reflect/AccessibleObject;

.field private final member:Ljava/lang/reflect/Member;


# direct methods
.method constructor <init>(Ljava/lang/reflect/AccessibleObject;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<M:",
            "Ljava/lang/reflect/AccessibleObject;",
            ":",
            "Ljava/lang/reflect/Member;",
            ">(TM;)V"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "member":Ljava/lang/reflect/AccessibleObject;, "TM;"
    invoke-direct {p0}, Ljava/lang/reflect/AccessibleObject;-><init>()V

    .line 43
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    iput-object p1, p0, Lcom/google/common/reflect/Element;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    .line 45
    check-cast p1, Ljava/lang/reflect/Member;

    .end local p1    # "member":Ljava/lang/reflect/AccessibleObject;, "TM;"
    iput-object p1, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    .line 46
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 150
    instance-of v1, p1, Lcom/google/common/reflect/Element;

    if-eqz v1, :cond_10

    move-object v0, p1

    .line 151
    check-cast v0, Lcom/google/common/reflect/Element;

    .line 152
    .local v0, "that":Lcom/google/common/reflect/Element;
    iget-object v1, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    iget-object v2, v0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 154
    .end local v0    # "that":Lcom/google/common/reflect/Element;
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public final getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TA;>;)TA;"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<TA;>;"
    iget-object v0, p0, Lcom/google/common/reflect/Element;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/AccessibleObject;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public final getAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/common/reflect/Element;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public final getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lcom/google/common/reflect/Element;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;

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
    .line 73
    iget-object v0, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public final getModifiers()I
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getModifiers()I

    move-result v0

    return v0
.end method

.method public final getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public final isAbstract()Z
    .registers 2

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v0

    return v0
.end method

.method public final isAccessible()Z
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/google/common/reflect/Element;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {v0}, Ljava/lang/reflect/AccessibleObject;->isAccessible()Z

    move-result v0

    return v0
.end method

.method public final isAnnotationPresent(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    iget-object v0, p0, Lcom/google/common/reflect/Element;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/AccessibleObject;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    return v0
.end method

.method public final isFinal()Z
    .registers 2

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v0

    return v0
.end method

.method public final isNative()Z
    .registers 2

    .prologue
    .line 131
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isNative(I)Z

    move-result v0

    return v0
.end method

.method public final isPackagePrivate()Z
    .registers 2

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->isPrivate()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->isPublic()Z

    move-result v0

    if-nez v0, :cond_14

    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->isProtected()Z

    move-result v0

    if-nez v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public final isPrivate()Z
    .registers 2

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPrivate(I)Z

    move-result v0

    return v0
.end method

.method public final isProtected()Z
    .registers 2

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isProtected(I)Z

    move-result v0

    return v0
.end method

.method public final isPublic()Z
    .registers 2

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    return v0
.end method

.method public final isStatic()Z
    .registers 2

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    return v0
.end method

.method public final isSynchronized()Z
    .registers 2

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isSynchronized(I)Z

    move-result v0

    return v0
.end method

.method public final isSynthetic()Z
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    invoke-interface {v0}, Ljava/lang/reflect/Member;->isSynthetic()Z

    move-result v0

    return v0
.end method

.method final isTransient()Z
    .registers 2

    .prologue
    .line 146
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v0

    return v0
.end method

.method final isVolatile()Z
    .registers 2

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/google/common/reflect/Element;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isVolatile(I)Z

    move-result v0

    return v0
.end method

.method public final setAccessible(Z)V
    .registers 3
    .param p1, "flag"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lcom/google/common/reflect/Element;->accessibleObject:Ljava/lang/reflect/AccessibleObject;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 66
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/google/common/reflect/Element;->member:Ljava/lang/reflect/Member;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
