.class public interface abstract annotation Lnl/qbusict/cupboard/annotation/Index;
.super Ljava/lang/Object;
.source "Index.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lnl/qbusict/cupboard/annotation/Index;
        indexNames = {}
        unique = false
        uniqueNames = {}
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->FIELD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract indexNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;
.end method

.method public abstract unique()Z
.end method

.method public abstract uniqueNames()[Lnl/qbusict/cupboard/annotation/CompositeIndex;
.end method
