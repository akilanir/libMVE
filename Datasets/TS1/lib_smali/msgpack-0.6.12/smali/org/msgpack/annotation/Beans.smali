.class public interface abstract annotation Lorg/msgpack/annotation/Beans;
.super Ljava/lang/Object;
.source "Beans.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lorg/msgpack/annotation/Beans;
        value = .enum Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->TYPE:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract value()Lorg/msgpack/template/FieldOption;
.end method
