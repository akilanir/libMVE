.class public Ljavassist/bytecode/annotation/AnnotationMemberValue;
.super Ljavassist/bytecode/annotation/MemberValue;
.source "AnnotationMemberValue.java"


# instance fields
.field value:Ljavassist/bytecode/annotation/Annotation;


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Ljavassist/bytecode/annotation/AnnotationMemberValue;-><init>(Ljavassist/bytecode/annotation/Annotation;Ljavassist/bytecode/ConstPool;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/annotation/Annotation;Ljavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "a"    # Ljavassist/bytecode/annotation/Annotation;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 44
    const/16 v0, 0x40

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/MemberValue;-><init>(CLjavassist/bytecode/ConstPool;)V

    .line 45
    iput-object p1, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    .line 46
    return-void
.end method


# virtual methods
.method public accept(Ljavassist/bytecode/annotation/MemberValueVisitor;)V
    .registers 2
    .param p1, "visitor"    # Ljavassist/bytecode/annotation/MemberValueVisitor;

    .prologue
    .line 94
    invoke-interface {p1, p0}, Ljavassist/bytecode/annotation/MemberValueVisitor;->visitAnnotationMemberValue(Ljavassist/bytecode/annotation/AnnotationMemberValue;)V

    .line 95
    return-void
.end method

.method getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 4
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    if-nez v0, :cond_c

    .line 56
    new-instance v0, Ljava/lang/ClassNotFoundException;

    const-string v1, "no type specified"

    invoke-direct {v0, v1}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_c
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v0}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Ljavassist/bytecode/annotation/AnnotationMemberValue;->loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method getValue(Ljava/lang/ClassLoader;Ljavassist/ClassPool;Ljava/lang/reflect/Method;)Ljava/lang/Object;
    .registers 6
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .param p3, "m"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 51
    invoke-virtual {p0, p1}, Ljavassist/bytecode/annotation/AnnotationMemberValue;->getType(Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    invoke-static {p1, v0, p2, v1}, Ljavassist/bytecode/annotation/AnnotationImpl;->make(Ljava/lang/ClassLoader;Ljava/lang/Class;Ljavassist/ClassPool;Ljavassist/bytecode/annotation/Annotation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljavassist/bytecode/annotation/Annotation;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    return-object v0
.end method

.method public setValue(Ljavassist/bytecode/annotation/Annotation;)V
    .registers 2
    .param p1, "newValue"    # Ljavassist/bytecode/annotation/Annotation;

    .prologue
    .line 72
    iput-object p1, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    .line 73
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v0}, Ljavassist/bytecode/annotation/Annotation;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V
    .registers 3
    .param p1, "writer"    # Ljavassist/bytecode/annotation/AnnotationsWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-virtual {p1}, Ljavassist/bytecode/annotation/AnnotationsWriter;->annotationValue()V

    .line 87
    iget-object v0, p0, Ljavassist/bytecode/annotation/AnnotationMemberValue;->value:Ljavassist/bytecode/annotation/Annotation;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/annotation/Annotation;->write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V

    .line 88
    return-void
.end method
