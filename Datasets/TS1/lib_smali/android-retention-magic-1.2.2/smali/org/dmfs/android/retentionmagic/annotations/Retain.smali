.class public interface abstract annotation Lorg/dmfs/android/retentionmagic/annotations/Retain;
.super Ljava/lang/Object;
.source "Retain.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Lorg/dmfs/android/retentionmagic/annotations/Retain;
        classNS = "."
        instanceNSField = ""
        key = ""
        permanent = false
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
.method public abstract classNS()Ljava/lang/String;
.end method

.method public abstract instanceNSField()Ljava/lang/String;
.end method

.method public abstract key()Ljava/lang/String;
.end method

.method public abstract permanent()Z
.end method
